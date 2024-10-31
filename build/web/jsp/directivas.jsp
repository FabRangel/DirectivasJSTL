<%-- 
    Document   : directivas
    Created on : 28 oct 2024, 19:45:03
    Author     : fgmrr
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String tipo = request.getParameter("tipo");
    String edad = request.getParameter("edad");
    String dueno = request.getParameter("dueno");
    String color = request.getParameter("color");

    List<String[]> animales = (List<String[]>) session.getAttribute("animales");
    if (animales == null) {
        animales = new ArrayList<>();
        session.setAttribute("animales", animales);
    }

    if ("agregar".equals(accion) && nombre != null && !nombre.isEmpty()) {
        String[] nuevoAnimal = {nombre, tipo, edad, dueno, color};
        animales.add(nuevoAnimal);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Listado de Animales</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Listado de Animales</h2>
        <c:choose>
            <c:when test="${empty animales}">
                <p>No hay elementos disponibles en este momento.</p>
            </c:when>
            <c:otherwise>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Edad</th>
                            <th>Dueño</th>
                            <th>Color</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="contador" value="1"/>
                        <c:forEach var="animal" items="${animales}">
                            <tr>
                                <td> 
                                    ${contador}
                                </td>
                                <td>${animal[0]}</td>
                                <td>${animal[1]}</td>
                                <td>${animal[2]}</td>
                                <td>${animal[3]}</td>
                                <td>${animal[4]}</td>
                            </tr>
                            <c:set var="contador" value="${contador + 1}"/> 
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <a href="/directivas/jsp/form.jsp">Agregar Animalito</a>   
    </body>
</html>