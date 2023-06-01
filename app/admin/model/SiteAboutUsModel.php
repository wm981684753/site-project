<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteAboutUsModel extends TimeModel
{

    protected $name = "site_about_us_model";

    protected $deleteTime = false;



    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }
}