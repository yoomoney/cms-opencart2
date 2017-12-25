<?php

namespace YandexMoneyModule\YandexMarket;

class AbstractYmlBuilder
{
    private $sourceCharset;
    private $charset;

    public function __construct($outputCharset = 'utf-8', $sourceCharset = 'utf-8')
    {
        if (!in_array($outputCharset, array('utf-8', 'windows-1251'))) {
            throw new \InvalidArgumentException('Invalid character set value: ' . $outputCharset);
        }
        $this->charset = $outputCharset;
        $this->sourceCharset = $sourceCharset;
    }

    public function generate(ShopInfo $shopInfo)
    {
        $document = '<?xml version="1.0" encoding="' . $this->charset . '"?>' . PHP_EOL
            . '<yml_catalog date="' . date('Y-m-d H:i') . '">' . PHP_EOL
            . '  <shop>' . PHP_EOL
            . '    <name>' . $this->prepareValue($shopInfo->getName()) . '</name>' . PHP_EOL
            . '    <company>' . $this->prepareValue($shopInfo->getCompany()) . '</company>' . PHP_EOL;

        if ($shopInfo->hasUrl()) {
            $document .= '    <url>' . $this->prepareValue($shopInfo->getUrl()) . '</url>' . PHP_EOL;
        }
        if ($shopInfo->hasPlatform()) {
            $document .= '    <platform>' . $this->prepareValue($shopInfo->getPlatform()) . '</platform>' . PHP_EOL;
        }
        if ($shopInfo->hasVersion()) {
            $document .= '    <version>' . $this->prepareValue($shopInfo->getVersion()) . '</version>' . PHP_EOL;
        }
        if ($shopInfo->hasAgency()) {
            $document .= '    <agency>' . $this->prepareValue($shopInfo->getAgency()) . '</agency>' . PHP_EOL;
        }
        if ($shopInfo->hasEmail()) {
            $document .= '    <email>' . $this->prepareValue($shopInfo->getEmail()) . '</email>' . PHP_EOL;
        }
        if ($shopInfo->hasDeliveryOptions()) {
            $document .= $this->generateDeliveryOptions($shopInfo, false);
        }

        $document .= $this->generateCurrencies($shopInfo);
        $document .= $this->generateCategories($shopInfo);
        $document .= $this->generateOffers($shopInfo);

        $document .= '  </shop>' . PHP_EOL
            . '</yml_catalog>';

        return $document;
    }

    protected function generateCurrencies(ShopInfo $shopInfo)
    {
        $result = '    <currencies>' . PHP_EOL;
        foreach ($shopInfo->getCurrencies() as $code => $rate) {
            $result .= '      <currency id="' . $code . '" rate="' . $rate . '" />' . PHP_EOL;
        }
        $result .= '    </currencies>' . PHP_EOL;
        return $result;
    }

    protected function generateCategories(ShopInfo $shopInfo)
    {
        $result = '    <categories>' . PHP_EOL;
        foreach ($shopInfo->getCategories() as $category) {
            $result .= '      <category id="' . $category->getId() . '"';
            if ($category->hasParent()) {
                $result .= ' parentId="' . $category->getParent()->getId() . '"';
            }
            $result .= '>' . $this->prepareValue($category->getName()) . '</category>' . PHP_EOL;
        }
        $result .= '    </categories>' . PHP_EOL;
        return $result;
    }

    protected function generateOffers(ShopInfo $shopInfo)
    {
        $result = '    <offers>' . PHP_EOL;
        foreach ($shopInfo->getOffers() as $offer) {
            if ($offer->getPrice() <= 0) {
                continue;
            }
            if ($offer->hasParameters()) {
                $parameters = $this->generateProperties($offer->getParameters());
                if (!empty($parameters)) {
                    foreach ($parameters as $idSuffix => $params) {
                        if (count($parameters) === 1) {
                            $idSuffix = '';
                        }
                        $result .= $this->generateOffer($offer, $idSuffix, $params);
                    }
                } else {
                    $result .= $this->generateOffer($offer);
                }
            } else {
                $result .= $this->generateOffer($offer);
            }
        }
        $result .= '    </offers>' . PHP_EOL;
        return $result;
    }

