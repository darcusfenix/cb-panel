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
                    /*files: [
                     BASE_RESOURCES +'/global/plugins/morris/morris.css',
                     BASE_RESOURCES +'/global/plugins/morris/morris.min.js',
                     BASE_RESOURCES +'/global/plugins/morris/raphael-min.js',
                     BASE_RESOURCES +'/global/plugins/jquery.sparkline.min.js',

                     BASE_RESOURCES +'/pages/scripts/dashboard.min.js',
                     'js/controllers/DashboardController.js',
                     ]
                     */
                });
            }]
        }
    });

}]);