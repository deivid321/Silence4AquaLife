<%-- 
    Document   : motivation
    Created on : Jul 31, 2016, 8:51:09 AM
    Author     : vdeiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        <div class="row">
            <div class="col-sm-2" align="left"></div>
            <div class="col-sm-8" >
                <h1 id="motivation">Motivation</h1>
                <div align="left">
                    <div class="figure">
                        <img src="Turtle.jpeg"  style="float: right; width: 40%; height: 40%" />
                    </div>
                    <p>Over the past decades, environmental sciences and media have put increasing focus on <em>visible</em> water pollution. We typically show emotional reactions to images depicting tons of rubbish flowing around in the oceans or whales who have parts of cars in their bodies.</p>
                    <p>However, what receives particularly little attention is <em>noise</em> pollution. Just recently, a conference on the <a href="http://an2016.org/">(link is external)</a> the effects of noise on aquatic life has come into place trying to address this problem. Today, these are still not sufficiently understood, but scientists assume that anthropogenic noise is responsible to a large degree for whale strandings, deaths and mis-navigations of other animals as well all over the world. This noise comes especially from large ships, but also low frequency sonar used for underwater communication (e.g. with submarines). There are also studies showing similar effects on inland waters (<cite>The impacts of power boating and water skiing on lakes and reservoirs, Mosisch and Arthington, 1998</cite>). Our project has two parts. First, we want to raise awareness about the issue of noise pollution of water. Second, we want to combine this idea with the re-use of old smartphones.</p>
                    <p>Today, smartphones are thrown away often prior to their actual end of life for various reasons. Thus, the idea is to use your old smartphone, put it into some waterproof bag/storage and record. Just recently, <a href="http://spectrum.ieee.org/green-tech/solar/wireless-solar-charging-made-e...">(solar wireless solar charging mode)</a> wireless solar charging has received another push into the right direction. We imagine an apparatus that puts this into some type of floating device that is always attracted to the top. It would of course need to be tested to which extent this goes together with water. Another issue is wireless communication through water, even if it is just a few metres or centimetres. You usually would need very low frequencies, which in turn is one potential harm factor as outlined above. Thus, data transmission in the case of permanent installations is a topic to invest further research into. The current use case is aimed at non-stationary recordings. Interesting places (particular lakes, rivers) could be equipped with a re-usable waterproof bag permanently accessible. People who want to contribute to research in the effects of noise on marine life can do so now! All that needs to be done is downloading an app that makes use of your built-in microphone [1]. Afterwards, the data are sent to a central server allowing people from all over the world to make use of this data. The idea is to target at least two groups. First, it is supposed to be a general platform for people who have not come across the issue of noise pollution yet and want to have more information. Second, it serves as a file sharing service for researchers providing data for doing further analysis. Possible applications are to explore connections between high levels of noise and non-typical animal behaviour, changes in chemical compositions or other effects.</p>
                    <h1 id="recommended-links">Recommended links:</h1>
                    <p><a href="http://an2016.org/" class="uri">http://an2016.org/</a></p>
                    <p><a href="http://www.nmfs.noaa.gov/pr/pdfs/acoustics/shipping_noise.pdf" class="uri">http://www.nmfs.noaa.gov/pr/pdfs/acoustics/shipping_noise.pdf</a></p>
                    <p><a href="https://www.theguardian.com/environment/2016/feb/02/ships-noise-is-serious-problem-for-killer-whales-and-dolphins-report-finds" class="uri">https://www.theguardian.com/environment/2016/feb/02/ships-noise-is-serious-problem-for-killer-whales-and-dolphins-report-finds</a></p>
                    <p>[1] Note that hydrophone calibration is necessary to allow for comparability of results from different points in space and time. However, it is not a trivial topic and needs some knowledge about water acoustics. More work needs to be done in this field.</p>

                </div>
            </div>
            <div class="col-sm-2" align="left"></div>
        </div>
    </body>
</html>
