# Setup DB view cho AI chatbot

Mục tiêu: AI không đọc trực tiếp bảng nghiệp vụ trong schema `public`. AI chỉ đọc schema `ai_view`, gồm các materialized view được tạo từ dữ liệu public đã cho phép.

## Kiến trúc

```text
database: tmdt
├── public
│   ├── tbl_products
│   ├── tbl_categories
│   ├── tbl_providers
│   ├── tbl_promotions
│   ├── tbl_vouchers
│   ├── tbl_comments
│   ├── tbl_sizes
│   └── tbl_items              # chỉ dùng để tạo tồn kho, không expose trực tiếp
└── ai_view
    ├── products
    ├── categories
    ├── providers
    ├── promotions
    ├── vouchers
    ├── product_reviews
    ├── size_chart
    └── inventory
```

PostgreSQL không cho view trong database này tham chiếu trực tiếp database khác nếu không dùng FDW/dblink. Vì vậy cách đơn giản và an toàn nhất là dùng cùng DB `tmdt`, tách schema `ai_view`, rồi cấp cho AI một user chỉ có quyền `SELECT` trên schema đó.

## Script trong repo

```text
public/ai-view.sql  # tạo schema ai_view, materialized view, index, role ai_reader
public/ai-cron.sql  # tùy chọn: đặt lịch refresh bằng pg_cron
```

## Import DB gốc

Backend Spring của bạn đang dùng:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/tmdt
    username: postgres
    password: 123456
```

Nếu chưa import dump, tạo database `tmdt` rồi import `public/db-original.sql`. File dump hiện có dòng `create database dungcony` và `\restrict/\unrestrict`; nếu chạy vào DB `tmdt`, nên bỏ các dòng đó khỏi bản copy trước khi import.

Ví dụ nếu `psql.exe` nằm trong PostgreSQL 17:

```powershell
$env:PGPASSWORD="123456"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -h localhost -p 5432 -d tmdt -f public\db-tmdt.sql
```

Kiểm tra:

```powershell
$env:PGPASSWORD="123456"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -h localhost -p 5432 -d tmdt -c "SELECT COUNT(*) FROM public.tbl_products;"
```

## Tạo lớp view cho AI

Chạy:

```powershell
$env:PGPASSWORD="123456"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -h localhost -p 5432 -d tmdt -f public\ai-view.sql
```

Script này tạo:

| View | Nguồn | Refresh |
|------|-------|---------|
| `ai_view.products` | `tbl_products`, `tbl_categories`, `tbl_providers` | 1 ngày/lần |
| `ai_view.categories` | `tbl_categories` | 1 ngày/lần |
| `ai_view.providers` | `tbl_providers` | 1 ngày/lần |
| `ai_view.promotions` | `tbl_promotions` | 1 ngày/lần |
| `ai_view.vouchers` | `tbl_vouchers` GLOBAL/ACTIVE | 1 ngày/lần |
| `ai_view.product_reviews` | `tbl_comments`, `tbl_products` | 1 ngày/lần |
| `ai_view.size_chart` | `tbl_sizes` | 1 ngày/lần |
| `ai_view.inventory` | `tbl_items`, `tbl_products`, `tbl_sizes` | mỗi giờ |

## Tạo user chỉ đọc cho AI

Đổi password thật trước khi chạy:

```sql
CREATE USER ai_bot WITH PASSWORD 'replace_with_a_strong_password';
GRANT ai_reader TO ai_bot;
REVOKE ALL ON SCHEMA public FROM ai_bot;
ALTER ROLE ai_bot SET search_path = ai_view;
```

Test:

```powershell
$env:PGPASSWORD="replace_with_a_strong_password"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U ai_bot -h localhost -p 5432 -d tmdt -c "SELECT COUNT(*) FROM products;"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U ai_bot -h localhost -p 5432 -d tmdt -c "SELECT COUNT(*) FROM public.tbl_products;"
```

Lệnh đầu phải chạy được. Lệnh thứ hai nên bị từ chối quyền nếu bảng public không cấp quyền cho `PUBLIC`.

## Refresh thủ công

Nhóm chậm, chạy 1 ngày/lần:

```sql
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.categories;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.providers;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.products;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.promotions;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.vouchers;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.size_chart;
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.product_reviews;
```

Nhóm nhanh, chạy mỗi giờ:

```sql
REFRESH MATERIALIZED VIEW CONCURRENTLY ai_view.inventory;
```

## Refresh tự động bằng pg_cron

Nếu muốn dùng `pg_cron`, cần cấu hình PostgreSQL trước:

```text
shared_preload_libraries = 'pg_cron'
cron.database_name = 'tmdt'
```

Restart PostgreSQL, rồi chạy:

```powershell
$env:PGPASSWORD="123456"
& "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -h localhost -p 5432 -d tmdt -f public\ai-cron.sql
```

Xem lịch:

```sql
SELECT jobid, jobname, schedule, command
FROM cron.job
WHERE jobname LIKE 'ai-view-%'
ORDER BY jobname;
```

## Ghi chú bảo mật

- `ai_view.product_reviews` không expose `user_id`.
- `ai_view.inventory` expose tồn kho theo product/size, không expose bảng `tbl_items` trực tiếp.
- `ai_bot` dùng riêng cho AI service.
- App AI trong repo mặc định dùng `AI_CONTEXT_SOURCE=db`, đọc trực tiếp schema `ai_view`, không gọi API backend để lấy context trả lời.
