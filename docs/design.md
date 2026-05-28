my_app/
│
├── app/                     # Thư mục chứa toàn bộ mã nguồn chính
│   ├── __init__.py          # Đánh dấu đây là package Python
│   ├── main.py              # Điểm khởi chạy ứng dụng
│   ├── config.py            # Cấu hình chung
│   ├── models/              # Định nghĩa model (ORM, dataclass, schema)
│   │   ├── __init__.py
│   │   └── user.py
│   ├── services/            # Xử lý logic nghiệp vụ
│   │   ├── __init__.py
│   │   └── user_service.py
│   ├── routes/              # Định nghĩa API endpoint / router
│   │   ├── __init__.py
│   │   └── user_routes.py
│   ├── utils/               # Hàm tiện ích, helper
│   │   ├── __init__.py
│   │   └── validators.py
│   └── static/              # File tĩnh (nếu có)
│
├── tests/                   # Unit test / integration test
│   ├── __init__.py
│   └── test_user.py
│
├── requirements.txt         # Danh sách thư viện cần cài
├── README.md                # Hướng dẫn dự án
├── .env                     # Biến môi trường (không commit lên git)
├── .gitignore               # File bỏ qua khi commit
└── setup.py                 # (Tùy chọn) Đóng gói project thành package
