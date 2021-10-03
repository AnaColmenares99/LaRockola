<%-- 
    Document   : Peticiones
    Created on : Sep 28, 2021, 4:36:32 PM
    Author     : AnaColmenares
--%>
<!-- Importar librerias --> 

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Contacto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java"
        pageEncoding="iso-8859-1" session="true"%>

<% // Inicializar esa respuesta JSON

    Contacto cl = new Contacto();
    String respuesta = "{";
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

    // Lista de procesos o tareas a realizar    
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarContacto",
        "eliminarContacto",
        "listarContacto",
        "guardarContacto"
    });

    String proceso = "" + request.getParameter("proceso");
    Contacto c = new Contacto();

    // Condicional para administrar el ArrayList "tareas"
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\":true,";
    } else {
        respuesta += "\"ok\":false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son invalidos. Corrijalos y vuelva a intentar por favor.\"";
    }

    // Proceso = Guardar contacto
    if (proceso.equals("guardarContacto")) {
        int ident = Integer.parseInt(request.getParameter("identificacion"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String genero = request.getParameter("genero");
        String tipoident = request.getParameter("tipoIdentificacion");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");

        boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));

        c.llenarContacto(ident, nombre, apellido, genero, tipoident, telefono, direccion, correo);

        if (c.guardarContacto()) {
            respuesta += "\"" + proceso + "\": true";
        } else {
            respuesta += "\"" + proceso + "\": false";
        }
    } // Proceso = eliminar contacto
    else if (proceso.equals("eliminarcontacto")) {
        int identificacion = Integer.parseInt(request.getParameter("identificacion"));

        if (c.borrarContacto(identificacion)) {
            respuesta += "\"" + proceso + "\": true";
        } else {
            respuesta += "\"" + proceso + "\": false";
        }
    } //Proceso = listar contacto
    else if (proceso.equals("listarcontacto")) {
        try {
            List<Contacto> lista = c.listarContactos();
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(lista);
        } catch (SQLException ex) {
            respuesta += "\"" + proceso + "\": true,\"Contactos\":[]";
            Logger.getLogger(Contacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    } // Proceso = actualizar contacto
    else if (proceso.equals("actualizarcontacto")) {
        int ident = Integer.parseInt(request.getParameter("identificacion"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String genero = request.getParameter("genero");
        String tipoident = request.getParameter("tipoIdentificacion");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");

        boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
        c.llenarContacto(ident, nombre, apellido, genero, tipoident, telefono, direccion, correo);

        if (c.actualizarContacto()) {
            respuesta += "\"" + proceso + "\": true";
        } else {
            respuesta += "\"" + proceso + "\": false";
        }
    } // --------- FIN PROCESOS --------
    // ------- ------- ------- -------
    // Proceso desconocido.
    else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg: \"Lo sentimos, los datos que ha enviado,"
                + " son invalidos. Corrijalos y vuelva a intertar por favor\"";
    }
    // Usuario sin sesi?n.
    // Responder como objteo JSON codificaci?n ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>