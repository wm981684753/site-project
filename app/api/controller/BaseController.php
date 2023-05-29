<?php
/**
 * API请求基类
 * User: Weiming.Wei
 * Date: 2022/2/19
 * Time: 10:14
 */

namespace app\api\controller;


use app\api\util\JsonResponse;
use think\App;

class BaseController extends \app\BaseController
{
    public $site="cn";

    public $jsonResponse;

    public function __construct(App $app)
    {
        parent::__construct($app);
        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
        //站点语言切换
        $site = request()->header('site', 'cn');

        if (empty($site)&&in_array($site,["cn","en"])) {
            $this->site = $site;
        }

        $this->jsonResponse = new JsonResponse();
    }
}