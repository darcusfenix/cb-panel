<!-- BEGIN DASHBOARD STATS -->
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
<!-- END DASHBOARD STATS -->

<div class="row center" ng-show="error.flag">
    <div class="col-md-6 form  col-md-offset-3">
        <h1 class="text-danger">{{error.message}}</h1>
    </div>
</div>

<div class="row" ng-hide="error.flag">
    <div class="col-md-4">
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

    <div class="col-md-8">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-blue"></i>
                    <span class="caption-subject font-green-sharp bold uppercase">Total de Pulseras Asignadas</span>

                </div>
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#">Tipo 1</a>
                    </li>
                    <li>
                        <a href="#">Tipo 2</a>
                    </li>
                </ul>
            </div>

            <div class="portlet-body">

                <div class="row" id="tab_1_1">
                    <div class="col-md-4">
                        <!-- BEGIN WIDGET THUMB -->
                        <div class="widget-thumb widget-bg-color-white text-uppercase margin-bottom-20 bordered">
                            <h4 class="widget-thumb-heading">Pulseras Asignadas</h4>

                            <div class="widget-thumb-wrap">
                                <i class="widget-thumb-icon bg-green icon-bulb"></i>

                                <div class="widget-thumb-body">
                                    <span class="widget-thumb-subtitle">USD</span>
                                    <span class="widget-thumb-body-stat">0</span>
                                </div>
                            </div>
                        </div>
                        <!-- END WIDGET THUMB -->
                    </div>

                    <div class="col-md-4">
                        <!-- BEGIN WIDGET THUMB -->
                        <div class="widget-thumb widget-bg-color-white text-uppercase margin-bottom-20 bordered">
                            <h4 class="widget-thumb-heading">Pulseras Vendidas</h4>

                            <div class="widget-thumb-wrap">
                                <i class="widget-thumb-icon bg-red icon-layers"></i>

                                <div class="widget-thumb-body">
                                    <span class="widget-thumb-subtitle">USD</span>
                                    <span class="widget-thumb-body-stat">0</span>
                                </div>
                            </div>
                        </div>
                        <!-- END WIDGET THUMB -->
                    </div>

                    <div class="col-md-4">
                        <!-- BEGIN WIDGET THUMB -->
                        <div class="widget-thumb widget-bg-color-white text-uppercase margin-bottom-20 bordered">
                            <h4 class="widget-thumb-heading">Pulseras No Vendidas</h4>

                            <div class="widget-thumb-wrap">
                                <i class="widget-thumb-icon bg-purple icon-screen-desktop"></i>

                                <div class="widget-thumb-body">
                                    <span class="widget-thumb-subtitle">USD</span>
                                    <span class="widget-thumb-body-stat">0</span>
                                </div>
                            </div>
                        </div>
                        <!-- END WIDGET THUMB -->
                    </div>
                </div>

            </div>
        </div>
        <!-- END PORTLET-->
    </div>
</div>

<div class="row" ng-hide="error.flag">
    <div class="col-md-4">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Generar Pulseras</span>
                </div>
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-12 form">
                        <!-- BEGIN FORM-->
                        <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="control-label col-md-3">Pulseras tipo 1</label>

                                    <div class="col-md-9">
                                        <div class="input-inline input-medium">
                                            <input type="number" value="1" class="form-control" min="1" max="100">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3">Pulseras tipo 2</label>

                                    <div class="col-md-9">
                                        <div class="input-inline input-medium">
                                            <input type="number" value="1" class="form-control" min="1" max="100">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3">Pulseras tipo 3</label>

                                    <div class="col-md-9">
                                        <div class="input-inline input-medium">
                                            <input type="number" value="1" class="form-control" min="1" max="100">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions right">
                                <a class=" btn green btn-outline sbold" data-target="#basic" data-toggle="modal">Generar</a>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- END PORTLET-->
    </div>

</div>

<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Confirmación:</h4>
            </div>
            <div class="modal-body"> Se van a generar pulseras para: <b>{{vendedor.nombres}} {{vendedor.apellidos}}</b> </div>

            <div class="modal-footer">
                <button type="button" class="btn red btn-outline" data-dismiss="modal">No, Cancelar</button>
                <button type="button" class="btn green" data-dismiss="modal">ok, generar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
