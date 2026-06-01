-- Optional Knowledge Graph layer for the AI service.
-- Run this after public/ai-view.sql. It exposes graph-style entities and
-- relations derived from the trusted ai_view materialized views.

BEGIN;

CREATE SCHEMA IF NOT EXISTS ai_kg;

DROP VIEW IF EXISTS ai_kg.relations;
DROP VIEW IF EXISTS ai_kg.entities;

CREATE VIEW ai_kg.entities AS
SELECT 'product:' || id::text AS kg_id,
       'product' AS entity_type,
       'ai_view.products' AS source_table,
       id::text AS source_id,
       code,
       name,
       jsonb_build_object(
           'price', price,
           'status', status,
           'rated', rated,
           'quantity_sold', quantity_sold,
           'category_id', category_id,
           'provider_id', provider_id,
           'updated_at', updated_at
       ) AS metadata
FROM ai_view.products
UNION ALL
SELECT 'category:' || id::text AS kg_id,
       'category' AS entity_type,
       'ai_view.categories' AS source_table,
       id::text AS source_id,
       code,
       name,
       jsonb_build_object(
           'parent_id', parent_id,
           'is_leaf', is_leaf,
           'level', level,
           'path', path,
           'updated_at', updated_at
       ) AS metadata
FROM ai_view.categories
UNION ALL
SELECT 'provider:' || id::text AS kg_id,
       'provider' AS entity_type,
       'ai_view.providers' AS source_table,
       id::text AS source_id,
       code,
       name,
       jsonb_build_object(
           'status', status,
           'updated_at', updated_at
       ) AS metadata
FROM ai_view.providers
UNION ALL
SELECT 'size:' || id::text AS kg_id,
       'size' AS entity_type,
       'ai_view.size_chart' AS source_table,
       id::text AS source_id,
       size AS code,
       size AS name,
       jsonb_build_object(
           'weight', weight,
           'height', height,
           'updated_at', updated_at
       ) AS metadata
FROM ai_view.size_chart
UNION ALL
SELECT 'voucher:' || id::text AS kg_id,
       'voucher' AS entity_type,
       'ai_view.vouchers' AS source_table,
       id::text AS source_id,
       code,
       code AS name,
       jsonb_build_object(
           'discount_type', discount_type,
           'voucher_type', voucher_type,
           'value', value,
           'min_order_amount', min_order_amount,
           'start_at', start_at,
           'end_at', end_at
       ) AS metadata
FROM ai_view.vouchers
UNION ALL
SELECT 'promotion:' || id::text AS kg_id,
       'promotion' AS entity_type,
       'ai_view.promotions' AS source_table,
       id::text AS source_id,
       scope AS code,
       scope AS name,
       jsonb_build_object(
           'value', value,
           'priority', priority,
           'start_at', start_at,
           'end_at', end_at
       ) AS metadata
FROM ai_view.promotions;

CREATE VIEW ai_kg.relations AS
SELECT 'product:' || p.id::text AS subject_id,
       'BELONGS_TO' AS predicate,
       'category:' || p.category_id::text AS object_id,
       jsonb_build_object('category_name', p.category_name, 'category_code', p.category_code) AS properties,
       p.updated_at AS updated_at
FROM ai_view.products p
WHERE p.category_id IS NOT NULL
UNION ALL
SELECT 'product:' || p.id::text AS subject_id,
       'PROVIDED_BY' AS predicate,
       'provider:' || p.provider_id::text AS object_id,
       jsonb_build_object('provider_name', p.provider_name, 'provider_code', p.provider_code) AS properties,
       p.updated_at AS updated_at
FROM ai_view.products p
WHERE p.provider_id IS NOT NULL
UNION ALL
SELECT 'category:' || c.id::text AS subject_id,
       'PARENT_CATEGORY' AS predicate,
       'category:' || c.parent_id::text AS object_id,
       jsonb_build_object('path', c.path, 'level', c.level) AS properties,
       c.updated_at AS updated_at
FROM ai_view.categories c
WHERE c.parent_id IS NOT NULL
UNION ALL
SELECT 'product:' || i.product_id::text AS subject_id,
       'HAS_SIZE' AS predicate,
       'size:' || i.size_id::text AS object_id,
       jsonb_build_object(
           'product_code', i.product_code,
           'product_name', i.product_name,
           'size', i.size,
           'quantity', i.quantity,
           'inventory_status', i.inventory_status
       ) AS properties,
       now() AS updated_at
FROM ai_view.inventory i
UNION ALL
SELECT 'product:' || r.product_id::text AS subject_id,
       'HAS_REVIEW' AS predicate,
       'review:' || r.review_id::text AS object_id,
       jsonb_build_object(
           'product_code', r.product_code,
           'product_name', r.product_name,
           'rating', r.rating,
           'content', r.content,
           'created_at', r.created_at
       ) AS properties,
       r.created_at AS updated_at
FROM ai_view.product_reviews r
UNION ALL
SELECT 'voucher:' || v.id::text AS subject_id,
       'APPLIES_TO' AS predicate,
       'scope:GLOBAL' AS object_id,
       jsonb_build_object(
           'discount_type', v.discount_type,
           'value', v.value,
           'min_order_amount', v.min_order_amount,
           'start_at', v.start_at,
           'end_at', v.end_at
       ) AS properties,
       now() AS updated_at
FROM ai_view.vouchers v
UNION ALL
SELECT 'promotion:' || p.id::text AS subject_id,
       'APPLIES_TO' AS predicate,
       'scope:' || COALESCE(p.scope, 'UNKNOWN') AS object_id,
       jsonb_build_object(
           'scope', p.scope,
           'value', p.value,
           'priority', p.priority,
           'start_at', p.start_at,
           'end_at', p.end_at
       ) AS properties,
       now() AS updated_at
FROM ai_view.promotions p;

GRANT USAGE ON SCHEMA ai_kg TO ai_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA ai_kg TO ai_reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA ai_kg
    GRANT SELECT ON TABLES TO ai_reader;

COMMIT;
