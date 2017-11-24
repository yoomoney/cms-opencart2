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
            <h1>Возвраты</h1>
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
            <li<?php echo $refundable_amount > 0 ? ' class="active"' : ''; ?>><a href="#tab-refund" data-toggle="tab">Новый возврат</a></li>
            <li<?php echo $refundable_amount > 0 ? '' : ' class="active"'; ?>><a href="#tab-refunds" data-toggle="tab">История возвратов</a></li>
        </ul>

        <div class="tab-content bootstrap">
            <div class="tab-pane<?php echo $refundable_amount > 0 ? ' active' : ''; ?>" id="tab-refund">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Новый возврат</h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <h3>Данные платежа</h3>

                            <table class="table table-striped table-condensed">
                                <tbody>
                                <tr>
                                    <th>Номер транзакции в Яндекс.Кассе</th>
                                    <td><?php echo $payment->getId(); ?></td>
                                </tr>
                                <tr>
                                    <th>Номер заказа</th>
                                    <td><?php echo $order['order_id']; ?></td>
                                </tr>
                                <tr>
                                    <th>Способ оплаты</th>
                                    <td><?php echo $paymentMethod; ?></td>
                                </tr>
                                <tr>
                                    <th>Сумма платежа</th>
                                    <td><?php echo $payment->getAmount()->getValue() . ' ' . $payment->getAmount()->getCurrency(); ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div>
                            <h3>Данные возврата</h3>
                        </div>

                        <?php if ($refundable_amount > 0) : ?>
                        <form action="" method="post" id="refund-form">
                        <?php endif; ?>
                            <div class="form-group row">
                                <label class="col-sm-2 control-label" for="kassa-refund-amount">Сумма возврата</label>
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
                                <label class="col-sm-2 control-label" for="kassa-refund-comment">Причина возврата</label>
                                <div class="col-sm-10">
                                    <textarea name="kassa_refund_comment" id="kassa-refund-comment" class="form-control"><?php echo $comment; ?></textarea>
                                    <?php if (!empty($errors['kassa_refund_comment'])) : ?>
                                    <p class="text-danger"><?php echo $errors['kassa_refund_comment']; ?></p>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="button-group buttons">
                                <button class="btn btn-default" id="refund-button">Создать возврат</button>
                            </div>
                        </form>
                        <?php endif; ?>
                    </div>

                </div>
            </div>
            <div class="tab-pane<?php echo $refundable_amount > 0 ? '' : ' active'; ?>" id="tab-refunds">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">История возвратов</h3>
                    </div>
                    <div class="panel-body">
                        <?php if (empty($refunds)) : ?>
                        <p>Для заказа №<?php echo $order['order_id']; ?> возвраты не проводились.</p>
                        <?php else: ?>
                        <table class="table table-striped table-responsive">
                            <thead>
                            <tr>
                                <th>ID возврата</th>
                                <th>Статус</th>
                                <th>Дата создания</th>
                                <th>Дата проведения</th>
                                <th>Сумма</th>
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