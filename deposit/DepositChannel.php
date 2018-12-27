<?php
/**
 * //                            _ooOoo_
 * //                           o8888888o
 * //                           88" . "88
 * //                           (| -_- |)
 * //                            O\ = /O
 * //                        ____/`---'\____
 * //                      .   ' \\| |// `.
 * //                       / \\||| : |||// \
 * //                     / _||||| -:- |||||- \
 * //                       | | \\\ - /// | |
 * //                     | \_| ''\---/'' | |
 * //                      \ .-\__ `-` ___/-. /
 * //                   ___`. .' /--.--\ `. . __
 * //                ."" '< `.___\_<|>_/___.' >'"".
 * //               | | : `- \`.;`\ _ /`;.`/ - ` : | |
 * //                 \ \ `-. \_ __\ /__ _/ .-` / /
 * //         ======`-.____`-.___\_____/___.-`____.-'======
 * //                            `=---='
 * //
 * //         .............................................
 * //                  佛祖保佑             永无BUG
 * DEC : 充值抽象类定义
 * User: David Wang
 * Time: 2018/10/26 上午9:43
 */

namespace wallet\deposit;

abstract class DepositChannel {
    public $error      = null;
    public $notify_url;
    public $configId;//支付账号id
    public $query_info = [];

    /**
     * 支付名称
     * @return string
     */
    public abstract function getName(): string;

    /**
     * 表单
     * @return mixed
     */
    public abstract function getSettingForm();

    /**
     * 描述
     * @return mixed
     */
    public abstract function getDesc();

    /**
     * 第三方回调
     *
     * @param string $type
     *
     * @return string
     */
    public abstract function onCallback(string $type): string;

    /**
     * @param        $body
     * @param        $orderid
     * @param        $amount
     * @param        $trade_type
     * @param string $accid
     * @param string $openid
     *
     * @return mixed
     */
    public abstract function getPayUrl($body, $orderid, $amount, $trade_type, $accid = '', $openid = '');

    public abstract function getPayScript($body, $orderid, $amount, $trade_type, $accid = '', $openid = '');

    /**
     * 据订单号查询订单信息
     *
     * @param string $order_no  订单号或者交易号
     * @param int    $type      0回调第三方trans_id交易号 1标识系统订单号
     * @param int    $config_id 账号id
     *
     * @return  boolean
     */
    public abstract function queryOrder(string $order_no = '', int $type = 0, int $config_id = 0);

    /**
     * 参数校验
     *
     * @param array $data
     *
     * @return bool
     */
    public abstract function paramsCheck(array $data): bool;

    /**
     * 获取支付账号的ID
     * @return int
     */
    public abstract function getConfigId(): int;

    /**
     * 错误信息
     * @return string
     */
    public function error(): string {
        return $this->error;
    }

}