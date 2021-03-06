<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: andrei
  Date: 18.04.2016
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ro">
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="description" content="Serviciu pentru Programarea la medic">
<meta name="keywords" content="Dinti, programare, dental, stomatologie ">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Andrei Rotari">

<head>
    <%@include file="/WEB-INF/views/template/headering.jsp" %>
    <%@include file="/WEB-INF/views/template/js-libs.jsp" %>
    <title>In curs de dezvoltare</title>
</head>

<body>
<header class="container-fluid">
    <%@include file="/WEB-INF/views/template/nav.jsp" %>
</header>

<div class="inner-wr container">
    <form:form action="${pageContext.request.contextPath}/doctor/editDocSchedulerMon" method="post" id="worckTime"
               commandName="worckTime">
        <c:forEach items="${worckTimes}" var="day">
            <div class="col-xs-6">
                <div class=" form-group"><c:out value="${day.title}"></c:out></div>
                <input hidden name="title[]" value="${day.title}">
                <input hidden type="text" name="id[]" value="${day.worckTimeId}">
                <div class=" form-group">
                    <label> <span class="glyphicon glyphicon-time"></span> Inceput: </label>
                    <input class="form-control timepicker" name="start[]" value="${day.start}" type="text"/>
                </div>
                <div class=" form-group">
                    <label for="choose-time"><span class="glyphicon glyphicon-time"></span>Sfirsit</label>
                    <input name="end[]" class="form-control timepicker2" value="${day.end}" type="text"/>
                </div>
                <div class=" form-group">
                    <label><input type="radio" value="true" name="<c:out value="${day.title}toWork" />"
                                  <c:if test="${day.dountWork == 'true'}">checked="checked"</c:if>/>Zi de lucru</label>
                    <label><input type="radio" value="false" name="<c:out value="${day.title}toWork" />"
                                  <c:if test="${day.dountWork == 'false'}">checked="checked"</c:if>/>Zi de
                        odihna</label>
                </div>
            </div>
        </c:forEach>
        <input type="submit" id="btn btn-info" value="Confirma" class="col-xs-3">
    </form:form>
</div>

<div class="mt-10"></div>
<%@include file="/WEB-INF/views/template/footer.jsp" %>
<script>
    $(document).ready(function () {
        $('input.timepicker').timepicker({
            timeFormat: 'HH:mm:ss',
            minTime: '08:00:00',
            // 11:45:00 AM,
            maxHour: 20,
            maxMinutes: 30,
            startTime: new Date(0, 0, 0, 8, 0, 0),
            // 3:00:00 PM - noon
            interval: 60
            // 15 minutes
        });
        $('input.timepicker2').timepicker({
            timeFormat: 'HH:mm:ss',
            minTime: '08:00:00',
            // 11:45:00 AM,
            maxHour: 20,
            maxMinutes: 30,
            startTime: new Date(0, 0, 0, 18, 0, 0),
            // 3:00:00 PM - noon
            interval: 60
            // 15 minutes
        });
    });
</script>
</body>
</html>

