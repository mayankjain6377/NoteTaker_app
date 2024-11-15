
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Notes</title>
    <%@ include file="all_js_css.jsp" %>
    <style type="text/css">
        /* Add custom styles for the dialog box */
        .success-dialog {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 50px;
            background-color: #4CAF50; /* Green background */
            color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 9999;
            text-align: center;
        }
        .btn-view-all {
            margin-top: 10px;
        }
    </style>
</head>

<body>



<div id="successDialog" class="success-dialog">
            <p>Note is added successfully!</p>
            <a href="show_notes.jsp" class="btn btn-light btn-view-all">View All Notes</a>
        </div>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Show the success dialog box when the note is added successfully
        window.onload = function() {
            var successDialog = document.getElementById('successDialog');
            if (successDialog) {
                successDialog.style.display = 'block';

                // Hide the dialog after 5 seconds
                setTimeout(function() {
                    successDialog.style.display = 'none';
                    // Redirect to show_notes.jsp after 5 seconds
                    window.location.href = 'all_notes.jsp';
                }, 5000);
            }
        }
    </script>
</body>
</html>


















