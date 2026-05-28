@echo off
.\.venv\Scripts\python.exe -m uvicorn app.main:app --app-dir src --reload --port 8090
