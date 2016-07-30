<%-- 
    Document   : roomForm
    Created on : Mar 13, 2016, 8:28:54 PM
    Author     : vdeiv
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New room form</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div id="container">
            <div class="col-md-4"></div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title"><spring:message code="lbl.submitNewRoom"/></h1> 
                    </div>
                    <div class="panel-body">
                        <form:form class="form-horizontal row-border" commandName="room" role="form" method="POST" action="${pageContext.request.contextPath}/rooms.htm">
                            <form:hidden path="${room.id}"/>
                            <div class="form-group">
                                <label class="col-md-4 control-label" required="required"><spring:message code="lbl.street"/>:</label>
                                <div class="col-md-7">
                                    <form:input type="text" path="street" class="form-control"/>
                                    <form:errors path="street" cssClass="error" />
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-4 control-label"><spring:message code="lbl.houseNumber"/></label>
                                <div class="col-md-7">
                                    <form:input type="number" path="houseNumber" class="form-control" value="${room.houseNumber}"/>
                                    <form:errors path="houseNumber" cssClass="error" />
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-4 control-label"><spring:message code="lbl.roomNumber"/></label>
                                <div class="col-md-7">
                                    <form:input type="number" path="roomNumber" class="form-control" value="${room.roomNumber}"/>
                                    <form:errors path="roomNumber" cssClass="error" />
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-4 control-label"><spring:message code="lbl.maxStudents"/></label>
                                <div class="col-md-7">
                                    <form:input class="form-control" type="number" path="maxStudents" name="maxStudents" min="1" max="3" value="${room.maxStudents}"/>
                                    <form:errors path="maxStudents" cssClass="error" />
                                </div>
                                <div class="col-md-1"></div>
                                <div class="clearfix visible-md-block"></div>
                                <label class="col-md-4 control-label"><spring:message code="lbl.free"/></label>
                                <div class="col-md-5">
                                    <form:checkbox path="free"/>
                                </div>
                                <div class="col-md-3"></div>
                                <div class="clearfix md-block"></div>
                                <label class="col-md-4 control-label">Select student</label>
                                <div class="col-md-7">
                                    <form:select class="form-control" path="studentList">
                                        <form:options items="${students}" itemValue="id" itemLabel="name"/>
                                    </form:select>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-4"></div>
                                <div class="col-md-3">
                                    <input id="save" type="submit" class="form-control" value="<spring:message code="lbl.save"/>">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
