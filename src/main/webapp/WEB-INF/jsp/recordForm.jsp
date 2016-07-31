<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New record form</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
            <div id="container">
                <div class="col-md-4"></div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title">Add new record</h1> 
                        </div>
                        <div class="panel-body">
                            <form:form method="POST" commandName="record" role="form" action="new.htm" enctype="multipart/form-data">
                                <form:hidden path="id"/>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" required="required">Name:</label>
                                    <div class="col-md-7">
                                        <form:input type="text" path="name" class="form-control"/>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <label class="col-md-4 control-label">Surname:</label>
                                    <div class="col-md-7">
                                        <form:input type="text" path="surname" class="form-control"/>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <label class="col-md-4 control-label">Longtitude:</label>
                                    <div class="col-md-7">
                                        <form:input type="number" id="lng" path="lng" class="form-control" step="any" />
                                    </div>
                                    <div class="col-md-1"></div>
                                    <label class="col-md-4 control-label">Latitude:</label>
                                    <div class="col-md-7">
                                        <form:input type="number" id="lat" path="lat" class="form-control" step="any"/>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4"></div>
                                     <div class="col-md-12">
                                    </div>   
                                    <!-- <form enctype="multipart/form-data"> -->
                                    <label class="col-md-4 control-label">Audio to upload:</label>
                                    <div class="col-md-7"><input type="file" name="file"></div>
                                     <div class="col-md-12">
                                    </div>
                                    <label class="col-md-4 control-label">CSV to upload:</label>
                                    <div class="col-md-7"><input type="file" name="file"></div>
                                    <!--      File1 to upload: 
        
                                          File2 to upload: <input type="file" name="file">
                                    <!-- </form>  -->
                                    <div class="col-md-8">
                                    </div>
                                    <div class="col-md-3">
                                        <input id="save" type="submit" class="form-control" value="Save">
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <div id="map2"></div>
                </div>

            </div>


    </body>
    <script type="text/javascript"> //46.2123078, 6.1522267
        var map = L.map('map2').setView([46.2123078, 6.1522267], 13);

        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        
        var mark = L.marker([46.2123078, 6.1522267], {draggable: 'true'}).addTo(map);
        
      //  document.getElementById('lng').value = mark.getLatlng().lng;
     //   document.getElementById('lat').value = mark.getLatlng().lat;

        function onMapClick(e) {
            mark.setLatLng(e.latlng);
            document.getElementById('lng').value = e.latlng.lng;
            document.getElementById('lat').value = e.latlng.lat;
            map.setView(e.latlng);
        }
        map.on('click', onMapClick);
    </script>
</html>
