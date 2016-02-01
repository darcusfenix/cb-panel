/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').controller('VendedorShowController',
    function ($rootScope,
              $scope,
              $http,
              $timeout,
              $stateParams,
              Vendedor,
              CostoPulsera,
              Persona,
              Duracion,
              Pulsera) {

        $scope.$on('$viewContentLoaded', function () {
            App.initAjax();
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



        $scope.vendedor = Vendedor.get({id: $stateParams.id}, function (data) {
            $scope.vendedor = data;
            $scope.getCostosPulsera();
        }, function (err) {
            $scope.error.flag = true;
            $scope.error.message = err.data.message;
        });

        $scope.getCostosPulsera = function () {
            $scope.vendedores = CostoPulsera.query(function (data) {
                $scope.costosList = data;
                //todo Debido a un error entre db y mapeo cuidar la posición del segundo corchete para --> $scope.costosList[i][2]
                $scope.getPersonas();
                $scope.prepararEnvio();
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
            }, function (err) {
                $scope.error.flag = true;
            });
        };

        $scope.updateCosto = function () {
            $scope.alerta.flag = false;
            var flag = false;
            for (var i = 0; i < $scope.costosList.length; i++) {
                if ($scope.idPersona == $scope.costosList[i][2].persona.id &&
                    $scope.idDuracion == $scope.costosList[i][2].duracion.id) {
                    $scope.costo = $scope.costosList[i][1];
                    return null;
                }
            }
            if (!flag) {
                $scope.alerta.flag = true;
                $scope.alerta.message = "Esta persona no cuenta con estas horas";
            }
            $scope.preparConfirmacion();
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

        $scope.preparConfirmacion = function () {
            $scope.confirmacion = "Añadir " + $scope.cantidad + " pulseras a " + $scope.vendedor.nombres + " " + $scope.vendedor.apellidos + "" +
                " para " + $scope.getNameOfPersona($scope.idPersona) + " de " + $scope.getHorasOfDuracion($scope.idDuracion) + " horas ?.";
        };

        $scope.prepararEnvio = function () {
            for (var i = 0; i < $scope.costosList.length; i++) {
                $scope.pulsera = {
                    "vendedor": $stateParams.id,
                    "cantidad": 0,
                    "costo": $scope.costosList[i][0]
                };
                $scope.pulseraList.push($scope.pulsera);
            }
        };

        $scope.sumarPulseras = function () {
            if ($scope.cantidad <= 0 || isNaN($scope.cantidad) || $scope.cantidad == null)
                return;

            for (var i = 0; i < $scope.costosList.length; i++) {
                if ($scope.idPersona == $scope.costosList[i][2].persona.id &&
                    $scope.idDuracion == $scope.costosList[i][2].duracion.id) {
                    for (var j = 0; j < $scope.pulseraList.length; j++) {
                        if ($scope.pulseraList[j].costo == $scope.costosList[i][0]) {
                            $scope.pulseraList[j].cantidad = $scope.cantidad;
                        }
                    }
                }
            }
            $scope.alerta.flag = false;
            $scope.cantidad = 0;
            return;
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

        $scope.pulseraInstance = Pulsera.create(function (data) {
            $scope.pulseraInstance = data;
        });

        $scope.generarPulseras = function () {
            $scope.pulseraInstance.$save({
                "json": $scope.generarJSON(),
                "idVendedor": $stateParams.id
            }, function (data, status, headers, config) {
console.log(data);
/*
                var anchor = angular.element('<a/>');
                anchor.attr({
                    href: 'data:attachment/csv;charset=utf-8,' + (data),
                    target: '_blank',
                    download: 'filename.csv'
                })[0].click();

*/
                var hiddenElement = document.createElement('a');

                hiddenElement.href = 'data:text/csv,' + data;
                hiddenElement.target = '_blank';
                hiddenElement.download = 'myFile.csv';
                hiddenElement.click();
            }, function (err) {
                console.log(err)
            });
        };
        $scope.generarJSON = function () {
            var json = '[';
            for (i = 0; i < $scope.pulseraList.length; i++) {
                json += '{"vendedor":"'+$stateParams.id+'","cantidad": "'+$scope.pulseraList[i].cantidad+'", "idCosto": "'+$scope.pulseraList[i].costo+'"}';
                if (i < $scope.pulseraList.length - 1)
                    json += ','
            }
            return json + ']';
        }
    });