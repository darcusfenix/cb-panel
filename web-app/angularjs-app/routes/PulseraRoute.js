/**
 * Created by grupo-becm on 1/25/16.
 */

angular.module('CapitalBusApp').config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('dashboard', {
            url: "/generar-pulseras",
            templateUrl: "angularjs-app/views/pulsera/generar.gsp",
            data: {pageTitle: 'Generarión de Pulseras', pageSubTitle: 'Elección de un Vendedor'},
            controller: "PulseraGenerarController",
    });

}]);