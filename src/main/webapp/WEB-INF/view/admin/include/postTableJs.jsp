<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(function () {
        const table = $("#posts-table").DataTable({
            responsive: true,
            lengthChange: true,
            autoWidth: false,
            ordering: true,
            info: true,
            paging: true
        });

        // shorten summary cells
        /* document.querySelectorAll(".shorten").forEach(cell => {
            let text = cell.innerText;
            if (text.length > 150) {
                cell.innerText = text.slice(0, 150) + "..."
            }
        }); */

        // handle approve & delete AJAX calls
       const requestURL = "<%= request.getContextPath() %>/admin/prequest-processor";
       
       const actionType = '<c:out value="${param.tableAction}" />';
        
        document.querySelectorAll(".delete-btn").forEach(btn => {
            btn.addEventListener("click", ({target}) => {
                if (!confirm("Bạn có chắc chắn muốn xóa không?")) return;
                $.post(requestURL, {
                    action: actionType,
                    objId: target.id.slice(4)
                }).done((response) => handleDeleteRequest(response, actionType));
            })
        })


        function removeRow(id) {
            table
                .row($("#tableRow-" + id))
                .remove()
                .draw();
        }

        function toasting(bg, message) {
            $(document).Toasts('create', {
                class: bg,
                title: "Thông báo",
                body: message,
                autohide: true,
                delay: 5000,
                position: 'bottomRight',
            })
        }

        function toastSuccess(message) {
            toasting("bg-success", message);
        }

        function toastDanger(message) {
            toasting("bg-danger", message);
        }

        function handleDeleteRequest(response, requestType) {
            const {request, objId, isSuccess, message} = JSON.parse(response);
            if (isSuccess && request === requestType) {
            	removeRow(objId);
                toastSuccess(message);
            } else {
                toastDanger(message ?? "Đã xảy ra lỗi, thao tác thất bại!");
            }
        }
    });
</script>
