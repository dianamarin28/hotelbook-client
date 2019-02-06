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
    <c:url var="logoImage" value="/resources/images/logo.png"/>
    <c:url var="findHotelsStyle" value="/resources/style/findHotels.css"/>
    <link rel="stylesheet" type="text/css" href="${findHotelsStyle}">
    <c:url var="textStyle" value="/resources/style/text.css"/>
    <link rel="stylesheet" type="text/css" href="${textStyle}">
    <c:url var="errorStyle" value="/resources/style/error.css"/>
    <link rel="stylesheet" type="text/css" href="${errorStyle}">

    <c:url var="findHotelsURL" value="/findHotels"/>
</head>
<body style="background-color: #3e4e51; display: flex; align-items: center">
<div class="container">

    <div class="row">
        <div class="col-md-12 text-center">
            <img src="${logoImage}" class="img-responsive img-responsive-custom" width="280" height="170">
        </div>
    </div>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6" style="background-color: #eee8e8;">
            <h4 class="title-custom"><span class="glyphicon glyphicon-search"></span> <strong>Find the perfect
                hotel</strong></h4>

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form:form class="form-inline" method="POST" action="${findHotelsURL}" commandName="findHotelsForm">
                        <div class="form-group">
                            <form:input id="city" type="text" path="city" class="form-control" placeholder="City"/>
                        </div>
                        &nbsp;

                        <input type="submit" class="btn btn-save btn-md" value="Search"/>

                        <p class="form-text text-muted" style="font-family: 'Open Sans', sans-serif;">
                            <span class="glyphicon glyphicon-globe"></span> Choose your destination.
                        </p>
                    </form:form>

                    <c:if test="${not empty error}">
                        <div class="errorblock" style="font-family: 'Playfair Display', serif">
                            ${error}
                        </div>
                        <br>
                    </c:if>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>

</div>
</body>
</html>
