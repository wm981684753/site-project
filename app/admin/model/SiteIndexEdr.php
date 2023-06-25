<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SiteIndexEdr extends TimeModel
{

    protected $name = "site_index_edr";

    protected $deleteTime = false;


    public function __construct(array $data = [])
    {
        parent::__construct($data);
        $this->name = $this->name . $this->site;
    }

}