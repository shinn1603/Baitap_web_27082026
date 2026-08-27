<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Danh Mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .form-label { font-weight: 500; color: #495057; font-size: 0.95rem; }
        .form-control:focus { border-color: #212529; box-shadow: none; }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-body p-5">
                    <h4 class="mb-4 text-center text-dark fw-semibold">Thêm Danh Mục</h4>
                    
                    <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
                        
                        <div class="mb-4">
                            <label class="form-label">Tên danh mục</label>
                            <input type="text" class="form-control form-control-lg fs-6" name="categoryName" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Đường dẫn ảnh (URL)</label>
                            <input type="text" class="form-control" name="images">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Tải ảnh lên từ máy tính</label>
                            <input type="file" class="form-control" name="images1">
                        </div>

                        <div class="mb-5">
                            <label class="form-label d-block">Trạng thái</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="ston" value="1" checked>
                                <label class="form-check-label" for="ston">Hoạt động</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="stoff" value="0">
                                <label class="form-check-label text-muted" for="stoff">Khóa</label>
                            </div>
                        </div>

                        <div class="d-grid gap-3">
                            <button type="submit" class="btn btn-dark btn-lg fs-6">Lưu dữ liệu</button>
                            <a href="<c:url value='/admin/categories'/>" class="text-center text-muted text-decoration-none mt-2">Quay lại danh sách</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>