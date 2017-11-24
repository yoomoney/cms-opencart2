
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $language->get('billing_page_title'); ?></h3>
    </div>
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('billing_header_description'); ?></p>
            <p><?php echo $language->get('billing_version_string'); ?> <?php echo $module_version; ?></p>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="billing-enabled" name="yandex_money_billing_enabled" value="on"<?php echo $billing->isEnabled() ? ' checked' : ''; ?> class="enable-button" />
                    <?php echo $language->get('billing_enable_label'); ?>
                </label>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="billing-form-id"><?php echo $language->get('billing_form_id_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_billing_form_id" value="<?php echo $billing->getFormId(); ?>" placeholder="<?php echo $language->get('billing_form_id_label'); ?>" id="billing-form-id" class="form-control" />
                <?php if (!empty($error_billing_form_id)) : ?>
                <div class="text-danger"><?php echo $error_billing_form_id; ?></div>
                <?php else: ?>
                <p class="help-block"><?php echo $language->get('billing_form_id_description'); ?></p>
                <?php endif; ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="billing-purpose"><?php echo $language->get('billing_purpose_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_billing_purpose" value="<?php echo $billing->getPurpose(); ?>" placeholder="<?php echo $language->get('billing_purpose_label'); ?>" id="billing-purpose" class="form-control" />
                <p class="help-block"><?php echo $language->get('billing_purpose_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="billing-display-name"><?php echo $language->get('billing_display_name_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_billing_display_name" value="<?php echo $billing->getDisplayName(); ?>" placeholder="<?php echo $language->get('billing_display_name_label'); ?>" id="billing-display-name" class="form-control" />
                <p class="help-block"><?php echo $language->get('billing_display_name_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="billing-success-order-status">
                <?php echo $language->get('billing_success_order_status_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="billing-success-order-status" name="yandex_money_billing_success_order_status" class="form-control">
                    <?php foreach ($orderStatuses as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $billing->getSuccessOrderStatusId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('billing_success_order_status_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="billing-min-payment-amount">
                <?php echo $language->get('billing_minimum_payment_amount_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="billing-min-payment-amount" name="yandex_money_billing_minimum_payment_amount" value="<?php echo $billing->getMinPaymentAmount(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('billing_minimum_payment_amount_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-geo-zone">
                <?php echo $language->get('billing_geo_zone_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-geo-zone" name="yandex_money_billing_geo_zone" class="form-control">
                    <option value="0"<?php echo $billing->getGeoZoneId() == 0 ? ' selected' : ''; ?>><?php echo $language->get('billing_any_geo_zone'); ?></option>
                    <?php foreach ($geoZones as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $billing->getGeoZoneId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('billing_geo_zone_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="billing-sort-order">
                <?php echo $language->get('billing_sort_order_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="billing-sort-order" name="yandex_money_billing_sort_order" value="<?php echo $yandex_money_billing_sort_order; ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('billing_sort_order_description'); ?></p>
            </div>
        </div>
    </div>
</div>
