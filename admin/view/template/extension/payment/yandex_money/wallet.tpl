
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $language->get('wallet_page_title'); ?></h3>
    </div>
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('wallet_header_description'); ?></p>
            <p><?php echo $language->get('wallet_version_string'); ?> <?php echo $module_version; ?></p>
        </div>

        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <label>
                    <input type="checkbox" id="wallet-enabled" name="yandex_money_wallet_enabled" value="on"<?php echo $wallet->isEnabled() ? ' checked' : ''; ?> class="enable-button" />
                    <?php echo $language->get('wallet_enable_label'); ?>
                </label>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="wallet-account-id"><?php echo $language->get('wallet_account_id_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_wallet_account_id" value="<?php echo $wallet->getAccountId(); ?>" placeholder="<?php echo $language->get('wallet_account_id_label'); ?>" id="wallet-account-id" class="form-control" />
                <?php if (!empty($error_wallet_account_id)) : ?>
                <div class="text-danger"><?php echo $error_wallet_account_id; ?></div>
                <?php else: ?>
                <p class="help-block"><?php echo $language->get('wallet_account_id_description'); ?></p>
                <?php endif; ?>
            </div>
        </div>
        <div class="form-group required">
            <label class="col-sm-2 control-label" for="wallet-password"><?php echo $language->get('wallet_password_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_wallet_password" value="<?php echo $wallet->getPassword(); ?>" placeholder="<?php echo $language->get('wallet_password_label'); ?>" id="wallet-password" class="form-control" />
                <?php if (!empty($error_wallet_password)) : ?>
                <div class="text-danger"><?php echo $error_wallet_password; ?></div>
                <?php else: ?>
                <p class="help-block"><?php echo $language->get('wallet_password_description'); ?></p>
                <?php endif; ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="wallet-display-name"><?php echo $language->get('wallet_display_name_label'); ?></label>
            <div class="col-sm-10">
                <input type="text" name="yandex_money_wallet_display_name" value="<?php echo $wallet->getDisplayName(); ?>" placeholder="<?php echo $language->get('wallet_display_name_label'); ?>" id="wallet-display-name" class="form-control" />
                <p class="help-block"><?php echo $language->get('wallet_display_name_description'); ?></p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="wallet-notification-url">
                <?php echo $language->get('wallet_notification_url_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="wallet-notification-url" name="wallet_notification_url" value="<?php echo $callbackUrl; ?>" class="form-control" disabled />
                <p class="help-block"><?php echo $language->get('wallet_notification_url_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label"><strong><?php echo $language->get('wallet_before_redirect_label'); ?></strong></div>
            <div class="col-sm-10">
                <label>
                    <input type="checkbox" name="yandex_money_wallet_create_order_before_redirect" id="yandex_money_wallet_create_order_before_redirect"
                           value="on" <?php echo ($wallet->getCreateOrderBeforeRedirect() ? 'checked' : ''); ?> />
                    <?php echo $language->get('wallet_create_order_label'); ?>
                </label><br />
                <label>
                    <input type="checkbox" name="yandex_money_wallet_clear_cart_before_redirect" id="yandex_money_wallet_clear_cart_before_redirect"
                           value="on" <?php echo ($wallet->getClearCartBeforeRedirect() ? 'checked' : ''); ?> />
                    <?php echo $language->get('wallet_clear_cart_label'); ?>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="wallet-success-order-status">
                <?php echo $language->get('wallet_success_order_status_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="wallet-success-order-status" name="yandex_money_wallet_success_order_status" class="form-control">
                    <?php foreach ($orderStatuses as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $wallet->getSuccessOrderStatusId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('wallet_success_order_status_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="wallet-min-payment-amount">
                <?php echo $language->get('wallet_minimum_payment_amount_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="wallet-min-payment-amount" name="yandex_money_wallet_minimum_payment_amount" value="<?php echo $wallet->getMinPaymentAmount(); ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('wallet_minimum_payment_amount_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="kassa-geo-zone">
                <?php echo $language->get('wallet_geo_zone_label'); ?>
            </label>
            <div class="col-sm-10">
                <select id="kassa-geo-zone" name="yandex_money_wallet_geo_zone" class="form-control">
                    <option value="0"<?php echo $wallet->getGeoZoneId() == 0 ? ' selected' : ''; ?>><?php echo $language->get('wallet_any_geo_zone'); ?></option>
                    <?php foreach ($geoZones as $id => $name) : ?>
                    <option value="<?php echo $id; ?>"<?php echo $wallet->getGeoZoneId() == $id ? ' selected' : ''; ?>><?php echo $name; ?></option>
                    <?php endforeach; ?>
                </select>
                <p class="help-block"><?php echo $language->get('wallet_geo_zone_description'); ?></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="wallet-sort-order">
                <?php echo $language->get('wallet_sort_order_label'); ?>
            </label>
            <div class="col-sm-10">
                <input type="text" id="wallet-sort-order" name="yandex_money_wallet_sort_order" value="<?php echo $yandex_money_wallet_sort_order; ?>" class="form-control" />
                <p class="help-block"><?php echo $language->get('wallet_sort_order_description'); ?></p>
            </div>
        </div>
    </div>
</div>
