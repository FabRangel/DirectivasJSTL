<%-- 
    Document   : animal
    Created on : 28 oct 2024, 20:19:41
    Author     : fgmrr
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String tipo = request.getParameter("tipo");
    String edad = request.getParameter("edad");
    String dueno = request.getParameter("dueno");
    String color = request.getParameter("color");

    String errorMessage = "";
    
    // Validación
    if (nombre == null || nombre.isEmpty()) {
        errorMessage = "El nombre es obligatorio.";
    } else if (tipo == null || tipo.isEmpty()) {
        errorMessage = "El tipo de animal es obligatorio.";
    } else if (edad == null || edad.isEmpty()) {
        errorMessage = "La edad no puede ser un campo vacío.";
    } else if (dueno == null || dueno.isEmpty()) {
        errorMessage = "El nombre del dueño es obligatorio.";
    } else if (color == null || color.isEmpty()) {
        errorMessage = "El color es obligatorio.";
    }

    if (!errorMessage.isEmpty()) {
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/jsp/form.jsp").forward(request, response);
        return; 
    }

    List<String[]> animales = (List<String[]>) session.getAttribute("animales");
    if (animales == null) {
        animales = new ArrayList<>();
        session.setAttribute("animales", animales);
    }

    String[] nuevoAnimal = {nombre, tipo, edad, dueno, color};
    animales.add(nuevoAnimal);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Listado de Animales</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Animal agregado exitosamente!</h2>
        <a href="/directivas/jsp/directivas.jsp">Ver tabla</a>
    </body>
</html>