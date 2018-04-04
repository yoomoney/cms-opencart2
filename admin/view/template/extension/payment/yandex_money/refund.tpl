<?php

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
            <h1><?= $language->get('refunds_title')?>ы</h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) : ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if (!empty($error)) : ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif; ?>

        <ul class="nav nav-tabs">
            <li<?php echo $refundable_amount > 0 ? ' class="active"' : ''; ?>><a href="#tab-refund" data-toggle="tab"><?= $language->get('refunds_new')?></a></li>
            <li<?php echo $refundable_amount > 0 ? '' : ' class="active"'; ?>><a href="#tab-refunds" data-toggle="tab"><?= $language->get('refunds_history')?></a></li>
        </ul>

        <div class="tab-content bootstrap">
            <div class="tab-pane<?php echo $refundable_amount > 0 ? ' active' : ''; ?>" id="tab-refund">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?= $language->get('refunds_new')?></h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <h3><?= $language->get('refunds_payment_data')?></h3>

                            <table class="table table-striped table-condensed">
                                <tbody>
                                <tr>
                                    <th><?= $language->get('refunds_payment_id')?></th>
                                    <td><?php echo $payment->getId(); ?></td>
                                </tr>
                                <tr>
                                    <th><?= $language->get('refunds_order_id')?></th>
                                    <td><?php echo $order['order_id']; ?></td>
                                </tr>
                                <tr>
                                    <th><?= $language->get('refunds_payment_method')?></th>
                                    <td><?php echo $paymentMethod; ?></td>
                                </tr>
                                <tr>
                                    <th><?= $language->get('refunds_payment_sum')?></th>
                                    <td><?php echo $payment->getAmount()->getValue() . ' ' . $payment->getAmount()->getCurrency(); ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div>
                            <h3><?= $language->get('refunds_refund_data')?></h3>
                        </div>

                        <?php if ($refundable_amount > 0) : ?>
                        <form action="" method="post" id="refund-form">
                        <?php endif; ?>
                            <div class="form-group row">
                                <label class="col-sm-2 control-label" for="kassa-refund-amount"><?= $language->get('refunds_refund_sum')?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="kassa_refund_amount_src" value="<?php echo $refundable_amount; ?>" id="kassa-refund-amount" class="form-control" disabled />
                                    <input type="hidden" name="kassa_refund_amount" value="<?php echo $refundable_amount; ?>" />
                                    <?php if (!empty($errors['kassa_refund_amount'])) : ?>
                                    <p class="text-danger"><?php echo $errors['kassa_refund_amount']; ?></p>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <?php if ($refundable_amount > 0) : ?>
                            <div class="form-group row">
                                <label class="col-sm-2 control-label" for="kassa-refund-comment"><?= $language->get('refunds_refund_cause')?></label>
                                <div class="col-sm-10">
                                    <textarea name="kassa_refund_comment" id="kassa-refund-comment" class="form-control"><?php echo $comment; ?></textarea>
                                    <?php if (!empty($errors['kassa_refund_comment'])) : ?>
                                    <p class="text-danger"><?php echo $errors['kassa_refund_comment']; ?></p>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="button-group buttons">
                                <button class="btn btn-default" id="refund-button"><?= $language->get('refunds_refund_create')?></button>
                            </div>
                        </form>
                        <?php endif; ?>
                    </div>

                </div>
            </div>
            <div class="tab-pane<?php echo $refundable_amount > 0 ? '' : ' active'; ?>" id="tab-refunds">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?= $language->get('refunds_history')?></h3>
                    </div>
                    <div class="panel-body">
                        <?php if (empty($refunds)) : ?>
                        <p><?= sprintf($language->get('refunds_history_empty'),$order['order_id']); ?></p>
                        <?php else: ?>
                        <table class="table table-striped table-responsive">
                            <thead>
                            <tr>
                                <th><?= $language->get('refunds_header_id')?></th>
                                <th><?= $language->get('refunds_header_status')?></th>
                                <th><?= $language->get('refunds_header_date_create')?></th>
                                <th><?= $language->get('refunds_header_date_refund')?></th>
                                <th><?= $language->get('refunds_header_sum')?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($refunds as $refund) : ?>
                            <tr>
                                <td><?php echo $refund['refund_id']; ?></td>
                                <td><?php echo $language->get('kassa_refund_status_' . $refund['status'] . '_label'); ?></td>
                                <td><?php echo $refund['created_at']; ?></td>
                                <td><?php echo $refund['authorized_at']; ?></td>
                                <td><?php echo $refund['amount'] . ' ' . $refund['currency']; ?></td>
                            </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#refund-button').click(function () {
            jQuery('#refund-form').submit();
        });
    });
</script>
<?php echo $footer; ?>