/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

    $stateProvider.state('vendedor-historial', {
        url: "/vendedor/:id/historial",
        templateUrl: "angularjs-app/views/vendedor/show.gsp",
        data: {pageTitle: 'Perfil de Vendedor', pageSubTitle: 'Historial de Pulseras'},
        controller: "VendedorShowController",
        resolve: {
            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                return $ocLazyLoad.load({
                    name: 'CapitalBusApp',
                    insertBefore: '#ng_load_plugins_before',
                    files: [
                        BASE_URL + 'angularjs-app/resources/CostoPulseraResource.js',
                        BASE_URL + 'angularjs-app/resources/DuracionResource.js',
                        BASE_URL + 'angularjs-app/resources/PersonaResource.js'
                     ]
                });
            }]
        }
    });

}]);