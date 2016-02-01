<!--
<div class="row">
    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>

            <div class="details">
                <div class="number">1349</div>

                <div class="desc">New Feedbacks</div>
            </div>
            <a class="more" href="#">View more
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="fa fa-bar-chart-o"></i>
            </div>

            <div class="details">
                <div class="number">12,5M$</div>

                <div class="desc">Total Profit</div>
            </div>
            <a class="more" href="#">View more
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="fa fa-shopping-cart"></i>
            </div>

            <div class="details">
                <div class="number">549</div>

                <div class="desc">New Orders</div>
            </div>
            <a class="more" href="#">View more
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="fa fa-globe"></i>
            </div>

            <div class="details">
                <div class="number">+89%</div>

                <div class="desc">Brand Popularity</div>
            </div>
            <a class="more" href="#">View more
                <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
</div>
-->

<div class="row center" ng-show="error.flag">
    <div class="col-md-6 form  col-md-offset-3">
        <h1 class="text-danger">{{error.message}}</h1>
    </div>
</div>

<div class="row" ng-hide="error.flag">
    <div class="col-md-8">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Datos Personales</span>

                </div>
            </div>

            <div class="portlet-body">

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Nombres:
                    </div>

                    <div class="col-md-7 value">
                        {{vendedor.nombres}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Apellidos:
                    </div>

                    <div class="col-md-7 value">
                        {{vendedor.apellidos}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        correo electrónico:
                    </div>

                    <div class="col-md-7 value">
                        {{vendedor.correo}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Estado:
                    </div>

                    <div class="col-md-7 value">
                        <span class="label label-success "
                              ng-class="vendedor.activo ? 'label-success' : 'label-danger'">
                            {{ vendedor.activo ? 'Activo': 'bloqueado'}}</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PORTLET-->
    </div>
</div>

<div class="row" ng-hide="error.flag">
    <div class="col-md-12">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Generar y Asignar Pulseras</span>
                </div>
            </div>

            <div class="portlet-body form">
                <div class="row form-horizontal">
                    <div class="col-md-5 form-body">
                        <div class="row text-center">
                            <h4>Seleccione las opciones para modificar cantidad:</h4>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Persona: <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-9">
                                <select ng-init="personaList[0].id"
                                        ng-model="idPersona"
                                        ng-options=" persona.id as persona.nombre for persona in personaList "
                                        ng-change="updateCosto()"
                                        required class="form-control text-uppercase">
                                </select>
                            </div>
                        </div>

                        <div class="form-group {{alerta.flag ? 'has-error' : ''}}">
                            <label class="col-md-3 control-label">Duración: <span class="text-danger">*</span>
                            </label>
                            <div class="col-md-9">
                                <select ng-init="duracionList[0].id"
                                        ng-model="idDuracion"
                                        ng-options=" duracion.id as (duracion.duracion + '  Horas') for duracion in duracionList "
                                        ng-change="updateCosto()"
                                        required class="form-control text-uppercase">
                                </select>
                                <span class="help-block" ng-show="alerta.flag"> {{alerta.message}} </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Costo:
                            </label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" value="{{ costo  | currency}}" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Cantidad de Pulseras:
                            </label>
                            <div class="col-md-9">
                                <input type="number" class="form-control" value="0" ng-model="cantidad" min="1" step="1">
                            </div>
                        </div>

                        <div class="form-actions text-right">
                            <a  type="button"
                               class="btn btn-success green"
                               ng-disabled="cantidad <= 0 || alerta.flag"
                               ng-hide="cantidad <= 0 || alerta.flag"
                                ng-click="preparConfirmacion()"
                                data-toggle="modal" href="#static">Añadir</a>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="row text-center">
                            <h4>Resumen de Pulseras a Generar y Asignar a: <b>{{vendedor.nombres}} {{vendedor.apellidos}}</b></h4>
                        </div>
                        <div class="row">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th class="bold font-green text-center"></th>
                                        <th class="bold font-green text-center" ng-repeat="duracion in duracionList">
                                            {{duracion.duracion + (' Horas')}}
                                        </th>
                                        <th class="text-center bold font-green">Total</th>
                                    </tr>
                                    </thead>

                                    <tr ng-repeat="persona in personaList">
                                        <th class="font-blue text-uppercase  text-center">{{persona.nombre}}</th>
                                        <th class=" text-center" ng-repeat="duracion in duracionList">
                                            {{ getTotalBetweenPersonaAndDuracion(persona.id, duracion.id) }}
                                        </th>
                                        <th class="text-center bold font-green">
                                            {{ getTotalByPersona(persona.id) }}
                                        </th>
                                    </tr>

                                    <tr>
                                        <th class="font-blue text-uppercase  text-center">Total</th>
                                        <th class="bold font-green text-center" ng-repeat="duracion in duracionList">
                                            {{ getTotalByDuracion(duracion.id) }}
                                        </th>
                                        <th class="text-center bold font-green">
                                            {{ getTotalOfPulseras() }}
                                        </th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <button class="btn btn-success" ng-click="generarPulseras()">Generar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PORTLET-->
    </div>
</div>


<div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Aviso</h4>
            </div>
            <div class="modal-body">
                <p> {{confirmacion}} </p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn red" >Cancelar</button>
                <button type="button" data-dismiss="modal" class="btn green" ng-click="sumarPulseras()">Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="row" ng-hide="error.flag">
    <div class="col-md-8">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Reporte Pulseras</span>

                </div>
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="table-scrollable table-scrollable-borderless">
                        <table class="table table-hover table-light">
                            <thead>
                            <tr class="uppercase">
                                <th colspan="2" class="bold font-green">Tipo</th>
                                <th class="bold font-green">6 Hrs.</th>
                                <th class="bold font-green">12 Hrs.</th>
                                <th class="bold font-green">24 Hrs.</th>
                                <th class="text-center bold font-green">Total</th>
                            </tr>
                            </thead>
                            <tr>
                                <th colspan="2" class="font-blue">Niño</th>
                                <th>12</th>
                                <th>13</th>
                                <th>14</th>
                                <th class="text-center bold font-green">39</th>
                            </tr>
                            <tr>
                                <th colspan="2" class="font-blue">Adulto</th>
                                <th>12</th>
                                <th>13</th>
                                <th>14</th>
                                <th class="text-center bold font-green">39</th>
                            </tr>
                            <tr>
                                <th colspan="2" class="font-blue">Total</th>
                                <th class="bold font-green">24</th>
                                <th class="bold font-green">26</th>
                                <th class="bold font-green">28</th>
                                <th class="text-center bold font-green">78</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PORTLET-->
    </div>
</div>
