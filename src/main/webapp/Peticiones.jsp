<%-- 
    Document   : Peticiones
    Created on : Sep 28, 2021, 4:36:32 PM
    Author     : zawng
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Contacto"%>
<%@page import="persistencia.ConexionBD"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java"
        pageEncoding="iso-8859-1" session="true"%>

<% // Inicializar esa respuesta JSON

    Contacto cl = new Contacto();
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "actualizarContacto",
        "eliminarContacto",
        "listarContacto",
        "guardarContacto"
    });
    
    String proceso = "" + request.getParameter("proceso");
%>