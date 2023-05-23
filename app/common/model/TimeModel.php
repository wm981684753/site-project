<?php


namespace app\common\model;


use think\Model;
use think\model\concern\SoftDelete;

/**
 * 有关时间的模型
 * Class TimeModel
 * @package app\common\model
 */
class TimeModel extends Model
{

    /**
     * 自动时间戳类型
     * @var string
     */
    protected $autoWriteTimestamp = true;

    /**
     * 添加时间
     * @var string
     */
    protected $createTime = 'create_time';

    /**
     * 更新时间
     * @var string
     */
    protected $updateTime = 'update_time';

    /**
     * 数据表站点后缀
     * @var string
     */
    protected $site;

    /**
     * 软删除
     */
    use SoftDelete;
    protected $deleteTime = false;

    public function __construct(array $data = [])
    {
        parent::__construct($data);

        //判断是前台请求还是后台请求
        $url = request()->url();
        if (strpos($url, config('app.admin_alias_name'))) {
            //使用后台站点缓存
            $site = session('site_admin');
        } else {
            //使用前台站点
            $site = request()->header('site', 'cn');
        }

        //根据站点调用数据库
        if (!empty($site)) {
            $this->site = $site == 'cn' ? '' : '_' . $site;
        } else {
            $this->site = '';
        }
    }

}