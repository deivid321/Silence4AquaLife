<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" href="https://npmcdn.com/leaflet@1.0.0-rc.2/dist/leaflet.css" />
        <script src="https://npmcdn.com/leaflet@1.0.0-rc.2/dist/leaflet.js"></script>
    </head>

    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        ${records} ${lng}
        <div id="map"></div>
        <script type="text/javascript">
    var map = L.map('map').setView([${lng}, ${records}], 13);

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var popup = L.marker([${lng}, ${records}]).addTo(map);

    function onMapClick(e) {
        alert("You clicked the map at " + e.latlng);
        self.location = "http://www.example.com";

    }
    popup.on('click', onMapClick);
        </script>

    </body>
</html>
