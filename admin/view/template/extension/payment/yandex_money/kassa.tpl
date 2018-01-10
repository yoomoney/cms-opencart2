
<?php if ($kassa->isTestMode()) : ?>
<div class="alert alert-info">
    <i class="fa fa-exclamation-circle"></i><?php echo $language->get('kassa_test_mode_description'); ?>
</div>
<?php endif; ?>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $language->get('kassa_page_title'); ?></h3>
    </div>
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('kassa_header_description'); ?></p>
            <p><?php echo $language->get('kassa_version_string'); ?> <?php echo $module_version; ?></p>
        </div>

        <?php if (!empty($error_kassa_invalid_credentials)) : ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_kassa_invalid_credentials; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-enabled" name="yandex_money_kassa_enabled" value="on"<?php echo $kassa->isEnabled() ? ' checked' : ''; ?> class="enable-button" />
                    <?php echo $language->get('kassa_enable_label'); ?>
                </label>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="kassa-shop-id"><?php echo $language->get('kassa_shop_id_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_kassa_shop_id" value="<?php echo $kassa->getShopId(); ?>" placeholder="<?php echo $language->get('kassa_shop_id_label'); ?>" id="kassa-shop-id" class="form-control" />
                <?php if (!empty($error_kassa_shop_id)) : ?>
                <div class="text-danger"><?php echo $error_kassa_shop_id; ?></div>
                <?php else: ?>
                <p class="help-block"><?php echo $language->get('kassa_shop_id_description'); ?></p>
                <?php endif; ?>
            </div>
        </div>
        <div class="form-group required">
            <label class="col-sm-2 control-label" for="kassa-password"><?php echo $language->get('kassa_password_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_kassa_password" value="<?php echo $kassa->getPassword(); ?>" placeholder="<?php echo $language->get('kassa_password_label'); ?>" id="kassa-password" class="form-control" />
                <?php if (!empty($error_kassa_password)) : ?>
                <div class="text-danger"><?php echo $error_kassa_password; ?></div>
                <?php else: ?>
                <p class="help-block"><?php echo $language->get('kassa_password_description'); ?></p>
                <?php endif; ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-payment-mode"><?php echo $language->get('kassa_payment_mode_label'); ?></label>
            <div class="col-sm-10">
                <label class="form-check-label">
                    <input type="radio" name="yandex_money_kassa_payment_mode" value="kassa" id="kassa-payment-mode-kassa" class="form-check-input"<?php echo $kassa->getEpl() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_payment_mode_kassa_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2" style="padding-bottom: 10px;" id="kassa-payment-mode-kassa-container">
                <label class="form-check-label">
                    <input type="checkbox" name="yandex_money_kassa_use_yandex_button" value="on" id="kassa-use-yandex-button" class="form-check-input"<?php echo $kassa->useYandexButton() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_use_yandex_button_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2">
                <label class="form-check-label">
                    <input type="radio" name="yandex_money_kassa_payment_mode" value="shop" id="kassa-payment-mode-shop" class="form-check-input"<?php echo $kassa->getEpl() ? '' : ' checked'; ?> />
                    <?php echo $language->get('kassa_payment_mode_shop_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2" id="kassa-payment-mode-shop-container">
                <?php foreach ($kassa->getPaymentMethods() as $id => $enabled): $name = 'kassa_payment_method_' . $id; ?>
                <label class="form-check-label">
                    <input type="checkbox" name="yandex_money_<?php echo $name; ?>" value="on" id="kassa-payment-method-<?php echo $id; ?>" class="form-check-input"<?php echo $enabled ? ' checked' : ''; ?> />
                    <?php echo $language->get($name); ?>
                </label><br />
                <?php endforeach; ?>
                <?php if (!empty($error_kassa_payment_method)) : ?>
                <div class="text-danger"><?php echo $error_kassa_payment_method; ?></div>
                <?php endif; ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-display-name"><?php echo $language->get('kassa_display_name_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_kassa_display_name" value="<?php echo $kassa->getDisplayName(); ?>" placeholder="<?php echo $language->get('kassa_display_name_label'); ?>" id="kassa-display-name" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_display_name_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-send-receipt" name="yandex_money_kassa_send_receipt" value="on"<?php echo $kassa->sendReceipt() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_send_receipt_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group receipt-only">
            <div class="col-sm-10 col-sm-offset-2">
                <h4><?php echo $language->get('kassa_send_receipt_tax_rate_title'); ?></h4>
            </div>
        </div>
        <div class="form-group receipt-only">
            <label class="col-sm-2 control-label" for="kassa-tax-rate-default">
                <?php echo $language->get('kassa_tax_rate_default_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-tax-rate-default" name="yandex_money_kassa_tax_rate_default" class="form-control">
                    <?php foreach ($kassaTaxRates as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $kassa->getDefaultTaxRate() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('kassa_tax_rate_default_description'); ?></p>
            </div>
        </div>
        <div class="form-group receipt-only">
            <label class="col-sm-2 control-label">
                <?php echo $language->get('kassa_tax_rate_table_caption'); ?>
            </label>
            <div class="col-sm-10">
                <table class="table">
                    <thead>
                    <tr>
                        <th><?php echo $language->get('kassa_shop_tax_rate_header'); ?></th>
                        <th><?php echo $language->get('kassa_kassa_tax_rate_header'); ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($shopTaxRates as $id => $name) : ?>
                    <tr>
                        <td>
                            <label class="control-label" for="kassa-tax-rate-<?php echo $id; ?>"><?php echo $name; ?></td>
                        <td>
                            <select id="kassa-tax-rate-<?php echo $id; ?>" name="yandex_money_kassa_tax_rates[<?php echo $id; ?>]" class="form-control">
                                <?php $v = $kassa->getTaxRateId($id); foreach ($kassaTaxRates as $taxRateId => $taxRateName) : ?>
                                <option value="<?php echo $taxRateId; ?>"<?php echo $v == $taxRateId ? ' selected' : ''; ?>><?php echo $taxRateName; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-notification-url">
                <?php echo $language->get('kassa_notification_url_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="kassa-notification-url" name="kassa_notification_url" value="<?php echo $notificationUrl; ?>" class="form-control" disabled />
                <p class="help-block"><?php echo $language->get('kassa_notification_url_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Показывать ссылку на сайт Кассы</label>
            <div class="col-sm-10">
                <select id="kassa-debug-log" name="yandex_money_kassa_show_in_footer" class="form-control">
                    <option value="off" <?php echo ($kassa->getShowLinkInFooter() ? '' : 'selected'); ?>><?php echo $language->get('kassa_debug_log_off'); ?></option>
                    <option value="on" <?php echo ($kassa->getShowLinkInFooter() ? 'selected' : ''); ?>><?php echo $language->get('kassa_debug_log_on'); ?></option>
                </select>
                <p class="help-block">Ссылка будет отображаться в подвале вашего сайта.</p>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-invoice" name="yandex_money_kassa_invoice" value="on"<?php echo $kassa->isInvoicesEnabled() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_invoice_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group invoice-only">
            <label class="col-sm-2 control-label"><?php echo $language->get('kassa_invoice_heading_label'); ?></label>
            <label class="col-sm-2 control-label" for="kassa-invoice-subject">
                <?php echo $language->get('kassa_invoice_subject_label'); ?>
            </label>
            <div class="col-sm-8">
                <input type="text" id="kassa-invoice-subject" name="yandex_money_kassa_invoice_subject" value="<?php echo $kassa->getInvoiceSubject(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_invoice_subject_description'); ?></p>
            </div>
            <label class="col-sm-2 col-sm-offset-2 control-label" for="kassa-invoice-message">
                <?php echo $language->get('kassa_invoice_message_label'); ?>
            </label>
            <div class="col-sm-8">
                <textarea id="kassa-invoice-message" name="yandex_money_kassa_invoice_message" class="form-control"><?php echo $kassa->getInvoiceMessage(); ?></textarea>
                <p class="help-block"><?php echo $language->get('kassa_invoice_message_description'); ?></p>
            </div>
            <div class="col-sm-10 col-sm-offset-4">
                <label>
                    <input type="checkbox" id="kassa-invoice-logo" name="yandex_money_kassa_invoice_logo" value="on"<?php echo $kassa->getSendInvoiceLogo() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_invoice_logo_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label"><strong><?php echo $language->get('kassa_before_redirect_label'); ?></strong></div>
            <div class="col-sm-10">
                <label>
                    <input type="checkbox" name="yandex_money_kassa_create_order_before_redirect" id="yandex_money_kassa_create_order_before_redirect"
                           value="on" <?php echo ($kassa->getCreateOrderBeforeRedirect() ? 'checked' : ''); ?> />
                    <?php echo $language->get('kassa_create_order_label'); ?>
                </label><br />
                <label>
                    <input type="checkbox" name="yandex_money_kassa_clear_cart_before_redirect" id="yandex_money_kassa_clear_cart_before_redirect"
                           value="on" <?php echo ($kassa->getClearCartBeforeRedirect() ? 'checked' : ''); ?> />
                    <?php echo $language->get('kassa_clear_cart_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-success-order-status">
                <?php echo $language->get('kassa_success_order_status_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-success-order-status" name="yandex_money_kassa_success_order_status" class="form-control">
                    <?php foreach ($orderStatuses as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $kassa->getSuccessOrderStatusId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('kassa_success_order_status_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-min-payment-amount">
                <?php echo $language->get('kassa_minimum_payment_amount_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="kassa-min-payment-amount" name="yandex_money_kassa_minimum_payment_amount" value="<?php echo $kassa->getMinPaymentAmount(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_minimum_payment_amount_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-geo-zone">
                <?php echo $language->get('kassa_geo_zone_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-geo-zone" name="yandex_money_kassa_geo_zone" class="form-control">
                    <option value="0"<?php echo $kassa->getGeoZoneId() == 0 ? ' selected' : ''; ?>><?php echo $language->get('kassa_any_geo_zone'); ?></option>
                    <?php foreach ($geoZones as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $kassa->getGeoZoneId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('kassa_geo_zone_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-debug-log">
                <?php echo $language->get('kassa_debug_log_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-debug-log" name="yandex_money_kassa_debug_log" class="form-control">
                    <option value="off"<?php echo $kassa->getDebugLog() ? '' : ' selected'; ?>><?php echo $language->get('kassa_debug_log_off'); ?></option>
                    <option value="on"<?php echo $kassa->getDebugLog() ? ' selected' : ''; ?>><?php echo $language->get('kassa_debug_log_on'); ?></option>
                </select>
                <p class="help-block"><?php echo $language->get('kassa_debug_log_description'); ?></p>
                <p class="help-block"><a href="<?php echo $kassa_logs_link; ?>"><?php echo $language->get('kassa_view_logs'); ?></a></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $language->get('kassa_payment_list_label'); ?></label>
            <div class="col-sm-9">
                <p class="help-block"><a href="<?php echo $kassa_payments_link; ?>"><?php echo $language->get('kassa_payment_list_link'); ?></a></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-sort-order">
                <?php echo $language->get('kassa_sort_order_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="kassa-sort-order" name="yandex_money_sort_order" value="<?php echo $yandex_money_sort_order; ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_sort_order_description'); ?></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

jQuery(document).ready(function () {

    function togglePaymentMode(value) {
        if (value == 'kassa') {
            jQuery('#kassa-payment-mode-kassa-container').slideDown();
            jQuery('#kassa-payment-mode-shop-container').slideUp();
        } else {
            jQuery('#kassa-payment-mode-kassa-container').slideUp();
            jQuery('#kassa-payment-mode-shop-container').slideDown();
        }
    }

    function toggleSendReceipt(value) {
        if (value) {
            jQuery('.receipt-only').slideDown();
        } else {
            jQuery('.receipt-only').slideUp();
        }
    }

    function toggleInvoice(value) {
        if (value) {
            jQuery('.invoice-only').slideDown();
        } else {
            jQuery('.invoice-only').slideUp();
        }
    }

    var form = document.getElementById('form-payment-yandex-money');
    togglePaymentMode(form.yandex_money_kassa_payment_mode.value);
    toggleSendReceipt(form.yandex_money_kassa_send_receipt.checked);
    toggleInvoice(form.yandex_money_kassa_invoice.checked);

    jQuery('input[name=yandex_money_kassa_payment_mode]').click(function () {
        togglePaymentMode(form.yandex_money_kassa_payment_mode.value)
    });

    jQuery('#kassa-send-receipt').bind('change', function () {
        toggleSendReceipt(this.checked);
    });

    jQuery('#kassa-invoice').bind('change', function () {
        toggleInvoice(this.checked);
    });
});

</script>