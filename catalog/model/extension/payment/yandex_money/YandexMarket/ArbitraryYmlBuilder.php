<?php

namespace YandexMoneyModule\YandexMarket;

class ArbitraryYmlBuilder extends AbstractYmlBuilder
{
    protected function generateOffer(Offer $offer, $idPrefix = null, $properties = array())
    {
        if (!$offer->hasModel() || !$offer->hasVendor()) {
            return '';
        }

        $result = '      <offer id="' . $offer->getId() . $idPrefix . '" type="vendor.model"';
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
        $result .= '        <model>'. $this->prepareValue($offer->getModel()) . '</model>' . PHP_EOL;
        $result .= '        <vendor>'. $this->prepareValue($offer->getVendor()) . '</vendor>' . PHP_EOL;
        if ($offer->hasVendorCode()) {
            $result .= '        <vendorCode>'. $this->prepareValue($offer->getVendorCode()) . '</vendorCode>' . PHP_EOL;
        }

        if ($offer->hasPictures()) {
            foreach ($offer->getPictures() as $pic) {
                $result .= '        <picture>' . $this->prepareValue($pic) . '</picture>' . PHP_EOL;
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
}
