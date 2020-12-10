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
                <a href="<?php echo $update_link; ?>" data-toggle="tooltip" title="<?php echo $language->get('kassa_payments_update_button'); ?>" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                <a href="<?php echo $capture_link; ?>" data-toggle="tooltip" title="<?php echo $language->get('kassa_payments_capture_button'); ?>" class="btn btn-default"><i class="fa fa-check-square-o"></i></a>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $language->get('kassa_payments_page_title') ?></h3>
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <td class="text-center"><?= $language->get('payments_list_header_id')?></td>
                        <td class="text-center"><?= $language->get('payments_list_header_payment_id')?>ID платежа</td>
                        <td class="text-center"><?= $language->get('payments_list_header_sum')?>Сумма</td>
                        <td class="text-center"><?= $language->get('payments_list_header_paid')?>Оплачен</td>
                        <td class="text-center"><?= $language->get('payments_list_header_status')?>Статус</td>
                        <td class="text-center"><?= $language->get('payments_list_header_date_create')?>Дата создания</td>
                        <td class="text-center"><?= $language->get('payments_list_header_date_captured')?>Дата подтверждения</td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($payments as $payment): ?>
                    <tr>
                        <td class="text-center"><?php echo $payment['order_id']; ?></td>
                        <td class="text-left"><?php echo $payment['payment_id']; ?></td>
                        <td class="text-right"><?php echo $payment['amount'] . ' ' . $payment['currency']; ?></td>
                        <td class="text-center"><?php echo $payment['paid'] === 'Y' ? 'да' : 'нет'; ?></td>
                        <td class="text-center"><?php echo $payment['status']; ?></td>
                        <td class="text-center"><?php echo $payment['created_at']; ?></td>
                        <td class="text-center"><?php
                        if ($payment['captured_at'] === '0000-00-00 00:00:00'):
                            echo 'не подтверждён';
                        else:
                            echo $payment['captured_at'];
                        endif;
                        ?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $footer; ?>