    protected function generateOffer(Offer $offer, $idPrefix = null, $properties = array())
    {
        $result = '      <offer id="' . $offer->getId() . $idPrefix . '"';
        if (!$offer->isAvailable()) {
            $result .= ' available="false"';
        }
        if ($offer->getBid()) {
            $result .= ' bid="' . $offer->getBid() . '"';
        }
        if ($offer->getCbid()) {
            $result .= ' cbid="' . $offer->getCbid() . '"';
        }
        if ($offer->getFee()) {
            $result .= ' fee="' . $offer->getFee() . '"';
        }
        $result .= '>' . PHP_EOL;

        $result .= '        <categoryId>' . $offer->getCategoryId() . '</categoryId>' . PHP_EOL;
        $result .= '        <name>' . $offer->getName() . '</name>' . PHP_EOL;
        if ($offer->hasUrl()) {
            $result .= '        <url><![CDATA[' . $this->prepareValue($offer->getUrl()) . ']]></url>' . PHP_EOL;
        }

        $result .= '        <price>' . $offer->getPrice() . '</price>' . PHP_EOL;
        if ($offer->hasOldPrice()) {
            $result .= '        <oldprice>' . $offer->getOldPrice() . '</oldprice>' . PHP_EOL;
        }

        $result .= '        <currencyId>' . $offer->getCurrencyId() . '</currencyId>' . PHP_EOL;

        if ($offer->hasDeliveryOptions()) {
            $result .= $this->generateDeliveryOptions($offer, true);
        }

        if ($offer->hasPickup()) {
            $result .= '        <pickup>' . ($offer->getPickup() ? 'true' : 'false') . '</pickup>' . PHP_EOL;
        }
        if ($offer->hasStore()) {
            $result .= '        <store>' . ($offer->getStore() ? 'true' : 'false') . '</store>' . PHP_EOL;
        }
        if ($offer->hasOutlets()) {
            $result .= $this->generateOutlets($offer);
        }
        if ($offer->hasDescription()) {
            $result .= '        <description><![CDATA[' . $this->prepareValue($offer->getDescription()) . ']]></description>' . PHP_EOL;
        }
        if ($offer->hasSalesNotes()) {
            $result .= '        <sales_notes>'. $this->prepareValue($offer->getSalesNotes()) . '</sales_notes>' . PHP_EOL;
        }
        if ($offer->hasMinQuantity()) {
            $result .= '        <min-quantity>'. $offer->getMinQuantity() . '</min-quantity>' . PHP_EOL;
        }
        if ($offer->hasStepQuantity()) {
            $result .= '        <step-quantity>'. $offer->getStepQuantity() . '</step-quantity>' . PHP_EOL;
        }
        if ($offer->hasManufacturerWarranty()) {
            $result .= '        <manufacturer_warranty>'. ($offer->getManufacturerWarranty() ? 'true' : 'false') . '</manufacturer_warranty>' . PHP_EOL;
        }
        if ($offer->hasCountryOfOrigin()) {
            $result .= '        <country_of_origin>'. $this->prepareValue($offer->getCountryOfOrigin()) . '</country_of_origin>' . PHP_EOL;
        }
        if ($offer->hasAdult()) {
            $result .= '        <adult>'. ($offer->getAdult() ? 'true' : 'false') . '</adult>' . PHP_EOL;
        }
        if ($offer->hasVendor()) {
            $result .= '        <vendor>'. $this->prepareValue($offer->getVendor()) . '</vendor>' . PHP_EOL;
        }
        if ($offer->hasVendorCode()) {
            $result .= '        <vendorCode>'. $this->prepareValue($offer->getVendorCode()) . '</vendorCode>' . PHP_EOL;
        }
        if ($offer->hasModel()) {
            $result .= '        <model>'. $this->prepareValue($offer->getModel()) . '</model>' . PHP_EOL;
        }
        if ($offer->hasPictures()) {
            foreach ($offer->getPictures() as $picture) {
                $result .= '        <picture>' . $this->prepareValue($picture) . '</picture>' . PHP_EOL;
            }
        }

        if ($offer->hasWeight()) {
            $result .= '        ' . $this->addTag('weight', $offer->getWeight()) . PHP_EOL;
        }
        if ($offer->hasDimensions()) {
            $result .= '        ' . $this->addTag('dimensions', $offer->getDimensions()) . PHP_EOL;
        }

        if (!empty($properties)) {
            $result .= $properties;
        }
        $result .= '      </offer>' . PHP_EOL;

        return $result;
    }

