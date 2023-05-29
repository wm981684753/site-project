<?php

namespace app\api\util;

use think\Response;

class JsonResponse
{
    /**
     * 结果状态码
     *
     * @var int
     */
    protected $code = 0;
    /**
     * http请求状态码
     *
     * @var int
     */
    protected $httpCode = 200;

    /**
     * 响应结果类型.
     *
     * @var string
     */
    protected $responseType = 'json';

    /**
     * 失败返回信息.
     *
     * @param $code
     * @param $msg
     * @param $data
     *
     * @return Response
     */
    public function fail($msg, $code, $data = null)
    {
        return $this->make($code, $msg, $data);
    }

    /**
     * 仅返回说明.
     *
     * @param $msg
     *
     * @return Response
     */
    public function onlySucMsg($msg = 'success')
    {
        return $this->success(null, $msg);
    }

    /**
     * @return $this
     */
    public function setCode(int $code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * @return $this
     */
    public function setHttpCode(int $httpCode)
    {
        $this->httpCode = $httpCode;

        return $this;
    }

    /**
     * @return $this
     */
    public function setResponseType(string $responseType)
    {
        $this->responseType = $responseType;

        return $this;
    }

    /**
     * 成功返回信息.
     *
     * @param $data
     * @param $msg
     *
     * @return Response
     */
    public function success($data = null, $msg = 'success')
    {
        return $this->make($this->code, lang($msg), $data);
    }

    /**
     * @param int        $code
     * @param string     $msg
     * @param null|array $data
     *
     * @return Response
     */
    private function make($code, $msg, $data = null)
    {
        $extra = [
            'log_id' => $GLOBALS['log_id'] ?? '',
            'now' => time(),
        ];

        $res = compact('code', 'msg');

        if (null !== $data) {
            $res['data'] = $data;
        }

        return Response::create($res, $this->responseType, $this->httpCode);
    }
}