<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteEdrModel2 extends TimeModel
{

    protected $name = "site_edr_model2";

    protected $deleteTime = false;

    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }
    

}