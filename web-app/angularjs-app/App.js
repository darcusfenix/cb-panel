
var CapitalBusApp = angular.module("CapitalBusApp", [
    'ngRoute',
    'ngResource',
    "ui.router",
    "ui.bootstrap",
    "oc.lazyLoad",
    "ngSanitize"
]);


CapitalBusApp.config(['$ocLazyLoadProvider', function($ocLazyLoadProvider) {
    $ocLazyLoadProvider.config({

    });
}]);

CapitalBusApp.config(['$controllerProvider', function($controllerProvider) {
    $controllerProvider.allowGlobals();
}]);


/* Setup global settings */
CapitalBusApp.factory('settings', ['$rootScope', function($rootScope) {
    // supported languages
    var settings = {
        layout: {
            pageSidebarClosed: false, // sidebar menu state
            pageContentWhite: true, // set page content layout
            pageBodySolid: false, // solid body color state
            pageAutoScrollOnLoad: 1000 // auto scroll to top on page load
        },
        assetsPath: BASE_URL + BASE_RESOURCES,
        globalPath: BASE_URL + BASE_RESOURCES +'/global',
        layoutPath: BASE_URL + BASE_RESOURCES +'/template/layouts/layout4',
    };

    $rootScope.settings = settings;

    return settings;
}]);

/* Setup App Main Controller */
CapitalBusApp.controller('AppController', ['$scope', '$rootScope', function($scope, $rootScope) {
    $scope.$on('$viewContentLoaded', function() {
        //App.initComponents(); // init core components
    });
}]);

/* Setup Layout Part - Header */
CapitalBusApp.controller('HeaderController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initHeader(); // init header
    });
}]);

/* Setup Layout Part - Sidebar */
CapitalBusApp.controller('SidebarController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initSidebar(); // init sidebar
    });
}]);

/* Setup Layout Part - Sidebar */
CapitalBusApp.controller('PageHeadController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Demo.init(); // init theme panel
    });
}]);

/* Setup Layout Part - Quick Sidebar */
CapitalBusApp.controller('QuickSidebarController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        setTimeout(function(){
            QuickSidebar.init(); // init quick sidebar
        }, 2000)
    });
}]);

/* Setup Layout Part - Theme Panel */
CapitalBusApp.controller('ThemePanelController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Demo.init(); // init theme panel
    });
}]);

/* Setup Layout Part - Footer */
CapitalBusApp.controller('FooterController', ['$scope', function($scope) {
    $scope.$on('$includeContentLoaded', function() {
        Layout.initFooter(); // init footer
    });
}]);


CapitalBusApp.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    // Redirect any unmatched url
    $urlRouterProvider.otherwise("/");

}]);

angular.module('CapitalBusApp').controller('IndexController', function($rootScope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {
        // initialize core components
        App.initAjax();
    });
});

/* Init global settings and run the app */
CapitalBusApp.run(["$rootScope", "settings", "$state", function($rootScope, settings, $state) {
    $rootScope.$state = $state; // state to be accessed from view
    $rootScope.$settings = settings; // state to be accessed from view
}]);

angular.module('CapitalBusApp').config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('index', {
        url: "/",
        templateUrl: "angularjs-app/views/index/index.gsp",
        data: {pageTitle: 'Panel Inventario Vendedores'},
        controller: "IndexController",
        resolve: {
            deps: ['$ocLazyLoad', function ($ocLazyLoad) {
                return $ocLazyLoad.load({
                    name: 'CapitalBusApp',
                    insertBefore: '#ng_load_plugins_before',
                    files: [

                        BASE_URL + 'angularjs-app/resources/CostoPulseraResource.js',
                        BASE_URL + 'angularjs-app/resources/DuracionResource.js',
                        BASE_URL + 'angularjs-app/resources/PersonaResource.js',
                        BASE_URL + 'angularjs-app/resources/PulseraResource.js',
                        BASE_URL + 'angularjs-app/resources/VendedorResource.js',

                        BASE_URL + 'angularjs-app/controllers/vendedor/VendedorBuscarController.js',
                        BASE_URL + 'angularjs-app/controllers/vendedor/VendedorGenerarAsignarController.js',
                        BASE_URL + 'angularjs-app/controllers/vendedor/VendedorReporteController.js',

                        BASE_URL + 'angularjs-app/routes/PulseraRoute.js',
                        BASE_URL + 'angularjs-app/routes/VendedorRoute.js'
                    ]
                });
            }]
        }
    });

}]);