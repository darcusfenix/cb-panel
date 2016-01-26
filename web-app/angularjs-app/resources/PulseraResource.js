/**
 * Created by grupo-becm on 1/25/16.
 */

angular.module('CapitalBusApp').factory('Pulsera', function ($resource) {
    return $resource('answer/:id', {id: '@id'}, {
        get: {
            method: 'GET',
            url: 'answer/show/:id'
        },
        update: {
            method: 'PUT',
            url: 'answer/update/'
        },
        delete: {
            method: 'DELETE',
            url: 'answer/delete/:id'
        },
        create: {
            method: 'GET',
            url: 'answer/create/'
        },
        save: {
            method: 'POST',
            url: 'answer/save'
        }
    });
});