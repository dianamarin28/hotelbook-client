<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>HotelBook</title>
    <c:url var="favicon" value="/resources/images/favicon.png"/>
    <link rel="shortcut icon" href="${favicon}">

    <jsp:include page="bootstrapImports.jsp"/>

    <c:url var="tableStyle" value="/resources/style/table.css"/>
    <link rel="stylesheet" type="text/css" href="${tableStyle}">
    <c:url var="buttonStyle" value="/resources/style/button.css"/>
    <link rel="stylesheet" type="text/css" href="${buttonStyle}">
    <c:url var="textStyle" value="/resources/style/text.css"/>
    <link rel="stylesheet" type="text/css" href="${textStyle}">

    <c:url var="viewDetails" value="/hotelDetails/"/>

    <c:url var="testImage" value="/resources/images/h1i1.jpg"/>
</head>
<body style="background-color: #3e4e51; color: #3E4E51; display: flex; align-items: center">
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="background-color: #FFFFFF;">
        <h3 class="title-custom"><strong>HOTELS</strong></h3>
        <h5 class="title-custom">Your filters: <span
                style="font-family: 'Open Sans', sans-serif; font-size: 12px"><mark><strong>Destination:</strong> ${filterDestination}</mark></span>
        </h5>

        <hr>

        <c:if test="${not empty hotels}">
            <div class="table-responsive">
                <c:forEach var="hotel" items="${hotels}" varStatus="loop">
                    <table class="table table-condensed"
                           style="background-color: #eee8e8; font-size: 10px; font-family: 'Open Sans', sans-serif;">
                        <tbody>
                        <tr>
                            <td style="font-family: 'Righteous', cursive; font-size: 16px;">${hotel.name}</td>
                        </tr>
                        <tr>
                            <td class="col-md-5">
                                <a href="${viewDetails}${hotel.hotelId}"><img class="img-rounded img-responsive" src="${hotel.mainImageURL}"></a>
                            </td>
                            <td>
                                <table class="table table-condensed borderless"
                                       style="background-color: #eee8e8; font-size: 10px; font-family: 'Open Sans', sans-serif;">
                                    <tbody>
                                    <tr>
                                        <td style="font-size: 14px;">${hotel.stars}</td>
                                    </tr>
                                    <tr>
                                        <td><span
                                                class="glyphicon glyphicon-map-marker"></span> ${hotel.address.addressToString}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>MINIMUM PRICE FOR 1 NIGHT:</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="font-family: 'Righteous', cursive; font-size: 16px;">${hotel.minimumPricePerNight} € <a
                                                href="${viewDetails}${hotel.hotelId}"><input
                                                style="font-family: 'Open Sans', sans-serif;" type="submit"
                                                value="View details" class="btn btn-save btn-sm"></a></td>
                                    </tr>
                                    <tr>
                                        <td style="color: green"><span class="glyphicon glyphicon-ok"></span> Free
                                            Cancellation
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: green"><span class="glyphicon glyphicon-ok"></span> Reserve
                                            now, pay later
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty hotels}">
            <h5 style="color: #3E4E51"><strong>No hotels found.</strong></h5>
        </c:if>

    </div>
    <div class="col-md-2"></div>
</div>
</body>
</html>
