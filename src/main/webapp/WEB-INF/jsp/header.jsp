<%-- 
    Document   : header
    Created on : Mar 13, 2016, 1:49:06 PM
    Author     : vdeiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/custom.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <nav class="navbar-center navbar-inverse navbar-fixed" role="navigation">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a class="navbar-brand" href="<c:url value="/index.htm"/>">Home</a></li>
                    <li><a class="navbar-brand" href="<c:url value="/rooms.htm"/>">Motivation</a></li>
                    <li><a class="navbar-brand" href="<c:url value="/students.htm"/>">Process</a></li>
                    <li><a class="navbar-brand" href="<c:url value="/contacts.htm"/>">Archive</a></li>
                    <li><a class="navbar-brand" href="<c:url value="/contacts.htm"/>">Add record</a></li>
                </ul>
            </div>
        </nav>
    </body>
</html>
