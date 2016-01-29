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
    <div class="col-md-6">
        <!-- BEGIN PORTLET-->
        <div class="portlet light bordered ">
            <div class="portlet-title">
                <div class="caption caption-md">
                    <i class="icon-bar-chart font-red"></i>
                    <span class="caption-subject font-red bold uppercase">Generar y Asignar Pulseras</span>

                </div>
            </div>

            <div class="portlet-body">
                <form role="form">

                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-2 control-label">Email</label>
                            <div class="input-group input-large">
                                <div class="col-md-10">
                                    <input type="text" class="form-control" placeholder=".input-medium">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
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

            <div class="modal-body">Se van a generar pulseras para: <b>{{vendedor.nombres}} {{vendedor.apellidos}}</b>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn red btn-outline" data-dismiss="modal">No, Cancelar</button>
                <button type="button" class="btn green" data-dismiss="modal">ok, generar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
