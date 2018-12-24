<?php

namespace YandexMoneyModule\Model;

use YandexCheckout\Model\PaymentData\B2b\Sberbank\VatDataRate;
use YandexCheckout\Model\PaymentData\B2b\Sberbank\VatDataType;
use YandexCheckout\Model\PaymentMethodType;
use YandexCheckout\Model\Receipt\PaymentMode;
use YandexCheckout\Model\Receipt\PaymentSubject;

class KassaModel extends AbstractPaymentModel
{
    private static $_enabledTestMethods = array(
        PaymentMethodType::YANDEX_MONEY => true,
        PaymentMethodType::BANK_CARD    => true,
    );

    protected $shopId;
    protected $password;
    protected $epl;
    protected $useYandexButton;
    protected $paymentMethods;
    protected $sendReceipt;
    protected $defaultTaxRate;
    protected $taxRates;
    protected $log;
    protected $testMode;
    protected $showInFooter;
    protected $useInstallmentsButton;
    protected $enableHoldMode;
    protected $holdOrderStatus;
    protected $paymentDescription;
    protected $orderCanceledStatus;
    protected $addInstallmentsBlock;
    protected $b2bSberbankEnabled;
    protected $b2bSberbankPaymentPurpose;
    protected $b2bSberbankDefaultTaxRate;
    protected $b2bTaxRates;
    protected $defaultPaymentMode;
    protected $defaultPaymentSubject;
    protected $defaultDeliveryPaymentMode;
    protected $defaultDeliveryPaymentSubject;


    /**
     * KassaModel constructor.
     *
     * @param \Config $config
     */
    public function __construct($config)
    {
        parent::__construct($config, 'kassa');

        $this->shopId                = $this->getConfigValue('shop_id');
        $this->password              = $this->getConfigValue('password');
        $this->epl                   = $this->getConfigValue('payment_mode') !== 'shop';
        $this->useYandexButton       = (bool)$this->getConfigValue('use_yandex_button');
        $this->useInstallmentsButton = (bool)$this->getConfigValue('use_installments_button');
        $this->addInstallmentsBlock  = (bool)$this->getConfigValue('add_installments_block');
        $this->enableHoldMode        = (bool)$this->getConfigValue('enable_hold_mode');
        $this->holdOrderStatus       = $this->getConfigValue('hold_order_status');
        $this->paymentDescription    = $this->getConfigValue('payment_description');
        $this->orderCanceledStatus   = $this->getConfigValue('cancel_order_status');

        $this->testMode = false;
        if ($this->enabled && strncmp('test_', $this->password, 5) === 0) {
            $this->testMode = true;
        }

        $this->paymentMethods = array();
        foreach (PaymentMethodType::getEnabledValues() as $value) {
            $property = 'payment_method_'.$value;
            $enabled  = (bool)$this->getConfigValue($property);
            if ($value != PaymentMethodType::B2B_SBERBANK && (!$this->testMode || array_key_exists($value,
                        self::$_enabledTestMethods))
            ) {
                $this->paymentMethods[$value] = $enabled;
            }
        }

        $this->sendReceipt    = (bool)$this->getConfigValue('send_receipt');
        $this->defaultTaxRate = (int)$this->getConfigValue('tax_rate_default');
        $this->log            = (bool)$this->getConfigValue('debug_log');

        $this->taxRates = array();
        $tmp            = $this->getConfigValue('tax_rates');
        if (!empty($tmp)) {
            if (is_array($tmp)) {
                foreach ($tmp as $shopTaxRateId => $kassaTaxRateId) {
                    $this->taxRates[$shopTaxRateId] = $kassaTaxRateId;
                }
            }
        }

        $this->createOrderBeforeRedirect   = $this->getConfigValue('create_order_before_redirect');
        $this->clearCartAfterOrderCreation = $this->getConfigValue('clear_cart_before_redirect');

        $this->showInFooter = $this->getConfigValue('show_in_footer');

        $this->b2bSberbankEnabled            = $this->getConfigValue('b2b_sberbank_enabled');
        $this->b2bSberbankPaymentPurpose     = $this->getConfigValue('b2b_sberbank_payment_purpose');
        $this->b2bSberbankDefaultTaxRate     = $this->getConfigValue('b2b_tax_rate_default');
        $this->b2bTaxRates                   = $this->getConfigValue('b2b_tax_rates');
        $this->defaultPaymentMode            = $this->getConfigValue('default_payment_mode');
        $this->defaultPaymentSubject         = $this->getConfigValue('default_payment_subject');
        $this->defaultDeliveryPaymentMode    = $this->getConfigValue('default_delivery_payment_mode');
        $this->defaultDeliveryPaymentSubject = $this->getConfigValue('default_delivery_payment_subject');
    }

