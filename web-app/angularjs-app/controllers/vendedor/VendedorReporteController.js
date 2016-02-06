/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').controller('VendedorReporteController',
    function ($rootScope,
              $scope,
              $http,
              $timeout,
              $stateParams,
              Vendedor,
              CostoPulsera,
              Persona,
              Duracion) {

        $scope.$on('$viewContentLoaded', function () {
            App.initAjax();
            $scope.getThisVendedor();
        });

        $scope.error = [];
        $scope.alerta = [];
        $scope.confirmacion;
        $scope.costosList;
        $scope.personaList;
        $scope.duracionList;

        $scope.pulseraList = [];

        $scope.idPersona = 1;
        $scope.idDuracion = 1;
        $scope.costo = 0.00;
        $scope.cantidad = 0;

        $scope.getThisVendedor = function () {
            App.blockUI(
                {
                    target: "#datos-personales",
                    boxed: !0,
                    message: "Cargando..."
                });
            App.blockUI(
                {
                    target: "#generar-pulseras",
                    boxed: !0,
                    message: "Cargando..."
                });
            $scope.vendedor = Vendedor.get({id: $stateParams.id}, function (data) {
                $scope.vendedor = data;
                App.unblockUI("#datos-personales");
                $scope.getCostosPulsera();
            }, function (err) {
                $scope.error.flag = true;
                $scope.error.message = err.data.message;
            });

        };

        $scope.getCostosPulsera = function () {
            $scope.vendedores = CostoPulsera.query(function (data) {
                $scope.costosList = data;
                $scope.getPersonas();
            }, function (err) {
                $scope.error.flag = true;
            });
        };

        $scope.getPersonas = function () {
            $scope.vendedores = Persona.query(function (data) {
                $scope.personaList = data;
                $scope.getDuracion();
            }, function (err) {
                $scope.error.flag = true;
            });
        };

        $scope.getDuracion = function () {
            $scope.vendedores = Duracion.query(function (data) {
                $scope.duracionList = data;
                App.unblockUI("#generar-pulseras");
            }, function (err) {
                $scope.error.flag = true;
            });
        };


        $scope.getNameOfPersona = function (id) {
            for (var i = 0; i < $scope.personaList.length; i++) {
                if (id == $scope.personaList[i].id) {
                    return $scope.personaList[i].nombre;
                }
            }
        };

        $scope.getHorasOfDuracion = function (id) {
            for (var i = 0; i < $scope.duracionList.length; i++) {
                if (id == $scope.duracionList[i].id) {
                    return $scope.duracionList[i].duracion;
                }
            }
        };

        $scope.getTotalBetweenPersonaAndDuracion = function (persona, duracion) {
            for (var i = 0; i < $scope.costosList.length; i++) {
                if (persona == $scope.costosList[i][2].persona.id &&
                    duracion == $scope.costosList[i][2].duracion.id) {

                    for (var j = 0; j < $scope.pulseraList.length; j++) {
                        if ($scope.pulseraList[j].costo == $scope.costosList[i][0]) {
                            return $scope.pulseraList[j].cantidad;
                        }
                    }

                }
            }
        };

        $scope.getTotalByDuracion = function (duracion) {
            var total = 0;
            for (var i = 0; i < $scope.costosList.length; i++) {
                if (duracion == $scope.costosList[i][2].duracion.id) {

                    for (var j = 0; j < $scope.pulseraList.length; j++) {
                        if ($scope.pulseraList[j].costo == $scope.costosList[i][0]) {
                            total += $scope.pulseraList[j].cantidad;
                        }
                    }

                }
            }
            return total;
        };

        $scope.getTotalByPersona = function (persona) {
            var total = 0;
            for (var i = 0; i < $scope.costosList.length; i++) {
                if (persona == $scope.costosList[i][2].persona.id) {

                    for (var j = 0; j < $scope.pulseraList.length; j++) {
                        if ($scope.pulseraList[j].costo == $scope.costosList[i][0]) {
                            total += $scope.pulseraList[j].cantidad;
                        }
                    }

                }
            }
            return total;
        };

        $scope.getTotalOfPulseras = function () {
            var total = 0;

            for (var j = 0; j < $scope.pulseraList.length; j++) {
                total += $scope.pulseraList[j].cantidad;
            }

            return total;
        };


    });