
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
                    <input type="checkbox" id="kassa-enabled" name="yoomoney_kassa_enabled" value="on"<?php echo $kassa->isEnabled() ? ' checked' : ''; ?> class="enable-button" />
                    <?php echo $language->get('kassa_enable_label'); ?>
                </label>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="kassa-shop-id"><?php echo $language->get('kassa_shop_id_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yoomoney_kassa_shop_id" value="<?php echo $kassa->getShopId(); ?>" placeholder="<?php echo $language->get('kassa_shop_id_label'); ?>" id="kassa-shop-id" class="form-control" />
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
                <input type="text" name="yoomoney_kassa_password" value="<?php echo $kassa->getPassword(); ?>" placeholder="<?php echo $language->get('kassa_password_label'); ?>" id="kassa-password" class="form-control" />
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
                    <input type="radio" name="yoomoney_kassa_payment_mode" value="kassa" id="kassa-payment-mode-kassa" class="form-check-input"<?php echo $kassa->getEpl() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_payment_mode_kassa_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2" style="padding-bottom: 10px;" id="kassa-payment-mode-kassa-container">
                <label class="form-check-label">
                    <input type="checkbox" name="yoomoney_kassa_use_installments_button" value="on" class="form-check-input"<?php echo $kassa->useInstallmentsButton() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_use_installments_button_label'); ?>
                </label>
                <br>
                <label class="form-check-label" style="margin-left: 20px;">
                    <input type="checkbox" name="yoomoney_kassa_add_installments_block" value="on"
                           class="form-check-input"<?php echo $kassa->getAddInstallmentsBlock() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_add_installments_block_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2">
                <label class="form-check-label">
                    <input type="radio" name="yoomoney_kassa_payment_mode" value="shop" id="kassa-payment-mode-shop" class="form-check-input"<?php echo $kassa->getEpl() ? '' : ' checked'; ?> />
                    <?php echo $language->get('kassa_payment_mode_shop_label'); ?>
                </label>
            </div>
            <div class="col-sm-10 col-sm-offset-2" id="kassa-payment-mode-shop-container">
                <div id="kassa-payment-method-warning" style="display: none" class="alert alert-warning"></div>
                <?php foreach ($kassa->getPaymentMethods() as $id => $enabled): $name = 'kassa_payment_method_' . $id; ?>
                <label class="form-check-label">
                    <input type="checkbox" name="yoomoney_<?php echo $name; ?>" value="on" id="kassa-payment-method-<?php echo $id; ?>" class="form-check-input"<?php echo $enabled ? ' checked' : ''; ?> />
                    <?php echo $language->get($name); ?>
                </label><br />
                <?php endforeach; ?>
                <label class="form-check-label" style="margin-left: 20px;">
                    <input type="checkbox" name="yoomoney_kassa_add_installments_block" value="on"
                           class="form-check-input"<?php echo $kassa->getAddInstallmentsBlock() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_add_installments_block_label'); ?>
                </label>
                <?php if (!empty($error_kassa_payment_method)) : ?>
                <div class="text-danger"><?php echo $error_kassa_payment_method; ?></div>
                <?php endif; ?>
            </div>
        </div>

        <!-- Currency Start-->

        <div class="form-group">
            <label class="col-sm-2 control-label" for="yoomoney-kassa-currency"><?= $language->get('kassa_currency')?></label>
            <div class="col-sm-5">
                <select id="yoomoney-kassa-currency" name="yoomoney_kassa_currency" class="form-control">
                    <?php foreach ($kassa_currencies as $code => $data): ?>
                    <option value="<?= $code ?>"<?= $kassa->getCurrency() == $code ? ' selected' : '' ?>><?= $data['code'] ?> (<?= $data['title'] ?>)</option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?= $language->get('kassa_currency_help')?></p>
            </div>
            <div class="col-sm-5">
                <label class="form-check-label">
                    <input type="checkbox" name="yoomoney_kassa_currency_convert" value="on"
                           id="currency_convert"
                           class="form-check-input"<?= $kassa->getCurrencyConvert() ? ' checked' : '' ?> />
                    <?= $language->get('kassa_currency_convert')?>
                </label>
                <p class="help-block"><?= $language->get('kassa_currency_convert_help')?></p>
            </div>
        </div>

        <!-- Sbbol Start-->

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-display-name"><?php echo $language->get('b2b_sberbank_label'); ?></label>
            <div class="col-sm-10">
                <label>
                    <input type="checkbox" id="kassa-b2b-sberbank-on" name="yoomoney_kassa_b2b_sberbank_enabled" value="on"<?php echo $kassa->getB2bSberbankEnabled() ? ' checked' : ''; ?> />
                    <?php echo $language->get('b2b_sberbank_on_label'); ?>
                </label>
            </div>

            <div class="col-sm-10 col-sm-offset-2">
                <div class="form-group">
                    <label class="col-sm-2 control-label"
                           for="b2b-sberbank-description-template"><?= $language->get('b2b_sberbank_label') ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="yoomoney_kassa_b2b_sberbank_payment_purpose"
                               value="<?= $kassa->getB2bSberbankPaymentPurpose() ?>"
                               placeholder="<?= $language->get('kassa_default_payment_description') ?>"
                               id="_b2b_sberbank_payment_purpose" class="form-control"/>
                        <p class="help-block"><?= $language->get('b2b_sberbank_template_help'); ?></p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="kassa-b2b-tax-rate-default">
                        <?php echo $language->get('b2b_sberbank_vat_default_label'); ?>
                    </label>
                    <div class="col-sm-10">
                        <select id="kassa-b2b-tax-rate-default" name="yoomoney_kassa_b2b_tax_rate_default" class="form-control">
                            <?php foreach ($b2bTaxRates as $id => $name) : ?>
                            <option value="<?php echo $id; ?>"<?php echo $kassa->getB2bSberbankDefaultTaxRate() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <p class="help-block"><?php echo $language->get('b2b_sberbank_vat_default_help'); ?></p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <?php echo $language->get('b2b_sberbank_vat_label'); ?>
                    </label>
                    <div class="col-sm-10">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><?php echo $language->get('b2b_sberbank_vat_cms_label'); ?></th>
                                <th><?php echo $language->get('b2b_sberbank_vat_sbbol_label'); ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($shopTaxRates as $id => $name) : ?>
                            <tr>
                                <td>
                                    <label class="control-label" for="kassa-tax-rate-<?php echo $id; ?>"><?php echo $name; ?></td>
                                <td>
                                    <select id="kassa-b2b-tax-rate-<?php echo $id; ?>" name="yoomoney_kassa_b2b_tax_rates[<?php echo $id; ?>]" class="form-control">
                                        <?php $v = $kassa->getB2bTaxRateId($id); foreach ($b2bTaxRates as $taxRateId => $taxRateName) : ?>
                                        <option value="<?php echo $taxRateId; ?>"<?php echo $v == $taxRateId ? ' selected' : ''; ?>><?php echo $taxRateName; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                        <p class="help-block"><?php echo $language->get('b2b_sberbank_tax_message'); ?></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-payment-description"><?php echo $language->get('kassa_payment_description_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yoomoney_kassa_payment_description" value="<?php echo $kassa->getPaymentDescription(); ?>" placeholder="<?php echo $language->get('kassa_default_payment_description'); ?>" id="kassa-payment-description" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_payment_description_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-enable-hold-mode" name="yoomoney_kassa_enable_hold_mode" value="on"<?php echo $kassa->getEnableHoldMode() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_hold_setting_label'); ?>
                </label>
                <p class="help-block"><?php echo $language->get('kassa_hold_setting_description'); ?></p>
            </div>


            <div class="statuses-wrapper">
                <div class="col-sm-10 col-sm-offset-2">
                    <label> <?php echo $language->get('kassa_statuses_description_label'); ?> </label>
                </div>

                <label class="col-sm-2 control-label" for="kassa-hold-order-status">
                    <?php echo $language->get('kassa_hold_order_status_label'); ?>
                </label>

                <div class="col-sm-10" style="margin-bottom: 10px;">
                    <select id="kassa-hold-order-status" name="yoomoney_kassa_hold_order_status" class="form-control">
                        <?php foreach ($orderStatuses as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getHoldOrderStatusId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <label class="col-sm-2 control-label" for="kassa-cancel-order-status">
                    <?php echo $language->get('kassa_cancel_order_status_label'); ?>
                </label>
                <div class="col-sm-10">
                    <select id="kassa-cancel-order-status" name="yoomoney_kassa_cancel_order_status" class="form-control">
                        <?php foreach ($orderStatuses as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getOrderCanceledStatus() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-display-name"><?php echo $language->get('kassa_display_name_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yoomoney_kassa_display_name" value="<?php echo $kassa->getDisplayName(); ?>" placeholder="<?php echo $language->get('kassa_display_name_label'); ?>" id="kassa-display-name" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_display_name_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-send-receipt" name="yoomoney_kassa_send_receipt" value="on"<?php echo $kassa->isSendReceipt() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_send_receipt_label'); ?>
                </label>
            </div>
        </div>
        <div class="col-sm-10 col-sm-offset-2">
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
                    <select id="kassa-tax-rate-default" name="yoomoney_kassa_tax_rate_default" class="form-control">
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
                                <select id="kassa-tax-rate-<?php echo $id; ?>" name="yoomoney_kassa_tax_rates[<?php echo $id; ?>]" class="form-control">
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

            <div class="form-group receipt-only">
                <label class="col-sm-2 control-label" >
                    <?php echo $language->get('kassa_default_payment_mode_label'); ?>
                </label>
                <div class="col-sm-10">
                    <select id="kassa-default-payment-mode" name="yoomoney_kassa_default_payment_mode" class="form-control">
                        <?php foreach ($kassa->getPaymentModeEnum() as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getDefaultPaymentMode() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="form-group receipt-only">
                <label class="col-sm-2 control-label">
                    <?php echo $language->get('kassa_default_payment_subject_label'); ?>
                </label>
                <div class="col-sm-10">
                    <select id="kassa-default-payment-subject" name="yoomoney_kassa_default_payment_subject" class="form-control">
                        <?php foreach ($kassa->getPaymentSubjectEnum() as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getDefaultPaymentSubject() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="form-group receipt-only">
                <label class="col-sm-2 control-label">
                    <?php echo $language->get('kassa_default_delivery_payment_mode_label'); ?>
                </label>
                <div class="col-sm-10">
                    <select id="kassa-tax-rate-default" name="yoomoney_kassa_default_delivery_payment_mode" class="form-control">
                        <?php foreach ($kassa->getPaymentModeEnum() as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getDefaultDeliveryPaymentMode() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="form-group receipt-only">
                <label class="col-sm-2 control-label">
                    <?php echo $language->get('kassa_default_delivery_payment_subject_label'); ?>
                </label>
                <div class="col-sm-10">
                    <select id="kassa-tax-rate-default" name="yoomoney_kassa_default_delivery_payment_subject" class="form-control">
                        <?php foreach ($kassa->getPaymentSubjectEnum() as $id => $name) : ?>
                        <option value="<?php echo $id; ?>"<?php echo $kassa->getDefaultDeliveryPaymentSubject() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="form-group receipt-only">

                <label class="col-sm-2 control-label">
                    <?= $language->get('kassa_second_receipt_header');?>
                </label>
                <div class="col-sm-10">
                    <label style="font-weight: 600; padding-top: 9px; cursor: pointer" class="form-check-label">
                        <input style="vertical-align:middle;margin:-2px 3px 0 0;cursor: pointer" type="radio" id="kassa-second-receipt-enable-on" name="yoomoney_kassa_second_receipt_enable" value="1" class="form-check-input" <?= $kassa->isSecondReceipt() ? "checked" : '' ?>/>
                        <?php echo $language->get('kassa_second_receipt_enable'); ?>
                    </label>
                    <label style="font-weight: 600; margin-left: 10px; cursor: pointer" class="form-check-label">
                        <input style="vertical-align:middle;margin:-2px 3px 0 0;cursor: pointer" type="radio" id="kassa-second-receipt-enable-off" name="yoomoney_kassa_second_receipt_enable" value="0" class="form-check-input" <?= $kassa->isSecondReceipt() ? '' : "checked" ?>/>
                        <?php echo $language->get('kassa_second_receipt_disable'); ?>
                    </label>
                </div>
                <div class="col-sm-10 col-sm-offset-2 second-receipt-wrapper">
                    <p><?php echo $language->get('kassa_second_receipt_description'); ?></p>
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <td style="border: none">
                                <label class="control-label">
                                    <?= $language->get('kassa_second_receipt_enable_label'); ?>
                                </label>
                            </td>
                            <td style="border: none">
                                <select id="kassa-second-receipt-status" name="yoomoney_kassa_second_receipt_status" class="form-control col-xl-4 col-md-4" data-toggle="tooltip" data-placement="left" title="">
                                    <?php foreach ($orderStatuses as $id => $status) : ?>
                                    <option value="<?php echo $id; ?>"<?php echo ($id != $kassa->getSecondReceiptStatus() ?: ' selected="selected"'); ?>><?php echo htmlspecialchars($status); ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <p class="help-block"><?php echo $language->get('kassa_second_receipt_help_info'); ?></p>
                </div>
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
            <label class="col-sm-2 control-label"><?php echo $language->get('kassa_show_url_link');?></label>
            <div class="col-sm-10">
                <select id="kassa-show-in-footer" name="yoomoney_kassa_show_in_footer" class="form-control">
                    <option value="off" <?php echo ($kassa->getShowLinkInFooter() ? '' : 'selected'); ?>><?php echo $language->get('kassa_debug_log_off'); ?></option>
                    <option value="on" <?php echo ($kassa->getShowLinkInFooter() ? 'selected' : ''); ?>><?php echo $language->get('kassa_debug_log_on'); ?></option>
                </select>
                <p class="help-block"><?php echo $language->get('kassa_show_url_link_description');?></p>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="kassa-invoice" name="yoomoney_kassa_invoice" value="on"<?php echo $kassa->isInvoicesEnabled() ? ' checked' : ''; ?> />
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
                <input type="text" id="kassa-invoice-subject" name="yoomoney_kassa_invoice_subject" value="<?php echo $kassa->getInvoiceSubject(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_invoice_subject_description'); ?></p>
            </div>
            <label class="col-sm-2 col-sm-offset-2 control-label" for="kassa-invoice-message">
                <?php echo $language->get('kassa_invoice_message_label'); ?>
            </label>
            <div class="col-sm-8">
                <textarea id="kassa-invoice-message" name="yoomoney_kassa_invoice_message" class="form-control"><?php echo $kassa->getInvoiceMessage(); ?></textarea>
                <p class="help-block"><?php echo $language->get('kassa_invoice_message_description'); ?></p>
            </div>
            <div class="col-sm-10 col-sm-offset-4">
                <label>
                    <input type="checkbox" id="kassa-invoice-logo" name="yoomoney_kassa_invoice_logo" value="on"<?php echo $kassa->getSendInvoiceLogo() ? ' checked' : ''; ?> />
                    <?php echo $language->get('kassa_invoice_logo_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label"><strong><?php echo $language->get('kassa_before_redirect_label'); ?></strong></div>
            <div class="col-sm-10">
                <label>
                    <input type="checkbox" name="yoomoney_kassa_create_order_before_redirect" id="yoomoney_kassa_create_order_before_redirect"
                           value="on" <?php echo ($kassa->getCreateOrderBeforeRedirect() ? 'checked' : ''); ?> />
                    <?php echo $language->get('kassa_create_order_label'); ?>
                </label><br />
                <label>
                    <input type="checkbox" name="yoomoney_kassa_clear_cart_before_redirect" id="yoomoney_kassa_clear_cart_before_redirect"
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
                <select id="kassa-success-order-status" name="yoomoney_kassa_success_order_status" class="form-control">
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
                <input type="text" id="kassa-min-payment-amount" name="yoomoney_kassa_minimum_payment_amount" value="<?php echo $kassa->getMinPaymentAmount(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('kassa_minimum_payment_amount_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-geo-zone">
                <?php echo $language->get('kassa_geo_zone_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-geo-zone" name="yoomoney_kassa_geo_zone" class="form-control">
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
                <select id="kassa-debug-log" name="yoomoney_kassa_debug_log" class="form-control">
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
                <input type="text" id="kassa-sort-order" name="yoomoney_kassa_sort_order" value="<?php echo $yoomoney_kassa_sort_order; ?>" class="form-control" />
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

        function toggleSecondReceipt(value) {
            if (value == 1) {
                jQuery('.second-receipt-wrapper').slideDown();
            } else {
                jQuery('.second-receipt-wrapper').slideUp();
            }
        }

        function toggleInvoice(value) {
            if (value) {
                jQuery('.invoice-only').slideDown();
            } else {
                jQuery('.invoice-only').slideUp();
            }
        }

        function toggleStatuses(value) {
            if (value) {
                jQuery('.statuses-wrapper').slideDown();
            } else {
                jQuery('.statuses-wrapper').slideUp();
            }
        }

        var form = document.getElementById('form-payment-yoomoney');
        togglePaymentMode(form.yoomoney_kassa_payment_mode.value);
        toggleSendReceipt(form.yoomoney_kassa_send_receipt.checked);
        toggleSecondReceipt(form.yoomoney_kassa_second_receipt_enable.value);
        toggleInvoice(form.yoomoney_kassa_invoice.checked);
        toggleStatuses(form.yoomoney_kassa_enable_hold_mode.checked);

        jQuery('input[name=yoomoney_kassa_payment_mode]').click(function () {
            togglePaymentMode(form.yoomoney_kassa_payment_mode.value)
        });

        jQuery('#kassa-payment-mode-shop-container input').change(function () {
            if (jQuery(this).attr('name') !== 'yoomoney_kassa_payment_method_widget') {
                return;
            } else if (!jQuery(this).prop('checked')) {
                return;
            }

            jQuery.ajax({
                url: "<?php echo htmlspecialchars_decode($install_widget); ?>",
                dataType: "json",
                method: "GET",
                success: function (data) {
                    if (!data.ok) {
                        jQuery('#kassa-payment-method-warning').html(data.error).show();
                    }
                },
            });
        })

        jQuery('#kassa-send-receipt').bind('change', function () {
            toggleSendReceipt(this.checked);
        });

        jQuery('input[name=yoomoney_kassa_second_receipt_enable]').bind('change', function () {
            toggleSecondReceipt(this.value);
        });

        jQuery('#kassa-invoice').bind('change', function () {
            toggleInvoice(this.checked);
        });

        jQuery('#kassa-enable-hold-mode').bind('change', function () {
            toggleStatuses(this.checked);
        });

        jQuery('input[name=yoomoney_kassa_add_installments_block]').on('change', function () {
            var checked = this.checked;
            jQuery('input[name=yoomoney_kassa_add_installments_block]').each(function() {
                this.checked = checked;
            });
        });
    });

</script>