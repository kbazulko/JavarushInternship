<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
  <title>Данные пользователя</title>

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
<h1>Данные пользователя</h1>

<c:url var="addAction" value="/users/add"/>
<form:form action="${addAction}" commandName="user">
  <table>
    <c:if test="${!empty user.name}">
    <tr>
      <td>
        <form:label path="id">
          <spring:message text="ID"/>
        </form:label>
      </td>
      <td>
        <form:input path="id" readonly="true" size="8" disabled="true"/>
        <form:hidden path="id"/>
      </td>

      </c:if>

      <td>
        <form:label path="name">
          <spring:message text="Имя"/>
        </form:label>
      </td>
      <td>
        <form:input path="name"/>
      </td>


      <td>
        <form:label path="age">
          <spring:message text="Возраст"/>
        </form:label>
      </td>
      <td>
        <form:input path="age"/>
      </td>


      <td>
        <form:checkbox path="admin" value="isAdmin"/>Администратор
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <c:if test="${!empty user.name}">
          <input type="submit"
                 value="<spring:message text="Изменить"/>"/>
        </c:if>
        <c:if test="${empty user.name}">
          <input type="submit"
                 value="<spring:message text="Добавить"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
</body>
</html>