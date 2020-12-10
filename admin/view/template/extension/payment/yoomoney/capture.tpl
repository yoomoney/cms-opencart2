<?php

echo $header;
echo $column_left;

?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-payment-yoomoney" data-toggle="tooltip"
                        title="<?php echo $language->get('button_save'); ?>" class="btn btn-primary"><i
                            class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip"
                   title="<?php echo $language->get('button_cancel'); ?>" class="btn btn-default"><i
                            class="fa fa-reply"></i></a>
            </div>
            <h1><?= $language->get('captures_title')?></h1>
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

        <?php if(!empty($success)):?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif;?>

        <div class="tab-content bootstrap">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><?= $language->get('captures_new')?></h3>
                </div>
                <div class="panel-body">
                    <div>
                        <h3><?= $language->get('captures_payment_data')?></h3>

                        <table class="table table-striped table-condensed">
                            <tbody>
                            <tr>
                                <th><?= $language->get('captures_payment_id')?></th>
                                <td><?php echo $payment->getId(); ?></td>
                            </tr>
                            <tr>
                                <th><?= $language->get('captures_order_id')?></th>
                                <td><?php echo $order['order_id']; ?></td>
                            </tr>
                            <tr>
                                <th><?= $language->get('captures_payment_method')?></th>
                                <td><?php echo $paymentMethod; ?></td>
                            </tr>
                            <tr>
                                <th><?= $language->get('captures_expires_date')?></th>
                                <td>
                                    <?php if($payment->getExpiresAt()):?>
                                    <?php echo $payment->getExpiresAt()->format('Y-m-d H:i');?>
                                    <?php endif;?>
                                </td>
                            </tr>
                            <tr>
                                <th><?= $language->get('captures_payment_sum')?></th>
                                <td><?php echo $payment->getAmount()->getValue() . ' ' .
                                    $payment->getAmount()->getCurrency(); ?>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div>
                        <h3><?= $language->get('captures_capture_data')?></h3>
                    </div>

                    <form action="" method="post" id="capture-form">
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $language->get('column_product'); ?></td>
                                        <td class="text-right"><?php echo $language->get('column_quantity'); ?></td>
                                        <td class="text-right"><?php echo $language->get('column_price'); ?></td>
                                        <td class="text-right"><?php echo $language->get('column_total'); ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td class="text-left">
                                            <?php echo $product['name']; ?>
                                        </td>
                                        <td class="text-right">
                                            <input type="number"
                                                   name="quantity[<?= $product['product_id']; ?>]"
                                                   value="<?= $product['quantity']; ?>"
                                                   min="0"
                                                   max="<?= $product['quantity']; ?>"
                                                   size="4"
                                                   style="text-align: right"
                                                   class="product-quantity"
                                            <?= $paymentCaptured ? ' readonly="readonly"' : ''; ?>
                                            data-total-element-id="product-total-<?= $product['product_id']; ?>"
                                            data-price="<?= $product['price']; ?>"
                                            data-total="<?= $product['total']; ?>"
                                            data-delta="0"
                                            readonly="readonly"
                                            >
                                        </td>
                                        <td class="text-right"><?php echo $product['price']; ?></td>
                                        <td class="text-right"><?php echo $product['total']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    <?php foreach ($vouchers as $voucher) { ?>
                                    <tr>
                                        <td class="text-left"><a
                                                    href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a>
                                        </td>
                                        <td class="text-left"></td>
                                        <td class="text-right">1</td>
                                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    <?php foreach ($totals as $total) { ?>
                                    <tr>
                                        <td colspan="3" class="text-right"><?php echo $total['title']; ?></td>
                                        <td class="text-right"><?php echo $total['text']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                </div>

                <div class="form-group row">
                    <label class="col-sm-2 control-label" for="kassa-capture-amount"><?= $language->
                        get('captures_capture_sum')?></label>
                    <div class="col-sm-10">
                        <input type="text" name="kassa_capture_amount_src"
                               value="<?php echo $capture_amount; ?>" id="kassa-capture-amount"
                               class="form-control" disabled/>
                        <input type="hidden" name="kassa_capture_amount"
                               value="<?php echo empty($captureable_amount)?:$captureable_amount; ?>"/>
                        <?php if (!empty($errors['kassa_capture_amount'])) : ?>
                        <p class="text-danger"><?php echo $errors['kassa_capture_amount']; ?></p>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="button-group buttons">
                    <button class="btn btn-default" id="capture-button" name="action" value="capture"
                    <?php echo $paymentCaptured ? "disabled":"";?>>
                    <?= $language->get('captures_capture_create')?>
                    </button>
                    <button class="btn btn-default" id="capture-button" name="action" style="float: right"
                            value="cancel"
                    <?php echo $paymentCaptured ? "disabled":"";?>>
                    <?= $language->get('cancel_payment_button')?>
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#capture-button').click(function () {
            jQuery('#capture-form').submit();
        });
    });
</script>
<?php echo $footer; ?>