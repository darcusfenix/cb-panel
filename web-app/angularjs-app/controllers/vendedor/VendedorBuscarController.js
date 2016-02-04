/**
 * Created by grupo-becm on 1/25/16.
 */
angular.module('CapitalBusApp').controller('PulseraGenerarController', function($rootScope, $scope, $http, $timeout, Vendedor) {
    $scope.$on('$viewContentLoaded', function() {
       App.initAjax();
    });
    $scope.vendedorList = null;
    $scope.q = "@capitalbus.mx";

    $scope.getVendedores = function (){

        $scope.vendedores = Vendedor.getByEmail({
            'q': $scope.q
        },function (data) {
            $scope.vendedorList = data;
        }, function (err) {
            console.log(err)
        });
    };




    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
});