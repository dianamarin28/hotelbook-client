<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>HotelBook</title>
    <c:url var="favicon" value="/resources/images/favicon.png"/>
    <link rel="shortcut icon" href="${favicon}">

    <jsp:include page="bootstrapImports.jsp"/>

    <c:url var="textStyle" value="/resources/style/text.css"/>
    <link rel="stylesheet" type="text/css" href="${textStyle}">
    <c:url var="tableStyle" value="/resources/style/table.css"/>
    <link rel="stylesheet" type="text/css" href="${tableStyle}">
    <c:url var="buttonStyle" value="/resources/style/button.css"/>
    <link rel="stylesheet" type="text/css" href="${buttonStyle}">
    <c:url var="formStyle" value="/resources/style/form.css"/>
    <link rel="stylesheet" type="text/css" href="${formStyle}">
    <c:url var="layoutStyle" value="/resources/style/layout.css"/>
    <link rel="stylesheet" type="text/css" href="${layoutStyle}">

    <c:url var="roomAvailabilityURL" value="/roomAvailability"/>
    <c:url var="reservationURL" value="/reservation"/>

    <c:url var="commonsJS" value="/resources/js/commons.js"/>
</head>
<body style="background-color: #3e4e51; color: #3E4E51; display: flex; align-items: center">
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="background-color: #FFFFFF;">
        <h3 class="title-custom"><strong>${hotel.name}</strong> ${hotel.stars}</h3>
        <hr>
        <img class="img-thumbnail img-responsive displayed" src="${hotel.mainImageURL}">
        <hr>

        <div class="table-responsive">
            <table class="table table-condensed borderless"
                   style="font-family: 'Open Sans', sans-serif; font-size: 12px">
                <tbody>
                <tr>
                    <td><span class="glyphicon glyphicon-map-marker"></span> ${hotel.address.addressToString}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-phone"></span> ${hotel.contactPhoneNumber}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-envelope"></span> ${hotel.email}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-text-size"></span> ${hotel.description}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-wrench"></span> Built: ${hotel.builtYear}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-home"></span> Floors: ${hotel.numberOfFloors}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-time"></span> Check-in hours: ${hotel.checkInHours}</td>
                </tr>
                <tr>
                    <td><span class="glyphicon glyphicon-time"></span> Check-out hours: ${hotel.checkOutHours}</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-md-3">
                <div class="table-responsive">
                    <table class="table table-condensed borderless"
                           style="font-family: 'Open Sans', sans-serif; font-size: 12px">
                        <tbody>
                        <tr>
                            <td><span class="glyphicon glyphicon-ok"></span><strong> HOTEL FEATURES:</strong></td>
                        </tr>
                        <c:forEach var="feature" items="${hotel.hotelFeatures}">
                            <tr>
                                <td>${feature}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-3">
                <div class="table-responsive">
                    <table class="table table-condensed borderless"
                           style="font-family: 'Open Sans', sans-serif; font-size: 12px">
                        <tbody>
                        <tr>
                            <td><span class="glyphicon glyphicon-ok"></span><strong> ROOM FEATURES:</strong></td>
                        </tr>
                        <c:forEach var="feature" items="${hotel.roomFeatures}">
                            <tr>
                                <td>${feature}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-4" style="font-family: 'Open Sans', sans-serif; font-size: 12px; background-color: #eee8e8">
                <form:form id="js-check-availability-form" class="form" method="POST" action="${roomAvailabilityURL}" commandName="roomAvailabilityForm">
                    <div class="form-group">
                        <form:label path="startDate">Check-in: </form:label>
                        <form:input id="startDate" type="date" path="startDate" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <form:label path="endDate">Check-out: </form:label>
                        <form:input id="endDate" type="date" path="endDate" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <form:label path="capacity">Room capacity: </form:label>
                        <form:input id="capacity" type="number" path="capacity" class="form-control"/>
                    </div>

                    <form:hidden path="hotelId" value="${hotel.hotelId}"/>

                    <input type="submit" class="btn btn-save btn-sm" value="Check if available"/>
                </form:form>

                <div id="js-available">
                </div>
            </div>
        </div>

        <hr>
    </div>
    <div class="col-md-2"></div>
</div>

<script type="application/javascript" src="${commonsJS}"></script>
</body>
</html>