    /**
     * @param ParameterList[] $properties
     * @return string[]
     */
    private function generateProperties($properties)
    {
        $map = array(
            'color' => array(
                'prefix' => 'c',
                'name' => 'Цвет',
            ),
            'capacity' => array(
                'prefix' => 'C',
                'name' => 'Ёмкость',
            ),
            'weight' => array(
                'prefix' => 'w',
                'name' => 'Вес',
            ),
            'size' => array(
                'prefix' => 's',
                'name' => 'Размер',
            ),
        );

        /** @var ParameterList $property */
        $property = array_shift($properties);
        if (!empty($properties)) {
            $propStrings = $this->generateProperties($properties);
        } else {
            $propStrings = array('' => '');
        }
        $result = array();
        $index = 0;
        if (!isset($map[$property->getName()])) {
            return empty($result) ? $result : $propStrings;
        }
        foreach ($property->getValues() as $value) {
            $index++;
            $idx = $map[$property->getName()]['prefix'] . $index;
            $tmp = '        <param name="' . $map[$property->getName()]['name'] . '"';
            if ($property->hasUnit()) {
                $tmp .= ' unit="' . $property->getUnit() . '"';
            }
            $tmp .=  '>' . $value . '</param>' . PHP_EOL;
            foreach ($propStrings as $id => $str) {
                $result[$id . $idx] = $str . $tmp;
            }
        }
        return $result;
    }

    /**
     * @param ShopInfo $shopInfo
     * @param bool $offer
     * @return string
     */
    protected function generateDeliveryOptions($shopInfo, $offer = true)
    {
        $prefix = '    ';
        if ($offer) {
            $prefix .= '    ';
        }
        $result = $prefix . '<delivery-options>' . PHP_EOL;
        foreach ($shopInfo->getDeliveryOptions() as $option) {
            $result .= $prefix . '  <option cost="' . $option->getCost() . '" days="' . $option->getDays() . '"';
            if ($option->hasOrderBefore()) {
                $result .= ' order-before="' . $option->getOrderBefore() . '"';
            }
            $result .= ' />' . PHP_EOL;
        }
        $result .= $prefix . '</delivery-options>' . PHP_EOL;
        return $result;
    }

    protected function generateOutlets(Offer $offer)
    {
        $result = '        <outlets>';
        foreach ($offer->getOutlets() as $id => $inStock) {
            $result = '          <outlet id="' . $id . '" instock="' . $inStock . '">' . PHP_EOL;
        }
        $result .= '        </outlets>' . PHP_EOL;
        return $result;
    }

    /**
     * @param string $value
     * @return string
     */
    protected function prepareValue($value)
    {
        static $from = array('"', '&', '>', '<', '\'');
        static $to = array('&quot;', '&amp;', '&gt;', '&lt;', '&apos;');
        $value = str_replace($from, $to, $value);
        $value = preg_replace('!<[^>]*?>!', ' ', $value);
        // if ($this->from_charset!='windows-1251') $s = iconv($this->from_charset, 'windows-1251', $s);
        $value = preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#is', ' ', $value);
        return $this->convertCharset(trim($value));
    }

    /**
     * @param string $value
     * @return string
     */
    protected function convertCharset($value)
    {
        if ($this->charset !== $this->sourceCharset) {
            return iconv('utf-8', $this->charset, $value);
        }
        return $value;
    }

    protected function addTag($tag, $value, $attributes = array())
    {
        $result = '<' . $tag;
        foreach ($attributes as $attr => $value) {
            $result .= ' ' . $attr . '="' . $value . '"';
        }
        $result .= '>' . $value . '</' . $tag . '>' . PHP_EOL;
        return $result;
    }
}