<%-- 
    Document   : form
    Created on : 28 oct 2024, 20:05:52
    Author     : fgmrr
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Animalito</title>
    
</head>
<body>

    <h2>Agregar Animalito</h2> <br>

<form action="/directivas/jsp/animal.jsp" method="post">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" placeholder="Ej. Teo">

    <label for="tipo">Tipo:</label>
    <input type="text" id="tipo" name="tipo" placeholder="Ej. Perro">

    <label for="edad">Edad:</label>
    <input type="number" id="edad" name="edad"  placeholder="Ej. 3">

    <label for="dueno">Dueño:</label>
    <input type="text" id="dueno" name="dueno"  placeholder="Ej. Fabiola Rangel">

    <label for="color">Color:</label>
    <input type="text" id="color" name="color"  placeholder="Ej. Negro">
    <input type="hidden" name="accion" value="agregar">
    <input type="submit" value="Agregar Animalito">
    
     <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</form>

<div >
   <a href="/directivas/jsp/directivas.jsp">Volver a la lista de animales</a>
</div>

</body>
</html>