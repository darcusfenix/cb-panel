/**
 * Created by grupo-becm on 1/25/16.
 */
angular.module('CapitalBusApp').controller('VendedorBuscarController', function ($rootScope, $scope, $http, $timeout, Vendedor) {
    $scope.$on('$viewContentLoaded', function () {
        App.initAjax();
    });
    $scope.vendedorList = null;
    $scope.q;

    $scope.getVendedores = function () {
        App.blockUI(
            {
                target: "#rs-busqueda",
                boxed: !0,
                message: "Cargando..."
            });
        $scope.vendedores = Vendedor.getByEmail({
            'q': $scope.q
        }, function (data) {
            $scope.vendedorList = data;
            App.unblockUI("#rs-busqueda");
        }, function (err) {
            console.log(err)
        });
    };

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageContentWhite = true;
    $rootScope.settings.layout.pageBodySolid = false;
    $rootScope.settings.layout.pageSidebarClosed = false;
});