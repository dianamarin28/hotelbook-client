<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="reservationURL" value="${reservationURI}"/>

<c:if test="${isAvailable}">
    <h4 style="font-family: 'Playfair Display', serif; color: #992C2C">Room is available!</h4>
    <a href="${reservationURL}"><input type="submit" class="btn btn-reservation btn-sm" value="Make reservation"/></a>
</c:if>
<c:if test="${! isAvailable}">
    <h4 style="font-family: 'Playfair Display', serif; color: #992C2C">No room is currently available for your filters!</h4>
</c:if>
