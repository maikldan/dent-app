<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="confirm-block">
    <h1>Infromatia Programarii</h1>
    <div class="confirm-info-txt" id="choosedDoc" data-info="${choosedDoc.doctorId}"><span>Medic:</span> <c:out
            value="${choosedDoc.doctorName} ${choosedDoc.doctorSurname}"/></div>
    <div class="confirm-info-txt" id="choosedDate" data-info="${choosedDate.toString()}">
        <span>Data:</span> ${choosedDate.toString()}</div>
    <div class="confirm-info-txt"><span>Ora: </span>
        <div id="ModalHour">Alege Ora</div>
    </div>
    <div id="addMeet">
        <div class="txt-need-login">Pentru a vă programa trebuie sa vă logați sau să vă creați cont</div>
        <div>
            <a href="<c:url value="/login"/>" class="">Autentificare</a>
            <a href="<c:url value="/register"/>" class="">Înregistrare</a>
            <a href="<c:url value="/calendar"/>" class="">Înapoi</a>
        </div>
    </div>
</div>

<ul class="table-day">
    <%--//for pentru orele de la 8-00 la 18-00--%>
    <c:forEach var="number" begin="8" end="18">
        <c:set var="contor" value="${false}" scope="session"></c:set>
        <c:choose>
            <c:when test="${number < 10}">
                <c:set var="StringHour" value="0${number.toString()}" scope="session"></c:set>
            </c:when>
            <c:otherwise>
                <c:set var="StringHour" value="${number.toString()}" scope="session"></c:set>
            </c:otherwise>
        </c:choose>
        <c:set var="hour" value="${StringHour}:00:00" scope="session"></c:set>
        <%--//for pentru a scoate din db list cu orele ocupate--%>
        <c:forEach items="${SortedMitings}" var="meeting">
            <%--//verificare daca ora este ocupata atunci butonul este disabled daca liber este enabled--%>
            <c:if test="${meeting.hourTime.toString() == hour}">
                <c:set var="contor" value="${true}" scope="session"></c:set>
            </c:if>
        </c:forEach>
        <%--verificam daca contro e true atunci afisam buton disabled--%>
        <c:choose>
            <c:when test="${contor == true}">
                <li class="time-chose">
                    <label for=""> <c:out value="${number.toString()}:00:00"/></label>
                    <button class="make-apoint disabled" id="" value="${hour}" data-toggle="tooltip"
                            title="Alege Ora Libera" disabled><span class="glyphicon glyphicon-remove-sign"
                                                                    aria-hidden="true"></span></button>
                </li>
            </c:when>
            <c:otherwise>
                <li class="time-chose">
                    <label for=""> <c:out value="${number.toString()}:00:00"/></label>
                    <button class="make-apoint" id="SetModalHour" value="${hour}" data-toggle="tooltip"
                            title="${hour}"><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
                    </button>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</ul>

<script>
    $(document).ready(function () {

        $('.make-apoint').on('click', function () {
            var timeValue = $(this).attr('value');
            $('#hourTime').val(timeValue);
            $('#hourTime').text(timeValue);
            $('#ModalHour').html(timeValue);
            $("#btnAddMeeting").addClass("display-block");
        });
        $.get("client/MeetingCalendar/addMeeting", function (data) {
            $("#addMeet").html(data);
        });

    });

</script>