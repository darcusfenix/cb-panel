/**
 * Created by darcusfenix on 1/26/16.
 */

angular.module('CapitalBusApp').factory('Vendedor', function ($resource) {

    return $resource('vendedor/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'vendedor/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'vendedor/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'vendedor/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'vendedor/create/'
        },
        save: {
            method: 'POST',
            url: 'vendedor/save'
        },
        getByEmail:{
            method : 'GET',
            isArray:true,
            url: 'vendedor/email/'
        },
    });
});