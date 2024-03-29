<%--
  Created by IntelliJ IDEA.
  User: Damperius
  Date: 04/06/2015
  Time: 06:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="v.market.Product" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'star-rating.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'custom.css')}" />
    <!-- ||||||||||||||| SCRIPTS ||||||||||||||| -->
    <g:javascript src="jquery-1.11.2.min.js" />
    <g:javascript src="bootstrap.min.js" />
    <g:javascript src="bootstrap-filestyle.js"/>
    <g:javascript src="star-rating.js"/>

    <title>Editar Producto</title>

    <script type="text/javascript">
        $(document).ready(function(){
            // with plugin options
            $("#input-id").rating({
                'size':'sm',
                //'value' : '3',
                showClear: false,
                starCaptions: {1: "Muy malo", 2: "Malo", 3: "Regular", 4: "Bueno", 5: "Excelente"},
                clearCaption: "Sin calificación"
            });
        });
    </script>

</head>

<body>
<br class="container">
<g:render template="/layouts/navbar"></g:render>
</br>
</br>
<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
        <g:form role="form" enctype="multipart/form-data" url="[resource:product, action:'update']">
            <h2>Edita un producto
                <br/><br/>
                <small style="color: #ffffff;">Aqui podrás actualizar la informacion de nuestra comunidad.</small>
            </h2>
            <hr class="colorgraph">
            <div class="card card-container-register">
                <g:hasErrors bean="${product}">
                    <div class="errors">
                        <label style="color: red"> Revisa los campos</label>
                    </div>
                </g:hasErrors>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <img class="img-thumbnail center-block" src="${createLink(controller:'product', action:'showImage', id:"${product.id}")}" style="width: auto; height: 150px" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <strong>Nombre del producto: </strong><p><g:fieldValue bean="${product}" field="name"/></p>
                        <strong>Marca: </strong><p><g:fieldValue bean="${product}" field="trademark"/></p>
                        <strong>Tamaño / cantidad: </strong><p ><g:fieldValue bean="${product}" field="size"/></p>
                        <strong>Categoria: </strong><p><g:fieldValue bean="${product}" field="category"/></p>
                    </div>
                </div>
                <hr/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <input type="file" class="filestyle" data-buttonText="  Cambia la imagen (opcional)" data-buttonName="btn-primary" id="image" name="image"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-7">
                        <div class="form-group">
                            <label for="store">Almacén:</label>
                            <select type="text" name="store" id="store" formmethod="POST" class="form-control input-lg" tabindex="8">
                                <g:each in="${stores}" status="i" var="it">
                                    <option value="${it.id}">${it}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-5 col-md-5">
                        <label for="prize">Precio:</label>
                        <div class="form-group input-group">
                            <span class="input-group-addon">$</span>
                            <input type="number" min="0" name="price" id="prize" formmethod="POST" class="form-control input-lg" placeholder="Ej: 1000" tabindex="7">
                        </div>
                        <g:hasErrors bean="${product}" field="price">
                            <label style="color: red"> * Este campo no puede ir vacio</label>
                        </g:hasErrors>
                    </div>
                </div>
                <br/>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group text-center">
                            <input id="input-id" name="rating" type="number" min=0 max=5 step=1 value="3">
                        </div>
                    </div>
                </div>
                <g:if test="${flash.message}">
                    <label style="color: red"> * ${flash.message}</label>
                </g:if>
                <hr class="colorgraph">
                <div class="form-group">
                    <g:actionSubmit  value="Terminar edición" action="update" class="btn btn-lg btn-primary btn-block btn-signin" tabindex="9"/>
                </div>

            </div>
        </g:form>
    </div>
</div>
</body>
</html>