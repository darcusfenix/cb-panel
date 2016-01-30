/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').controller('VendedorShowController', function($rootScope,
                                                                              $scope,
                                                                              $http,
                                                                              $timeout,
                                                                              $stateParams,
                                                                              Vendedor,
                                                                              CostoPulsera,
                                                                              Persona,
                                                                              Duracion ) {
    $scope.$on('$viewContentLoaded', function() {
        App.initAjax();
    });

    $scope.error = [];
    $scope.costosList;
    $scope.personaList;
    $scope.duracionList;

    $scope.vendedor = Vendedor.get({id: $stateParams.id},function (data) {
        $scope.vendedor = data;
        $scope.getCostosPulsera();
        $scope.getPersonas();
        $scope.getDuracion();
    }, function (err) {
        $scope.error.flag = true;
        $scope.error.message = err.data.message;
    });

    $scope.getCostosPulsera = function (){
        $scope.vendedores = CostoPulsera.query(function (data) {
            $scope.costosList = data;

        }, function (err) {

        });
    };

    $scope.getPersonas = function (){
        $scope.vendedores = Persona.query(function (data) {
            $scope.personaList = data;
        }, function (err) {
            console.log(err)
        });
    };


    $scope.getDuracion = function (){
        $scope.vendedores = Duracion.query(function (data) {
            $scope.duracionList = data;

            for (var i=0; i < $scope.costosList.length; i++) {
                $scope.costoTemp = $scope.costosList[i][1];

                for (var j=0; j < $scope.personaList.length; j++) {
                    if($scope.costoTemp.persona.id = $scope.personaList[j].id){

                        var tempData = {"nombre": $scope.personaList[j].nombre};

                        $scope.costosList[i][1].persona.nombre = "NODENMSP";

                    }
                }

                for (var j=0; j < $scope.duracionList.length; j++) {
                    if($scope.costoTemp.duracion.id = $scope.duracionList[j].id){
                        //$scope.costosList[i][1].duracion.nombre = null;
                        //$scope.costosList[i][1].duracion.nombre = $scope.duracionList[j].duracion;

                    }
                }
    console.log($scope.costosList[0].persona.nombre);
            }

        }, function (err) {
            console.log(err)
        });
    };

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
});