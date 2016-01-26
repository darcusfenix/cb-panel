/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('vendedor-historial', {
        url: "/vendedor/:id/historial",
        templateUrl: "angularjs-app/views/vendedor/show.gsp",
        data: {pageTitle: 'Perfil de Vendedor', pageSubTitle: 'Historial de Pulseras'},
        controller: "VendedorShowController",
    });

}]);