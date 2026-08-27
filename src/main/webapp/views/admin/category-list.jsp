<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .table-custom th { text-transform: uppercase; font-size: 0.85rem; letter-spacing: 0.5px; color: #6c757d; border-bottom: 2px solid #dee2e6; }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="card shadow-sm border-0">
        <div class="card-header bg-white border-bottom-0 pt-4 pb-0 d-flex justify-content-between align-items-center">
            <h5 class="mb-0 text-dark fw-semibold">Quản lý Danh mục</h5>
            <a href="<c:url value='/admin/category/add'/>" class="btn btn-dark btn-sm px-3 rounded-pill">
                + Thêm mới
            </a>
        </div>
        <div class="card-body p-4">
            <div class="table-responsive">
                <table class="table table-hover table-custom align-middle text-center mb-0">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>
                            <th>Tên danh mục</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listcate}" var="cate" varStatus="STT">
                            <tr>
                                <td class="text-muted">${STT.index + 1}</td>
                                
                                <c:choose>
                                    <c:when test="${fn:startsWith(cate.images, 'http')}">
                                        <c:url value="${cate.images}" var="imgUrl"></c:url>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                                    </c:otherwise>
                                </c:choose>
                                
                                <td>
                                    <img src="${imgUrl}" alt="img" class="rounded" style="width: 100px; height: 65px; object-fit: cover; border: 1px solid #eee;">
                                </td>
                                <td class="text-dark fw-medium">${cate.categoryName}</td>
                                <td>
                                    <c:if test="${cate.status == 1}">
                                        <span class="badge border border-success text-success bg-white px-2 py-1 rounded-pill">Hoạt động</span>
                                    </c:if>
                                    <c:if test="${cate.status != 1}">
                                        <span class="badge border border-secondary text-secondary bg-white px-2 py-1 rounded-pill">Đã khóa</span>
                                    </c:if>
                                </td>
                                <td>
                                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>" class="btn btn-outline-secondary btn-sm px-3">Sửa</a>
                                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>" class="btn btn-outline-danger btn-sm px-3" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>