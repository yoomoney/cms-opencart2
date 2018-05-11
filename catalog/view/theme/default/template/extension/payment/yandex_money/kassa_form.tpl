<?php

/**
 * @var \YandexMoneyModule\Model\KassaModel $kassa
 */
?>
<style type="text/css">

    .yamoney-pay-button {
        font-family: YandexSansTextApp-Regular, Arial, Helvetica, sans-serif;
        text-align: center;
        height: 60px;
        width: 155px;
        border-radius: 4px;
        transition: 0.1s ease-out 0s;
        color: #000;
        box-sizing: border-box;
        outline: 0;
        border: 0;
        background: #FFDB4D;
        cursor: pointer;
        font-size: 12px;
    }

    .yamoney-pay-button:hover, .yamoney-pay-button:active {
        background: #f2c200;
    }

    .yamoney-pay-button span {
        display: block;
        font-size: 20px;
        line-height: 20px;
    }

    .yamoney-pay-button_type_fly {
        box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.12), 0 5px 10px -3px rgba(0, 0, 0, 0.3);
    }
</style>

<?php if($kassa->getEPL() && $kassa->useYandexButton() && $kassa->useInstallmentsButton()):?>
<style type="text/css">
     .simplecheckout-button-block {
         display: none;!important;
     }
</style>
<?php endif;?>

<?php if ($fullView) : ?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div class="container">
    <?php echo $content_top; ?>
    <?php endif; ?>
    <?php if($kassa->getEPL() && $kassa->useInstallmentsButton()):?>
        <form method="post" action="" class="yandex-money-payment-form-installments" style="float: left">
            <div id="installment-wrapper" class="installment-wrapper"></div>
        </form>
    <?php endif;?>
    <?php if (!$kassa->getEPL()) : ?>
    <h3><?php echo $kassa->getDisplayName(); ?></h3>
    <?php endif; ?>
    <form method="post" action="" id="yandex-money-payment-form" <?= $kassa->useYandexButton() && $kassa->useInstallmentsButton() ? 'style="float: right"':'' ?>>
        <?php if ($kassa->getEPL()) : ?>
            <input type="hidden" name="kassa_payment_method" value="" />
            <?php if ($kassa->useYandexButton()) : ?>
                <div <?= $kassa->useInstallmentsButton() ?: 'class="buttons"';?> >
                    <button id="continue-button" class="yamoney-pay-button"><?= $language->get('yamoney_pay_button_text'); ?></button>
                </div>
            <?php endif; ?>
        <?php else: ?>
            <?php
                foreach ($kassa->getEnabledPaymentMethods() as $index =>  $method):
                $key = 'text_method_' . $method;
            ?>
                <label>
                    <input type="radio" name="kassa_payment_method" value="<?php echo $method ?>"<?php echo ($index == 0 ? ' checked' : ''); ?> />
                    <img src="<?php echo $image_base_path . '/' . $method; ?>.png" alt="<?php echo $language->get($key); ?>" />
                    <?php echo $language->get($key);?>
                </label>
                <?php if ($method == \YandexCheckout\Model\PaymentMethodType::QIWI) : ?>
                    <div id="payment-qiwi" class="additional" style="display: none;">
                        <label for="qiwi-phone"><?php echo $language->get('text_payment_method_qiwi_phone'); ?></label><br />
                        <input name="qiwiPhone" id="qiwi-phone" value="" />
                    </div>
                <?php elseif ($method == \YandexCheckout\Model\PaymentMethodType::ALFABANK) : ?>
                    <div id="payment-alfabank" class="additional" style="display: none;">
                        <label for="alfa-login"><?php echo $language->get('text_payment_method_alfa_login'); ?></label><br />
                        <input name="alfaLogin" id="alfa-login" value="" />
                    </div>
                <?php endif; ?>
                <br />
            <?php endforeach; ?>
        <?php endif; ?>

        <?php if (!$kassa->getEPL() || ($kassa->getEPL() && !$kassa->useYandexButton())) : ?>
        <div class="buttons">
            <div class="pull-right">
                <button class="btn btn-primary" id="continue-button" type="button"><?php echo $language->get('text_continue'); ?></button>
            </div>
        </div>
        <?php endif; ?>
    </form>
    <script type="text/javascript"><!--
        $(document).ready(function() {
            var paymentType = jQuery('input[name=kassa_payment_method]');
            paymentType.change(function () {
                var id = '#payment-' + jQuery(this).val();
                jQuery('.additional').css('display', 'none');
                jQuery(id).css('display', 'block');
            });

            jQuery('#continue-button').bind('click', function () {
                var form = jQuery("#yandex-money-payment-form")[0];
                jQuery.ajax({
                    url: "<?php echo $validate_url; ?>",
                    dataType: "json",
                    method: "GET",
                    data: {
                        paymentType: form.kassa_payment_method.value,
                        qiwiPhone: (form.qiwiPhone ? form.qiwiPhone.value : ''),
                        alphaLogin: (form.alfaLogin ? form.alfaLogin.value : '')
                    },
                    success: function (data) {
                        if (data.success) {
                            document.location = data.redirect;
                        } else {
                            onValidateError(data.error);
                        }
                    },
                    failure: function () {
                        onValidateError('Failed to create payment');
                    }
                });
            });

            jQuery('.yandex-money-payment-form-installments').on('submit', function (e) {
                e.preventDefault();
                e.stopPropagation();
                const form = this;
                jQuery.ajax({
                    url: "<?php echo $validate_url; ?>",
                    dataType: "json",
                    method: "GET",
                    data: {
                        paymentType: 'installments',
                    },
                    success: function (data) {
                        if (data.success) {
                            document.location = data.redirect;
                        } else {
                            onValidateError(data.error);
                        }
                    },
                    failure: function () {
                        onValidateError('Failed to create payment');
                    }
                });
            });

            function onValidateError(errorMessage) {
                var warning = jQuery('#yandex-money-payment-form .alert');
                if (warning.length > 0) {
                    warning.fadeOut(300, function () {
                        warning.remove();
                        var content = '<div class="alert alert-danger">' + errorMessage + '<button type="button" class="close" data-dismiss="alert">×</button></div>';
                        jQuery('#yandex-money-payment-form').prepend(content);
                        jQuery('#yandex-money-payment-form .alert').fadeIn(300);
                    });
                } else {
                    var content = '<div class="alert alert-danger">' + errorMessage + '<button type="button" class="close" data-dismiss="alert">×</button></div>';
                    jQuery('#yandex-money-payment-form').prepend(content);
                    jQuery('#yandex-money-payment-form .alert').fadeIn(300);
                }
            }

        });
        //--></script>

    <script>
        const yamoneyCheckoutCreditUI = YandexCheckoutCreditUI({
            shopId: '<?= $shopId?>',
            sum: '<?= $sum?>',
            language: '<?= $language->get("code")?>'
        });
        const yamoneyCheckoutCreditButton = yamoneyCheckoutCreditUI({
            type: 'button',
            theme: 'default',
            domSelector: '.installment-wrapper'
        });
    </script>
    <?php if ($fullView) : ?>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
<?php endif; ?>
