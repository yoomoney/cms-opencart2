<?php

/**
 * @var Language $language
 */

echo $header;
echo $column_left;

?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-payment-yandex-money" data-toggle="tooltip" title="<?php echo $language->get('button_save'); ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $language->get('button_cancel'); ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $language->get('module_title'); ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) : ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if (!empty($error_warning)) : ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>
        <?php if (!empty($successMessage)) : ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $successMessage; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>

        <ul class="nav nav-tabs">
            <li<?php echo ($lastActiveTab == 'tab-kassa' ? ' class="active"' : ''); ?>><a href="#tab-kassa" data-toggle="tab"><?php echo $language->get('kassa_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-wallet' ? ' class="active"' : ''); ?>><a href="#tab-wallet" data-toggle="tab"><?php echo $language->get('wallet_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-billing' ? ' class="active"' : ''); ?>><a href="#tab-billing" data-toggle="tab"><?php echo $language->get('billing_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-metrika' ? ' class="active"' : ''); ?>><a href="#tab-metrika" data-toggle="tab"><?php echo $language->get('metrika_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-market' ? ' class="active"' : ''); ?>><a href="#tab-market" data-toggle="tab"><?php echo $language->get('market_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-orders' ? ' class="active"' : ''); ?>><a href="#tab-orders" data-toggle="tab"><?php echo $language->get('orders_tab_header'); ?></a></li>
            <li<?php echo ($lastActiveTab == 'tab-update' ? ' class="active"' : ''); ?>><a href="#tab-update" data-toggle="tab"><?php echo $language->get('update_tab_header'); ?></a></li>
        </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment-yandex-money" class="form-horizontal">
            <input type="hidden" name="language_reload" value="1" />
            <input type="hidden" name="last_active_tab" id="last-active-tab" value="<?php echo $lastActiveTab; ?>" />
            <div class="tab-content bootstrap">
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-kassa' ? ' active' : ''); ?>" id="tab-kassa">
                    <?php include dirname(__FILE__) . '/yandex_money/kassa.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-wallet' ? ' active' : ''); ?>" id="tab-wallet">
                    <?php include dirname(__FILE__) . '/yandex_money/wallet.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-billing' ? ' active' : ''); ?>" id="tab-billing">
                    <?php include dirname(__FILE__) . '/yandex_money/billing.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-metrika' ? ' active' : ''); ?>" id="tab-metrika">
                    <?php include dirname(__FILE__) . '/yandex_money/metrika.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-market' ? ' active' : ''); ?>" id="tab-market">
                    <?php include dirname(__FILE__) . '/yandex_money/market.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-update' ? ' active' : ''); ?>" id="tab-update">
                    <?php include dirname(__FILE__) . '/yandex_money/update.tpl'; ?>
                </div>
                <div class="tab-pane<?php echo ($lastActiveTab == 'tab-orders' ? ' active' : ''); ?>" id="tab-orders">
                    <?php include dirname(__FILE__) . '/yandex_money/orders.tpl'; ?>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
jQuery(document).ready(function () {
    var buttons = jQuery('.enable-button');
    buttons.change(function () {
        if (this.checked) {
            for (var i = 0; i < buttons.length; ++i) {
                if (buttons[i] != this) {
                    buttons[i].checked = false;
                }
            }
        }
    });
    var currentTabInput = jQuery('#last-active-tab')[0];
    $('ul.nav-tabs li').on('shown.bs.tab', function (e) {
        currentTabInput.value = e.target.getAttribute('href').substr(1);
    });
});
</script>

<?php echo $footer; ?>