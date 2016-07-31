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
        <div id="map"></div>

        <script type="text/javascript"> //46.2123078, 6.1522267
            var ls = ${records};

            var map = L.map('map').setView([46.2123078, 6.1522267], 4);

            L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            
            var i = 0;
            while (i < ls.length) {
                var id = ls[i];
                i++;
                var lng = ls[i];
                i++;
                var lat = ls[i];
                i++;
                var el = L.marker([lat, lng], {title:id.toString()}).addTo(map);
                
                el.on('click', onMapClick);;              
            }

            //var popup = L.marker([46.2123078, 6.1522267], {title:'-1'}).addTo(map);

            function onMapClick(e) {
                window.open("info/"+this.options.title+".htm");
                //self.location = "http://www.example.com";
            }
           // popup.on('click', onMapClick);
        </script>

    </body>
</html>
