# WebBook

Yêu cầu Python 3.7+ và MySQL 8+, nodejs14+
Các bước chạy project
Clone project

Cài MySQL và tạo sẵn một CSDL rỗng tên bookdb
Chạy file dump20221024.sql cho CSDL bookdb

BACKEND

Mở thư mục backend bằng pycharm
Thực thi lệnh: pip install -r requirements.txt
Chạy project: python manage.py runserver
Truy câp vào http://localhost:8000/ hoặc http://localhost:8000/swagger để sử dụng các APIs

FRONT_END

Mở thu mục front_end bằng vs code
THực thi lệnh: npm install
chạy project: npm start
