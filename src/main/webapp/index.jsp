<%-- Document : index Created on : Oct 3, 2021, 9:51:50 AM Author : zawng --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-
              B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
  </head>
  <style type="text/css">
    .messages {
      color: #fa787e;
    }
    form.ng-submitted input.ng-invalid {
      border-color: #fa387e;
    }
    form input.ng-invalid.ng-touched {
      border-color: #fa787e;
    }
  </style>
  <body>
    <div
      class="container-fluid"
      ng-app="LaRockola2"
      ng-controller="contactosController as cn"
    >
      <form name="userForm" novalidate>
        <div class="row">
          <div class="col-12">
            <center><h1>Formulario Contactos</h1></center>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <h3>Sección 1</h3>
            <div class="row">
              <div class="col-6">
                <label>Identificación</label>
                <input
                  name="identificacion"
                  class="form-control"
                  type="number"
                  min="0"
                  ng-model="cn.identificacion"
                  ngmodel-options="{updateOn: 'blur'}"
                  required
                />
              </div>
              <div class="col-6">
                <label>Nombre</label>
                <input
                  name="nombre"
                  class="form-control"
                  type="text"
                  ng-model="cn.nombre"
                  ng-model-options="{updateOn: 'blur'}"
                  required
                />
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label>Apellido</label>
                <input
                  name="apellido"
                  class="form-control"
                  type="text"
                  min="0"
                  ng-model="cn.apellido"
                  ngmodel-options="{updateOn: 'blur'}"
                  required
                />
              </div>
              <div class="col-6">
                <label>Genero</label>
                <select
                  name="genero"
                  class="form-control"
                  ng-model="cn.genero"
                  ng-model-options="{updateOn:
                    'blur'}"
                  required
                >
                  <option>FEMENINO</option>
                  <option>MASCULINO</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label>Tipo identificación</label>
                <select
                  name="tipoIdentificacion"
                  class="form-control"
                  ng-model="cn.tipoIdentificacion"
                  ng-model-options="{updateOn:
                    'blur'}"
                  required
                >
                  <option>CC</option>
                  <option>TI</option>
                </select>
              </div>
              <div class="col-6">
                <label>Telefono</label>
                <input
                  name="telefono"
                  class="form-control"
                  type="text"
                  ng-model="cn.telefono"
                  ng-model-options="{updateOn: 'blur'}"
                  required
                />
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label>Dirección</label>
                <input
                  name="direccion"
                  class="form-control"
                  type="text"
                  min="0"
                  ng-model="cn.direccion"
                  ngmodel-options="{updateOn: 'blur'}"
                  required
                />
              </div>
              <div class="col-6">
                <label>Correo</label>
                <input
                  name="email"
                  class="form-control"
                  type="email"
                  ng-model="cn.email"
                  ng-model-options="{updateOn: 'blur'}"
                  required
                />
              </div>
            </div>
            <div><br /></div>
            <h3>Sección 2</h3>
            <div class="row">
              <div class="col-3">
                <input
                  class="btn btn-success"
                  type="submit"
                  ng-click="cn.guardarContacto()"
                  value="Guardar"
                  ng-disabled=""
                />
              </div>
              <div class="col-3">
                <button class="btn btn-primary" ng-click="cn.listarContactos()">
                  Listar contacto
                </button>
              </div>
              <div class="col-3">
                <button class="btn btn-danger" ng-click="cn.eliminarContacto()">
                  Eliminar contacto
                </button>
              </div>
              <div class="col-3">
                <button class="btn btn-warning" ng-click="cn.actualizarContacto()">
                  Actualizar contacto
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
      <div class="row">
        <div class="col-12 table-responsive-x1">
          <h3>Sección 3</h3>
          <table class="table table-striped table-hover">
            <thead class="thead-dark">
              <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Genero</th>
                <th>Tipo ID</th>
                <th>Telefono</th>
                <th>Dirección</th>
                <th>Correo</th>
              </tr>
            </thead>
            <tr ng-repeat="contacto in cn.contactos">
              <td>{{contacto.identificacion}}</td>
              <td>{{contacto.nombre}}</td>
              <td>{{contacto.apellido}}</td>
              <td>{{contacto.genero}}</td>
              <td>{{contacto.tipoIdentificacion}}</td>
              <td>{{contacto.telefono}}</td>
              <td>{{contacto.direccion}}</td>
              <td>{{contacto.correo}}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </body>
  <script>
    angular.module("LaRockola2", []).controller("contactosController", [
      "$scope",
      function ($scope) {
        $scope.user = {};
        $scope.update = function () {
          console.log($scope.user);
        };
        $scope.reset = function (form) {
          $scope.user = {};
          if (form) {
            form.$setPristine();
            form.$setUntouched();
          }
        };
        $scope.reset();
      },
    ]);

    var app = angular.module("LaRockola2", []);
    app.controller("contactosController", ["$http", controladorContactos]);

    function validar() {
      return true;
    }

    function controladorContactos($http) {
      var cn = this;
      cn.listarContactos = function () {
        var url = "Peticiones.jsp";
        var params = {
          proceso: "listarContacto",
        };
        $http({
          method: "POST",
          url: "Peticiones.jsp",
          params: params,
        }).then(function (res) {
          cn.contactos = res.data.Contactos;
        });
      };
      cn.guardarContacto = function () {
        var contacto = {
          proceso: "guardarContacto",
          identificacion: cn.identificacion,
          nombre: cn.nombre,
          apellido: cn.apellido,
          genero: cn.genero,
          tipoIdentificacion: cn.tipoIdentificacion,
          telefono: cn.telefono,
          direccion: cn.direccion,
          correo: cn.correo,
        };
        $http({
          method: "POST",
          url: "Peticiones.jsp",
          params: contacto,
        }).then(function (res) {
          if (res.data.ok === true) {
            if (res.data[contacto.proceso] === true) {
              alert("Guardado con éxito");
            } else {
              alert("Por favor verifique sus datos");
            }
          } else {
            alert(res.data.erroMsg);
          }
        });
      };
      cn.eliminarContacto = function(){
          var contacto = {
              proceso: "eliminarContacto",
              identificacion: cn.identificacion
          };
          $http({
              method: 'POST',
              url: 'Peticiones.jsp',
              params: contacto
          }).then(function(res) {
              if (res.data.ok === true) {
                  if (res.data[contacto.proceso] === true) {
                      alert("Eliminado con éxito");
                  } else {
                      alert("Por favor verifique sus datos")
                  }
              } else {
                  alert(res.data.errorMsg)
              }
          })
      };
      cn.actualizarContacto = function () {
        var contacto = {
            proceso: "actualizarContacto",
            identificacion: cn.identificacion,
            nombre: cn.nombre,
            apellido: cn.apellido,
            genero: cn.genero,
            tipoIdentificacion: cn.tipoIdentificacion,
            telefono: cn.telefono,
            direccion: cn.direccion,
            correo: cn.correo
        };
        $http({
            method: 'POST',
            url: 'Peticiones.jsp',
            params: contacto
        }).then(function(res) {
            if (res.data.ok === true) {
                  if (res.data[contacto.proceso] === true) {
                      alert("Actualizado con éxito");
                  } else {
                      alert("Por favor verifique sus datos")
                  }
              } else {
                  alert(res.data.errorMsg)
              }
        })
      };
    }
  </script>
</html>
