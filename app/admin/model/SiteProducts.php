<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteProducts extends TimeModel
{

    protected $name = "site_products";

    protected $deleteTime = false;

    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }
    

}