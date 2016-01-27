/**
 * Created by grupo-becm on 1/25/16.
 */

angular.module('CapitalBusApp').config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

    $stateProvider.state('dashboard', {
        url: "/generar-pulseras",
        templateUrl: "angularjs-app/views/pulsera/generar.gsp",
        data: {pageTitle: 'Generarión de Pulseras', pageSubTitle: 'Elección de un Vendedor'},
        controller: "PulseraGenerarController",
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