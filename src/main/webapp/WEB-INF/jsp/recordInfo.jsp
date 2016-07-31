<%-- 
    Document   : recordInfo
    Created on : Jul 30, 2016, 10:26:04 AM
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
        <title>JSP Page</title>     
        <style>
            .axis--x path {
                display: none;
            }

            .line {
                fill: none;
                stroke: steelblue;
                stroke-width: 1.5px;
            }
            <!-- -->

        </style>
        <script src="//cdnjs.cloudflare.com/ajax/libs/dygraph/1.1.1/dygraph-combined.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="row">
            <div class="col-sm-12">
                <audio controls style="margin-top: 5px;">
                    <source src="<%=request.getContextPath()%>/data/a.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
            <div id="leftChart" class="col-sm-6">
                <div id="graphdiv2"
                     style="width:960px; height:300px;"></div>
                <script type="text/javascript">
                    g2 = new Dygraph(
                            document.getElementById("graphdiv2"),
                            "<%=request.getContextPath()%>/data/analys.csv", // path to CSV file
                            {}          // options
                    );
                </script>
            </div>
            <div class="col-sm-6">
                <svg width="960" height="300"></svg>
                <script src="https://d3js.org/d3.v4.min.js"></script>
            </div>
            <div class="col-sm-2" align="left">
                Basic info:
                <br>
                Name: ${record.name}
                <br>
                Surname: ${record.surname}
                <br>
                Date: ${record.recordDate}
                <br>
                Time: ${record.time}
                <br>
                Coordinates: 
                <br>
                ${record.lng}, ${record.lat}
                <br>
                AudioPath: ${record.audioName}
                <br>
                CsvPath: ${record.csvName}
                <br>
            </div>
            <div id="map3" class="col-sm-8">
            </div>
            <div class="col-sm-2">
                Weather
            </div>
        </div>
    </body>
    <script type="text/javascript"> //46.2123078, 6.1522267

    var map = L.map('map3').setView([${record.lat}, ${record.lng}], 14);

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);


    var el = L.marker([${record.lat}, ${record.lng}], {title: "${record.name}"}).addTo(map);
    //el.on('click', onMapClick);;              


    //var popup = L.marker([46.2123078, 6.1522267], {title:'-1'}).addTo(map);
    /*
     function onMapClick(e) {
     alert("You clicked the map at " + e.latlng);
     window.open("info/"+this.options.title+".htm");
     //self.location = "http://www.example.com";
     } */
    // popup.on('click', onMapClick);
    </script>

    <script type="text/javascript">
        var svg = d3.select("svg"),
                margin = {top: 20, right: 80, bottom: 30, left: 50},
        width = svg.attr("width") - margin.left - margin.right,
                height = svg.attr("height") - margin.top - margin.bottom,
                g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        var parseTime = d3.timeParse("%h%mm%ss");

        var x = d3.scaleTime().range([0, width]),
                y = d3.scaleLinear().range([height, 0]),
                z = d3.scaleOrdinal(d3.schemeCategory10);

        var line = d3.line()
                .curve(d3.curveBasis)
                .x(function (d) {
                    return x(d.date);
                })
                .y(function (d) {
                    return y(d.temperature);
                });

        d3.csv("<%=request.getContextPath()%>/data/analys.csv", type, function (error, data) {
            if (error)
                throw error;

            var cities = data.columns.slice(1).map(function (id) {
                return {
                    id: id,
                    values: data.map(function (d) {
                        return {date: d.date, temperature: d[id]};
                    })
                };
            });
            cities.pop();
            x.domain(d3.extent(data, function (d) {
                return d.date;
            }));

            y.domain([
                d3.min(cities, function (c) {
                    return d3.min(c.values, function (d) {
                        return d.temperature;
                    });
                }),
                d3.max(cities, function (c) {
                    return d3.max(c.values, function (d) {
                        return d.temperature;
                    });
                })
            ]);

            z.domain(cities.map(function (c) {
                return c.id;
            }));

            g.append("g")
                    .attr("class", "axis axis--x")
                    .attr("transform", "translate(0," + height + ")")
                    .call(d3.axisBottom(x));

            g.append("g")
                    .attr("class", "axis axis--y")
                    .call(d3.axisLeft(y))
                    .append("text")
                    .attr("transform", "rotate(-90)")
                    .attr("y", 6)
                    .attr("dy", "0.71em")
                    .attr("fill", "#000")
                    .text("Accelerometer, m/s*s");

            var city = g.selectAll(".city")
                    .data(cities)
                    .enter().append("g")
                    .attr("class", "city");

            city.append("path")
                    .attr("class", "line")
                    .attr("d", function (d) {
                        return line(d.values);
                    })
                    .style("stroke", function (d) {
                        return z(d.id);
                    });

            city.append("text")
                    .datum(function (d) {
                        return {id: d.id, value: d.values[d.values.length - 1]};
                    })
                    .attr("transform", function (d)
                    {
                        return "translate(" + x(d.value.date) + "," + y(d.value.temperature) + ")";
                    })
                    .attr("x", 3)
                    .attr("dy", "0.35em")
                    .style("font", "10px sans-serif")
                    .text(function (d) {
                        return d.id;
                    });

        });

        function type(d, _, columns) {
            var full = new Date(d.date);
            d.date = full.getTime();
            //d.date = parseTime(d.date);
            for (var i = 1, n = columns.length, c; i < n; ++i)
                d[c = columns[i]] = +d[c];
            return d;
        }

    </script>
</html>