    public function isTestMode()
    {
        return $this->testMode;
    }

    public function getShopId()
    {
        return $this->shopId;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getEPL()
    {
        return !$this->testMode && $this->epl;
    }

    public function useYandexButton()
    {
        return $this->useYandexButton;
    }

    public function useInstallmentsButton()
    {
        return $this->useInstallmentsButton;
    }

    public function getAddInstallmentsBlock()
    {
        return $this->addInstallmentsBlock;
    }

    public function showInstallmentsBlock()
    {
        return $this->useInstallmentsButton() && $this->getAddInstallmentsBlock();
    }

    public function getPaymentMethods()
    {
        return $this->paymentMethods;
    }

    public function getEnabledPaymentMethods()
    {
        $result = array();
        foreach ($this->paymentMethods as $method => $enabled) {
            if ($enabled) {
                $result[] = $method;
            }
        }

        return $result;
    }

    public function isPaymentMethodEnabled($paymentMethod)
    {
        return isset($this->paymentMethods[$paymentMethod]) && $this->paymentMethods[$paymentMethod];
    }

    public function sendReceipt()
    {
        return $this->sendReceipt;
    }

    public function getTaxRateList()
    {
        return array(1, 2, 3, 4, 5, 6);
    }

    public function getB2bRateList()
    {
        return array(VatDataType::UNTAXED, VatDataRate::RATE_7, VatDataRate::RATE_10, VatDataRate::RATE_18);
    }

    public function getDefaultTaxRate()
    {
        return $this->defaultTaxRate;
    }

    public function getTaxRateId($shopTaxRateId)
    {
        if (isset($this->taxRates[$shopTaxRateId])) {
            return $this->taxRates[$shopTaxRateId];
        }

        return $this->defaultTaxRate;
    }

    public function getB2bTaxRateId($shopTaxRateId)
    {
        if (isset($this->b2bTaxRates[$shopTaxRateId])) {
            return $this->b2bTaxRates[$shopTaxRateId];
        }

        return $this->b2bSberbankDefaultTaxRate;
    }

    public function getTaxRates()
    {
        return $this->taxRates;
    }

    public function getDebugLog()
    {
        return $this->log;
    }

    public function getShowLinkInFooter()
    {
        return $this->showInFooter;
    }

    /**
     * @param array $templateData
     * @param $controller
     *
     * @return string
     */
    public function applyTemplateVariables($controller, &$templateData, $orderInfo)
    {
        $templateData['kassa']           = $this;
        $templateData['image_base_path'] = HTTPS_SERVER.'image/payment/yandex_money';
        $prefix                          = version_compare(VERSION, '2.3.0') >= 0 ? 'extension/' : '';
        $templateData['validate_url']    = $controller->url->link($prefix.'payment/yandex_money/create', '', true);

        $templateData['amount']         = $orderInfo['total'];
        $templateData['comment']        = $orderInfo['comment'];
        $templateData['orderId']        = $orderInfo['order_id'];
        $templateData['customerNumber'] = trim($orderInfo['order_id'].' '.$orderInfo['email']);
        $templateData['orderText']      = $orderInfo['comment'];

        return 'payment/yandex_money/kassa_form';
    }

    /**
     * @param array $paymentMethods
     *
     * @return KassaModel
     */
    public function setPaymentMethods($paymentMethods)
    {
        $this->paymentMethods = $paymentMethods;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getEnableHoldMode()
    {
        return $this->enableHoldMode;
    }

    /**
     * @return mixed
     */
    public function getHoldOrderStatusId()
    {
        return $this->holdOrderStatus;
    }

    public function getCaptureValue($paymentMethod)
    {
        return !($this->enableHoldMode && in_array($paymentMethod, array('', PaymentMethodType::BANK_CARD)));
    }

    /**
     * @return mixed
     */
    public function getPaymentDescription()
    {
        return $this->paymentDescription;
    }

    /**
     * @return mixed
     */
    public function getOrderCanceledStatus()
    {
        return $this->orderCanceledStatus;
    }

    /**
     * @return mixed
     */
    public function getB2bSberbankEnabled()
    {
        return $this->b2bSberbankEnabled == 'on';
    }

    /**
     * @return mixed
     */
    public function getB2bSberbankPaymentPurpose()
    {
        return $this->b2bSberbankPaymentPurpose;
    }

    /**
     * @return mixed
     */
    public function getB2bSberbankDefaultTaxRate()
    {
        return $this->b2bSberbankDefaultTaxRate;
    }

    /**
     * @return mixed
     */
    public function getB2bTaxRates()
    {
        return $this->b2bTaxRates;
    }

    /**
     * @return mixed
     */
    public function getDefaultPaymentMode()
    {
        return $this->defaultPaymentMode;
    }

    /**
     * @return mixed
     */
    public function getDefaultPaymentSubject()
    {
        return $this->defaultPaymentSubject;
    }

    /**
     * @return mixed
     */
    public function getDefaultDeliveryPaymentMode()
    {
        return $this->defaultDeliveryPaymentMode;
    }

    /**
     * @return mixed
     */
    public function getDefaultDeliveryPaymentSubject()
    {
        return $this->defaultDeliveryPaymentSubject;
    }

    public function getPaymentModeEnum()
    {
        return array(
            PaymentMode::FULL_PREPAYMENT    => 'Полная предоплата ('.PaymentMode::FULL_PREPAYMENT.')',
            PaymentMode::PARTIAL_PREPAYMENT => 'Частичная предоплата ('.PaymentMode::PARTIAL_PREPAYMENT.')',
            PaymentMode::ADVANCE            => 'Аванс ('.PaymentMode::ADVANCE.')',
            PaymentMode::FULL_PAYMENT       => 'Полный расчет ('.PaymentMode::FULL_PAYMENT.')',
            PaymentMode::PARTIAL_PAYMENT    => 'Частичный расчет и кредит ('.PaymentMode::PARTIAL_PAYMENT.')',
            PaymentMode::CREDIT             => 'Кредит ('.PaymentMode::CREDIT.')',
            PaymentMode::CREDIT_PAYMENT     => 'Выплата по кредиту ('.PaymentMode::CREDIT_PAYMENT.')',
        );
    }

    public function getPaymentSubjectEnum()
    {
        return array(
            PaymentSubject::COMMODITY             => 'Товар ('.PaymentSubject::COMMODITY.')',
            PaymentSubject::EXCISE                => 'Подакцизный товар ('.PaymentSubject::EXCISE.')',
            PaymentSubject::JOB                   => 'Работа ('.PaymentSubject::JOB.')',
            PaymentSubject::SERVICE               => 'Услуга ('.PaymentSubject::SERVICE.')',
            PaymentSubject::GAMBLING_BET          => 'Ставка в азартной игре ('.PaymentSubject::GAMBLING_BET.')',
            PaymentSubject::GAMBLING_PRIZE        => 'Выигрыш в азартной игре ('.PaymentSubject::GAMBLING_PRIZE.')',
            PaymentSubject::LOTTERY               => 'Лотерейный билет ('.PaymentSubject::LOTTERY.')',
            PaymentSubject::LOTTERY_PRIZE         => 'Выигрыш в лотерею ('.PaymentSubject::LOTTERY_PRIZE.')',
            PaymentSubject::INTELLECTUAL_ACTIVITY => 'Результаты интеллектуальной деятельности ('.PaymentSubject::INTELLECTUAL_ACTIVITY.')',
            PaymentSubject::PAYMENT               => 'Платеж ('.PaymentSubject::PAYMENT.')',
            PaymentSubject::AGENT_COMMISSION      => 'Агентское вознаграждение ('.PaymentSubject::AGENT_COMMISSION.')',
            PaymentSubject::COMPOSITE             => 'Несколько вариантов ('.PaymentSubject::COMPOSITE.')',
            PaymentSubject::ANOTHER               => 'Другое ('.PaymentSubject::ANOTHER.')',
        );
    }
}
