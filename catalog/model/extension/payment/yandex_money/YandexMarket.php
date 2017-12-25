<?php

namespace YandexMoneyModule;

use YandexMoneyModule\YandexMarket\ArbitraryYmlBuilder;
use YandexMoneyModule\YandexMarket\ShopInfo;
use YandexMoneyModule\YandexMarket\SimpleYmlBuilder;

class YandexMarket
{
    private $config;
    private $info;

    public function __construct(&$config)
    {
        $this->config = $config;
        $this->info = new ShopInfo();
    }

    public function prepare_field($s)
    {
        $from = array('"', '&', '>', '<', '\'');
        $to = array('&quot;', '&amp;', '&gt;', '&lt;', '&apos;');
        $s = str_replace($from, $to, $s);
        $s=preg_replace('!<[^>]*?>!', ' ', $s);
        // if ($this->from_charset!='windows-1251') $s = iconv($this->from_charset, 'windows-1251', $s);
        $s = preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#is', ' ', $s);
        return trim($s);
    }

    /**
     * @param string $name
     * @param string $company
     * @param string $url
     * @return YandexMarket
     */
    public function setShop($name, $company, $url)
    {
        $this->info->setName($name)
            ->setCompany($company)
            ->setUrl($url);
        return $this;
    }

    /**
     * @param string $id
     * @param string $rate
     * @param int $plus
     * @return YandexMarket
     */
    public function addCurrency($id, $rate = 'CBRF', $plus = 0)
    {
        $rate = strtoupper($rate);
        $plus = str_replace(',', '.', $plus);
        if ($rate == 'CBRF' && $plus > 0) {
            $this->info->addCurrency($id, $rate);
        } else {
            $rate = str_replace(',', '.', $rate);
            $this->info->addCurrency($id, $rate);
        }
        return $this;
    }

    /**
     * @param string $name
     * @param int $id
     * @param int $parent_id
     * @return YandexMarket
     */
    function addCategory($name, $id, $parent_id = -1)
    {
        if ((int)$id >= 1 && trim($name) != '') {
            $this->info->addCategory($id, $parent_id, $name);
        }
        return $this;
    }

    /**
     * @param $id
     * @param $categoryId
     * @param $name
     * @return YandexMarket\Offer
     */
    public function addOffer($id, $categoryId, $name)
    {
        $offer = $this->info->addOffer($id, $categoryId, $name);
        return $offer;
    }

    public function getXml()
    {
        if ($this->config->get('yandex_money_market_prostoy')) {
            $builder = new SimpleYmlBuilder();
        } else {
            $builder = new ArbitraryYmlBuilder();
        }
        return $builder->generate($this->info);
    }
}