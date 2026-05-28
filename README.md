# TMĐT AI Service

Python FastAPI service dùng Gemini Flash cho chatbot TMĐT.

## Chạy local

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
copy .env.example .env.local
```

Điền `GEMINI_API_KEY` và `AI_DB_PASSWORD` trong `.env.local`, sau đó chạy:

```powershell
uvicorn app.main:app --app-dir src --reload --port 8090
```

Kiểm tra nhanh:

```powershell
$env:PYTHONPATH="src"
.\.venv\Scripts\python.exe -m unittest discover -s tests
```

## API

```http
GET /health
POST /classify
POST /chat
```

Ví dụ:

```powershell
curl -X POST http://localhost:8090/chat `
  -H "Content-Type: application/json" `
  -d "{\"name\":\"An\",\"message\":\"Có áo Nike size M không?\"}"
```

AI chỉ đọc dữ liệu công khai/tồn kho trong schema `ai_view`, nên không trả lời dữ liệu cá nhân như đơn hàng hoặc giỏ hàng:

```powershell
curl -X POST http://localhost:8090/chat `
  -H "Content-Type: application/json" `
  -d "{\"message\":\"Giỏ hàng của tôi có gì?\"}"
```

## Kiến trúc

```text
User
  -> AI service /chat
    -> routes/chat.py nhận request
    -> services/classifier.py phân loại intent
    -> services/context_builder.py query schema ai_view đúng intent
    -> services/db_client.py đọc PostgreSQL bằng user ai_bot
    -> services/gemini_client.py gọi Gemini Flash trả lời
```

AI service không gọi API backend để lấy context trả lời. Backend/Spring vẫn ghi dữ liệu vào DB gốc; PostgreSQL cập nhật materialized view theo lịch refresh, rồi AI đọc `ai_view`.

## Env

App dùng `pydantic-settings` để tự đọc `.env.local` rồi `.env`, theo cấu hình trong [config.py](src/app/config.py). Không cần gọi `load_dotenv()` thủ công.

`.env` tối thiểu:

```env
GEMINI_API_KEY=your_gemini_api_key
GEMINI_MODEL=gemini-2.5-flash
AI_CONTEXT_SOURCE=db
AI_DB_HOST=localhost
AI_DB_PORT=5432
AI_DB_NAME=tmdt
AI_DB_USER=postgres
AI_DB_PASSWORD=123456
AI_DB_SCHEMA=ai_view
REQUEST_TIMEOUT_SECONDS=10
MAX_CONTEXT_ITEMS=5
```

## DB cho AI

Sau khi import dump gốc vào database `tmdt`, chạy [public/ai-view.sql](public/ai-view.sql) để tạo schema `ai_view` chỉ đọc cho AI. Nếu dùng `pg_cron`, chạy thêm [public/ai-cron.sql](public/ai-cron.sql) để refresh nhóm catalog mỗi ngày và tồn kho mỗi giờ.

## Cấu trúc

```text
setup.py
tests/
└── test_classifier.py
src/app/
├── main.py
├── config.py
├── models/
│   └── schemas.py
├── routes/
│   ├── chat.py
│   ├── classify.py
│   └── health.py
├── services/
│   ├── classifier.py
│   ├── context_builder.py
│   ├── db_client.py
│   ├── dependencies.py
│   ├── gemini_client.py
│   └── prompts.py
└── utils/
    ├── formatting.py
    └── text.py
public/
├── ai-view.sql
└── ai-cron.sql
```
