<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteNav extends TimeModel
{

    protected $name = "site_nav";

    protected $deleteTime = false;


    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }

}