<!-- <!doctype html> -->
<!-- <html lang="en"> -->
<!--   <head> -->
<!--     <meta charset="utf-8"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--     <title>Home</title> -->
<%--    <%@include file="all_js_css.jsp" %> --%>
<!--   </head> -->
<!--   <body> -->
  
<!--   <div class="container-fluid" > -->
<%--   <%@include file="Navbar.jsp" %> --%>
  
  
<!--   </div> -->
  
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
  
<!--    </body> -->
<!-- </html> -->


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <%@include file="all_js_css.jsp" %>
    <style>
      /* Navbar styling */
      .navbar {
        background-color: #1A237E; /* Navy Blue */
      }
      .navbar a {
        color: #FFFFFF; /* White text */
      }

      /* Fullscreen image */
      .full-image {
       
         width:100%;
         height:100vh;
/*         background-image: url('https://th.bing.com/th/id/OIP.W2HLSUWrBTHM9M_MQ9S8agHaE8?pid=ImgDet&w=198&h=132&c=7&dpr=1.4'); */
         background-image: url('homepage.jpeg');
        background-size: cover;
        background-position: center;
        position: relative;
      }

      /* Centered button */
      .center-content {
        position: absolute;
        top: 60%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
      }
      .btn-start {
        background-color: #FFFFFF; /* Navy Blue */
        color: black; /* White text */
        padding: 10px 20px;
        font-size: 1.2rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .btn-start:hover {
        background-color:  #bdbdbd; /* Lighter Blue */
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <%@include file="Navbar.jsp" %>
    </div>

    <!-- Fullscreen Image Section -->
    <div class="full-image">
      <div class="center-content">
        <button class="btn-start" onclick="window.location.href='add_notes.jsp'">
          Start Writing Notes
        </button>
      </div>
    </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
