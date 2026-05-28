-- Optional pg_cron schedule for refreshing AI materialized views.
-- Run as a PostgreSQL superuser after public/ai-view.sql.
--
-- pg_cron also requires postgresql.conf:
-- shared_preload_libraries = 'pg_cron'
-- cron.database_name = 'tmdt'

CREATE EXTENSION IF NOT EXISTS pg_cron;

DO $$
DECLARE
    existing_job record;
BEGIN
    FOR existing_job IN
        SELECT jobid
        FROM cron.job
        WHERE jobname LIKE 'ai-view-%'
    LOOP
        PERFORM cron.unschedule(existing_job.jobid);
    END LOOP;
END
$$;

-- Slow group: public catalog data, refreshed once per day.
SELECT cron.schedule(
    'ai-view-categories-daily',
    '0 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.categories'
);

SELECT cron.schedule(
    'ai-view-providers-daily',
    '2 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.providers'
);

SELECT cron.schedule(
    'ai-view-products-daily',
    '4 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.products'
);

SELECT cron.schedule(
    'ai-view-promotions-daily',
    '6 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.promotions'
);

SELECT cron.schedule(
    'ai-view-vouchers-daily',
    '8 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.vouchers'
);

SELECT cron.schedule(
    'ai-view-size-chart-daily',
    '10 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.size_chart'
);

SELECT cron.schedule(
    'ai-view-product-reviews-daily',
    '12 2 * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.product_reviews'
);

-- Fast group: inventory, refreshed hourly.
SELECT cron.schedule(
    'ai-view-inventory-hourly',
    '0 * * * *',
    'REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.inventory'
);
