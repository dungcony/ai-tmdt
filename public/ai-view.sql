-- Run this after importing public/db-original.sql into database tmdt.
-- This creates the read-only materialized-view layer used by the AI service.

BEGIN;

CREATE SCHEMA IF NOT EXISTS ai_view;

DROP MATERIALIZED VIEW IF EXISTS ai_view.inventory;
DROP MATERIALIZED VIEW IF EXISTS ai_view.product_reviews;
DROP MATERIALIZED VIEW IF EXISTS ai_view.size_chart;
DROP MATERIALIZED VIEW IF EXISTS ai_view.vouchers;
DROP MATERIALIZED VIEW IF EXISTS ai_view.promotions;
DROP MATERIALIZED VIEW IF EXISTS ai_view.products;
DROP MATERIALIZED VIEW IF EXISTS ai_view.providers;
DROP MATERIALIZED VIEW IF EXISTS ai_view.categories;

CREATE MATERIALIZED VIEW ai_view.categories AS
SELECT id,
       name,
       code,
       img_url,
       description,
       status,
       parent_id,
       is_leaf,
       level,
       path,
       created_at,
       updated_at
FROM public.tbl_categories
WHERE status = 'ACTIVE'
WITH DATA;

CREATE UNIQUE INDEX ai_view_categories_uidx ON ai_view.categories (id);
CREATE INDEX ai_view_categories_code_idx ON ai_view.categories (code);
CREATE INDEX ai_view_categories_parent_idx ON ai_view.categories (parent_id);

CREATE MATERIALIZED VIEW ai_view.providers AS
SELECT id,
       name,
       code,
       description,
       status,
       logo,
       created_at,
       updated_at
FROM public.tbl_providers
WHERE status <> 'INACTIVE'
WITH DATA;

CREATE UNIQUE INDEX ai_view_providers_uidx ON ai_view.providers (id);
CREATE INDEX ai_view_providers_code_idx ON ai_view.providers (code);

CREATE MATERIALIZED VIEW ai_view.products AS
SELECT p.id,
       p.name,
       p.code,
       p.description,
       p.price,
       p.status,
       p.rated,
       p.quantity_sold,
       p.img,
       p.video,
       p.category_id,
       c.name  AS category_name,
       c.code  AS category_code,
       p.provider_id,
       pr.name AS provider_name,
       pr.code AS provider_code,
       p.created_at,
       p.updated_at
FROM public.tbl_products p
         LEFT JOIN public.tbl_categories c ON c.id = p.category_id
         LEFT JOIN public.tbl_providers pr ON pr.id = p.provider_id
WHERE p.status <> 'DELETED'
WITH DATA;

CREATE UNIQUE INDEX ai_view_products_uidx ON ai_view.products (id);
CREATE INDEX ai_view_products_code_idx ON ai_view.products (code);
CREATE INDEX ai_view_products_status_idx ON ai_view.products (status);
CREATE INDEX ai_view_products_category_idx ON ai_view.products (category_code);
CREATE INDEX ai_view_products_provider_idx ON ai_view.products (provider_code);
CREATE INDEX ai_view_products_name_idx ON ai_view.products (lower(name));

CREATE MATERIALIZED VIEW ai_view.promotions AS
SELECT id,
       value,
       start_at,
       end_at,
       priority,
       status,
       scope
FROM public.tbl_promotions
WHERE status = 'ACTIVE'
  AND (start_at IS NULL OR start_at <= now())
  AND (end_at IS NULL OR end_at > now())
WITH DATA;

CREATE UNIQUE INDEX ai_view_promotions_uidx ON ai_view.promotions (id);
CREATE INDEX ai_view_promotions_scope_idx ON ai_view.promotions (scope);
CREATE INDEX ai_view_promotions_end_at_idx ON ai_view.promotions (end_at);

CREATE MATERIALIZED VIEW ai_view.vouchers AS
SELECT id,
       code,
       discount_type,
       voucher_type,
       status,
       value,
       min_order_amount,
       start_at,
       end_at
FROM public.tbl_vouchers
WHERE status = 'ACTIVE'
  AND voucher_type = 'GLOBAL'
  AND (start_at IS NULL OR start_at <= now())
  AND (end_at IS NULL OR end_at > now())
WITH DATA;

CREATE UNIQUE INDEX ai_view_vouchers_uidx ON ai_view.vouchers (id);
CREATE INDEX ai_view_vouchers_code_idx ON ai_view.vouchers (code);
CREATE INDEX ai_view_vouchers_end_at_idx ON ai_view.vouchers (end_at);

CREATE MATERIALIZED VIEW ai_view.size_chart AS
SELECT id,
       size,
       weight,
       height,
       created_at,
       updated_at
FROM public.tbl_sizes
WITH DATA;

CREATE UNIQUE INDEX ai_view_size_chart_uidx ON ai_view.size_chart (id);
CREATE INDEX ai_view_size_chart_size_idx ON ai_view.size_chart (size);

CREATE MATERIALIZED VIEW ai_view.product_reviews AS
SELECT row_number() OVER (ORDER BY c.product_id, c.created_at, c.content) AS review_id,
       c.product_id,
       p.code AS product_code,
       p.name AS product_name,
       c.rating,
       c.content,
       c.created_at
FROM public.tbl_comments c
         JOIN public.tbl_products p ON p.id = c.product_id
WHERE p.status <> 'DELETED'
WITH DATA;

CREATE UNIQUE INDEX ai_view_product_reviews_uidx ON ai_view.product_reviews (review_id);
CREATE INDEX ai_view_product_reviews_product_idx ON ai_view.product_reviews (product_id);
CREATE INDEX ai_view_product_reviews_product_code_idx ON ai_view.product_reviews (product_code);

CREATE MATERIALIZED VIEW ai_view.inventory AS
SELECT i.product_id,
       p.code AS product_code,
       p.name AS product_name,
       i.size_id,
       s.size,
       i.quantity,
       i.status AS inventory_status,
       p.status AS product_status
FROM public.tbl_items i
         JOIN public.tbl_products p ON p.id = i.product_id
         JOIN public.tbl_sizes s ON s.id = i.size_id
WHERE p.status <> 'DELETED'
  AND (i.status IS NULL OR i.status <> 'DISCONTINUED')
WITH DATA;

CREATE UNIQUE INDEX ai_view_inventory_uidx ON ai_view.inventory (product_id, size_id);
CREATE INDEX ai_view_inventory_product_code_idx ON ai_view.inventory (product_code);
CREATE INDEX ai_view_inventory_size_idx ON ai_view.inventory (size);
CREATE INDEX ai_view_inventory_status_idx ON ai_view.inventory (inventory_status);

DO $$
BEGIN
    CREATE ROLE ai_reader;
EXCEPTION
    WHEN duplicate_object THEN NULL;
END
$$;

GRANT USAGE ON SCHEMA ai_view TO ai_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA ai_view TO ai_reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA ai_view
    GRANT SELECT ON TABLES TO ai_reader;

COMMIT;

-- Create the login user outside this script so the password is not stored in git:
-- CREATE USER ai_bot WITH PASSWORD 'replace_with_a_strong_password';
-- GRANT ai_reader TO ai_bot;
-- REVOKE ALL ON SCHEMA public FROM ai_bot;
-- ALTER ROLE ai_bot SET search_path = ai_view;
