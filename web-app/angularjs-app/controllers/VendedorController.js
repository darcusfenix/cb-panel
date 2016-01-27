/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').controller('VendedorShowController', function($rootScope, $scope, $http, $timeout, $stateParams, Vendedor) {
    $scope.$on('$viewContentLoaded', function() {
        App.initAjax();
    });

    $scope.error = [];


    $scope.vendedor = Vendedor.get({id: $stateParams.id},function (data) {
        $scope.vendedor = data;
    }, function (err) {
        $scope.error.flag = true;
        $scope.error.message = err.data.message;
    });

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
});