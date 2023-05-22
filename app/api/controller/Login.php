<?php
/**
 * Created by PhpStorm.
 * User: Weiming.Wei
 * Date: 2022/2/19
 * Time: 10:44
 */

namespace app\api\controller;


use cncoders\auth\Auther;
use thans\jwt\facade\JWTAuth;
use think\Response;

class Login extends BaseController
{
    /**
     * @note 用户登录
     * //     * @return Response
     * @author weiming
     * @date 2022/2/19
     * @throws \Exception
     */
    public function login()
    {
        $username = $this->request->param('username', '');
        $password = $this->request->param('password', '');


        // 生成token，参数为用户认证的信息，请自行添加
        $token = JWTAuth::builder(['uid' => 1]);
        return response(json_encode([
            'token' => 'bearer ' . $token
        ]));
    }

    /**
     * @note 退出登录
     * @return Response
     * @author weiming
     * @date 2022/2/19
     */
    public function out(){
        $token = JWTAuth::builder(['uid' => 1]);
        return json_encode([
            'status' => 'success'
        ]);
    }
}