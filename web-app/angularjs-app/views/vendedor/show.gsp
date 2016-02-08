
<div class="row center" ng-show="error.flag">
    <div class="col-md-6 form  col-md-offset-3">
        <h1 class="text-danger">{{error.message}}</h1>
    </div>
</div>

<div class="row" ng-hide="error.flag" >
    <div class="col-md-8" >
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered " id="datos-personales">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Datos Personales</span>

                </div>
            </div>

            <div class="portlet-body"  data-ng-include="'angularjs-app/views/vendedor/tpl/datos-personales.gsp'">

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

            <div class="portlet-body form" id="generar-pulseras">
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
                        <div  data-ng-include="'angularjs-app/views/vendedor/tpl/resumen-generar.gsp'">

                        </div>
                        <div class="row text-right">

                            <a  type="button"
                                class="btn btn-success green"
                                ng-disabled="getTotalOfPulseras() == 0"
                                ng-hide=" getTotalOfPulseras() == 0"
                                ng-click="null"
                                data-toggle="modal" href="#generar">Generar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PORTLET-->
    </div>
</div>

<div class="portlet box yellow">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-cogs"></i>Mis generaciones y asignaciones</div>
        <div class="tools">
            <a href="javascript:;" class="collapse"> </a>
            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
            <a href="javascript:;" class="reload"> </a>
            <a href="javascript:;" class="remove"> </a>
        </div>
    </div>
    <div class="portlet-body" id="p-b-vendedor-list">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th> # </th>
                    <th> Nombre </th>
                    <th> Apellido </th>
                    <th> Usuario</th>
                    <th> Otro</th>
                    <th> Fecha </th>
                    <th> Total de pulseras asignadas  </th>
                    <th> Resumen  </th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="vendedor in vendedorList">
                    <td> {{vendedor.id}} </td>
                    <td> {{vendedor.nombres}} </td>
                    <td> {{vendedor.apellidos}} </td>
                    <td> {{vendedor.username}} </td>
                    <td> </td>
                    <td>  </td>
                    <td>  </td>
                </tr>
                <tr >
                    <td>  </td>
                    <td>  </td>
                    <td>  </td>
                    <td> </td>
                    <td>  </td>
                    <td>  </td>
                    <td> Total </td>
                    <td class="text-center">
                        <a href="#/vendedor/{{vendedor.id}}/reporte-pulseras" class="btn btn-success">Resumen</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>



<div class="row">
    <div class="table-scrollable table-scrollable-borderless">
        <table class="table table-hover table-light">
            <tr class="uppercase">
                <th class="bold font-green text-center">Tipo de Persona</th>
                <th class="bold font-green text-center">
                    L-V
                </th>
                <th class="bold font-green text-center">
                    Fines de semana
                </th>
                <th class="bold font-green text-center">Total</th>
            </tr>


            <tr >
                <th class="font-blue text-uppercase  text-center">adulto</th>
                <th class=" text-center" ng-repeat="duracion in duracionList">
                </th>
                <th class="text-center bold font-green">
                </th>
                <th class="text-center bold font-green">
                </th>
            </tr>
            <tr >
                <th class="font-blue text-uppercase  text-center">NIÑO</th>
                <th class=" text-center" >
                </th>
                <th class="text-center bold font-green">
                </th>
                <th class="text-center bold font-green">
                </th>
            </tr>
            <tr>
                <th class="font-blue text-uppercase  text-center">Total</th>
                <th class="bold font-green text-center" >
                </th>
                <th class="text-center bold font-green">
                </th>
                <th class="text-center bold font-green">
                </th>
            </tr>
        </table>
    </div>
</div>



<div class="portlet light bordered ">

    <div class="portlet-body" id="rs-busqueda">

        <div class="table-scrollable table-scrollable-borderless">
            <table class="table table-hover table-light">
                <thead>
                <tr class="uppercase">
                    <th  class="text-center bold font-green">Personas</th>
                    <th colspan="2" class="text-center bold font-green">Lunes - Viernes</th>
                    <th colspan="2" class="text-center bold font-green">Fin de semana</th>
                    <th class="bold font-green">Total</th>
                </tr>
                <tr class="uppercase">
                    <th class="bold font-green"></th>
                    <th class="bold font-green">No Venta</th>
                    <th class="bold font-green">Venta</th>
                    <th class="bold font-green">No Venta</th>
                    <th class="bold font-green">Venta</th>
                    <th class="text-center bold font-green"></th>
                </tr>
                </thead>
                <tr >
                    <th class="font-blue text-uppercase  text-center">ADULTO</th>
                    <th class=" " >
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                </tr>
                <tr >
                    <th class="font-blue text-uppercase  text-center">Niño</th>
                    <th class=" " >
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                </tr>
                <tr >
                    <th class="font-blue text-uppercase  text-center">Total</th>
                    <th class="" >
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                    <th class="">
                        0
                    </th>
                </tr>
            </table>
        </div>
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
<div id="generar" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Confirmar</h4>
            </div>
            <div class="modal-body" data-ng-include="'angularjs-app/views/vendedor/tpl/resumen-generar.gsp'">
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn red" >Cancelar</button>
                <button type="button" data-dismiss="modal" class="btn green" ng-click="generarPulseras()">Sí, generar</button>
            </div>
        </div>
    </div>
</div>