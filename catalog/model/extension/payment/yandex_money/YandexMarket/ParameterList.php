<?php

namespace YandexMoneyModule\YandexMarket;

class ParameterList
{
    private $name;
    private $unit;
    private $values;

    public function __construct($name, $unit = null)
    {
        $this->name = $name;
        $this->unit = $unit;
        $this->values = array();
    }

    public function getName()
    {
        return $this->name;
    }

    public function getUnit()
    {
        return $this->unit;
    }

    public function hasUnit()
    {
        return !empty($this->unit);
    }

    public function addValue($value)
    {
        $this->values[$value] = true;
    }

    public function getValues()
    {
        return array_keys($this->values);
    }
}
