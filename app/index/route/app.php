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

//Route::get('css/:css', 'Index/css');
//Route::get('js/:dir/:js', 'Index/js');
//Route::get('js/:js', 'Index/js');
//Route::get('imgs/:imgs', 'Index/imgs');

//前台页面路由
Route::get('index.html', 'Index/index');
Route::get(':url', 'Index/index');



