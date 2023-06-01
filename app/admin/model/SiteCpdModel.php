<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteCpdModel extends TimeModel
{

    protected $name = "site_cpd_model";

    protected $deleteTime = false;

    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }
    

}