<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <%
        if (session.getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }
    %>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&subset=latin-ext" rel="stylesheet">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/home-member.css">
    <link rel="stylesheet" type="text/css" href="css/home-tutor.css">
    <link rel="stylesheet" type="text/css" href="css/submissions.css">
    <link rel="stylesheet" type="text/css" href="css/home-admin.css">
</head>
<body>
<div class="header">
    <jsp:include page="jspLayouts/home-admin-header.jsp" />
</div>

<input type="checkbox" id="menu-toggle" unchecked>

<div class="slide-menu">
    <jsp:include page="jspLayouts/slideMenu.jsp" />
</div>

<label class="menu-label" for="menu-toggle">
    <div class="menu-toggler">
        <span></span>
    </div>
</label>
<div class="list-view">
    <div class="title">
        <h1>Tutorship Requests List</h1>
    </div>
    <div class="container" style="margin: 25px auto;">
        <table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>User ID</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Type</th>
                <th>Email</th>
                <th>Decision</th>
            </tr>
            </thead>
            <tbody class="list-of-requests">

            </tbody>
        </table>

    </div><!--container-->


</div>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>
<script type="text/javascript" src="js/submissions.js"></script>
<script type="text/javascript" src="js/tutorships.js"></script>

</body>
</html>