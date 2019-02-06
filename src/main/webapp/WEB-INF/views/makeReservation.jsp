<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>HotelBook</title>
    <c:url var="favicon" value="/resources/images/favicon.png"/>
    <link rel="shortcut icon" href="${favicon}">

    <jsp:include page="bootstrapImports.jsp"/>

    <c:url var="buttonStyle" value="/resources/style/button.css"/>
    <link rel="stylesheet" type="text/css" href="${buttonStyle}">
    <c:url var="formStyle" value="/resources/style/form.css"/>
    <link rel="stylesheet" type="text/css" href="${formStyle}">
    <c:url var="textStyle" value="/resources/style/text.css"/>
    <link rel="stylesheet" type="text/css" href="${textStyle}">
    <c:url var="errorStyle" value="/resources/style/error.css"/>
    <link rel="stylesheet" type="text/css" href="${errorStyle}">

    <c:url var="addReservationURL" value="/reservation"/>

    <style>
        .error {
            color: #ff0000;
            font-family: 'Playfair Display', serif;
        }
    </style>
</head>
<body style="background-color: #3e4e51; color: #3E4E51; display: flex; align-items: center">
<div class="container">
    <div class="col-md-2"></div>

    <div class="col-md-8" style="background-color: #FFFFFF;">

        <h3 class="title-custom"><strong>Make a reservation</strong></h3>
        <h3 style="font-family: 'Playfair Display', serif;"><em>${hotel.name}</em> ${hotel.stars}</h3>

        <hr>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6"
                 style="font-family: 'Open Sans', sans-serif; font-size: 12px; background-color: #eee8e8">
                <form:form method="POST" action="${addReservationURL}" commandName="reservationForm">
                    <div class="row">
                        <div class="form-group col-xs-6">
                            <form:label path="startDate">START DATE:</form:label>
                            <form:input id="startDate" type="date" path="startDate" class="form-control"/>
                            <form:errors path="startDate" cssClass="error"/>
                        </div>
                        <div class="form-group col-xs-6">
                            <form:label path="endDate">END DATE:</form:label>
                            <form:input id="endDate" type="date" path="endDate" class="form-control"/>
                            <form:errors path="endDate" cssClass="error"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:label path="capacity">ROOM CAPACITY:</form:label>
                        <form:input id="capacity" type="number" path="capacity" class="form-control"/>
                        <form:errors path="capacity" cssClass="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="firstName">FIRST NAME:</form:label>
                        <form:input id="firstName" type="text" path="firstName" class="form-control"/>
                        <form:errors path="firstName" cssClass="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="lastName">LAST NAME:</form:label>
                        <form:input id="lastName" type="text" path="lastName" class="form-control"/>
                        <form:errors path="lastName" cssClass="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="phoneNumber">PHONE NUMBER:</form:label>
                        <form:input id="phoneNumber" type="text" path="phoneNumber" class="form-control"/>
                        <form:errors path="phoneNumber" cssClass="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="email">EMAIL:</form:label>
                        <form:input id="email" type="email" path="email" class="form-control"/>
                        <form:errors path="email" cssClass="error"/>
                    </div>

                    <form:hidden path="hotelId" value="${hotel.hotelId}"/>

                    <input type="submit" class="btn btn-save" value="Make reservation"/>
                </form:form>
            </div>
            <div class="col-md-3"></div>
        </div>

        <hr>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="font-family: 'Open Sans', sans-serif; font-size: 12px;">
                <c:if test="${result gt 0}">
                    <p style="color: #3E4E51">Room <strong>${result}</strong> was successfully reserved.</p>
                    <h5 style="color: #3E4E51">RESERVATION DETAILS</h5>
                    <p style="color: #3E4E51">Start date: <strong>${reservationForm.startDate}</strong></p>
                    <p style="color: #3E4E51">End date: <strong>${reservationForm.endDate}</strong></p>
                    <p style="color: #3E4E51">Room capacity: <strong>${reservationForm.capacity}</strong></p>
                    <p style="color: #3E4E51">First name: <strong>${reservationForm.firstName}</strong></p>
                    <p style="color: #3E4E51">Last name: <strong>${reservationForm.lastName}</strong></p>
                    <p style="color: #3E4E51">Phone number: <strong>${reservationForm.phoneNumber}</strong></p>
                    <p style="color: #3E4E51">Email: <strong>${reservationForm.email}</strong></p>
                    <br>
                    <p style="color: #3E4E51">A confirmation email was sent to:
                        <strong>${reservationForm.email}</strong>
                    </p>
                </c:if>

                <c:if test="${result eq 0}">
                    <div class="errorblock">No room with capacity ${reservationForm.capacity} is available
                        between ${reservationForm.startDate}
                        and ${reservationForm.endDate}.
                    </div>
                </c:if>

                <br>
            </div>
            <div class="col-md-2"></div>
        </div>

    </div>

    <div class="col-md-2"></div>
</div>
</body>
</html>
