<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

//jwt-demo-----start
//token过期 会允许访问一次，并在响应头中返回新的 authorization
//更多操作-文档地址 http://packagist.p2hp.com/packages/thans/tp-jwt-auth#v1.2.0

//登录
//Route::post('login$', 'Login/login');
//
//Route::post('login/out', 'Login/out');
//
//Route::group('user',function (){
//    Route::get('index', 'User/index');
//})->middleware(thans\jwt\middleware\JWTAuthAndRefresh::class);

//jwt-demo-----end

Route::get('/index', 'Index/data');
Route::get('/aboutUs', 'AboutUs/data');
Route::get('/edr', 'Edr/data');
Route::get('/cpd', 'Cpd/data');
Route::get('/news', 'News/data');
