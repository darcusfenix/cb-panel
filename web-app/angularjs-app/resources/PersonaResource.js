/**
 * Created by grupo-becm on 1/29/16.
 */

angular.module('CapitalBusApp').factory('Persona', function ($resource) {
    return $resource('persona/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'persona/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'persona/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'persona/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'persona/create/'
        },
        save: {
            method: 'POST',
            url: 'persona/save'
        }
    });
});