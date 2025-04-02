<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Owner routes
$router->get('/owners', 'OwnerController@getAll');
$router->get('/owners/{id}', 'OwnerController@getOne');
$router->post('/owners/add', 'OwnerController@save');
$router->post('/owners/edit/{id}', 'OwnerController@update');
$router->delete('/owners/delete/{id}', 'OwnerController@delete');

// House routes
$router->get('/houses', 'HouseController@getAll');
$router->get('/houses/{id}', 'HouseController@getOne');
$router->get('/houses-with-owners', 'HouseController@getWithOwners');
$router->post('/houses/add', 'HouseController@save');
$router->post('/houses/edit/{id}', 'HouseController@update');
$router->delete('/houses/delete/{id}', 'HouseController@delete');

