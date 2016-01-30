/**
 * Created by grupo-becm on 1/29/16.
 */

angular.module('CapitalBusApp').factory('Duracion', function ($resource) {
    return $resource('duracion/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'duracion/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'duracion/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'duracion/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'duracion/create/'
        },
        save: {
            method: 'POST',
            url: 'duracion/save'
        }
    });
});