<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <title>Пользователи</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Главное меню</a>

<br/>
<br/>

<h1>Список пользователей</h1>
<p>Здесь можно просмотреть, изменить список, добавить или удалить пользователей</p>

<c:url var="addAction" value="users/search"/>

<form:form action="${addAction}" commandName="user">
    <table>
    <tr>
    <input type="text" name="searchName" id="searchName"
           placeholder="введите имя для поиска..."/>

    <input type="submit"
    value="<spring:message text="Поиск"/>"/>
    </tr>
    </table>
</form:form>
<a href="/userdata/0">Добавить пользователя</a>

    <c:if test="${!empty listUsers}">
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">Имя</th>
                <th width="60">Возраст</th>
                <th width="60">Администратор</th>
                <th width="120">Дата создания</th>
                <th width="60">Удалить</th>
            </tr>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td><a href="/userdata/${user.id}">${user.name}</a></td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${user.createDate}</td>
                    <td><a href="<c:url value='/remove/${user.id}'/>">Удалить</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <div id="pagination">


    <c:url value="/users" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/users" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/users" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
    </div>

    </body>
    </html>
