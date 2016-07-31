<%-- 
    Document   : process
    Created on : Jul 31, 2016, 8:52:00 AM
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
                <h1 id="motivation">Process</h1>
                <div align="left">
                    <h1 id="process">Process</h1>
                    <p>
                        Over the weekend of coming up with a first prototype implementation, tasks were basically split into three parts - data acquisition, analysis and web page design.</p>
                    <p>During data acquisition, a custom made &quot;apparatus&quot; was used to deploy the phone underwater such that it could freely move (making use of the internal accelerometer) and record (using the internal microphone). The phone was placed in two layers of water-proof zippers (inner) and one bag (outer) together with stones. Recorded data are acceleration in x,y and z direction, deciBels, time and location. All data was written to a csv file. For better quality, an audio file was recorded additionally using a goPro camera.</p>
                    <p>For information on physics and webdesign, refer to &quot;About&quot; and fell free to browse around :)</p>

                    <img src="https://itqifw-sn3302.files.1drv.com/y3mtLbbnTV9z-rbZMaNkGPgxMkQ-CInQ56gU-iMZuOOWyMelGU8rapS9t_4Bzi_0r7avjp246j9LPhz9lMtQ40sisDBfJQ2N9yEVasNjKOLuhOeOq7isS6GOvxL-FNI4EntJ8QnVqReH5E-CK03a-2vWXWr5MhufZuogUSRPsMiq3A?width=3648&height=2736&cropmode=none" width="800" height="600" />

                    <img src="https://ito9ja-sn3302.files.1drv.com/y3m02hhKTqlTpY7Gy8VXWzi5uBl5KKZwnNQcawZbqcbJsctwcb3ls82xlW9PcTGFna326A-y8ErL-sIgoSH-91hT3X2OOPR2gz52XR4DU2eD72CXyI8ialgkJ28d0jKCfGluJDEo4rgwexwmW6Oga30RS9at2S-eD8zlXXCEa2_p88?width=3648&height=2736&cropmode=none" width="800" height="600" />




                </div>
            </div>
            <div class="col-sm-2" align="left"></div>
        </div>
    </body>
</html>
