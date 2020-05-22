<?php

/**
 * @var \YandexMoneyModule\Model\WalletModel $wallet
 */
?>

<?php if ($fullView) : ?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div class="container">
    <?php echo $content_top; ?>
    <?php endif; ?>

    <style>

    input[name="paymentType"] {
        margin:0px !important;
        position:relative !important;
    }
    input[name="payment-type"] {
        margin:0px !important;
        position:relative !important;
    }

    </style>
    <form action="<?php echo $action; ?>" id="paymentForm" method="POST">
        <h3><?php echo $wallet->getDisplayName(); ?></h3>
        <table class="radio">
            <tbody>
            <tr class="highlight">
                <td><input type="radio" name="paymentType" value="PC" checked id="ym1"></td>
                <td><label for="ym1"><?php echo $language->get('text_method_yandex_money'); ?></label></td>
            </tr>
            <tr class="highlight">
                <td><input type="radio" name="paymentType" value="AC" id="ym2"></td>
                <td><label for="ym2"><?php echo $language->get('text_method_bank_card'); ?></label></td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="receiver" value="<?php echo $wallet->getAccountId(); ?>">
        <input type="hidden" name="formcomment" value="">
        <input type="hidden" name="short-dest" value="">
        <input type="hidden" name="comment-needed" value="false">
        <input type="hidden" name="label" value="<?php echo $orderId;?>">
        <input type="hidden" name="successURL" value="<?php echo $successUrl; ?>" >
        <input type="hidden" name="quickpay-form" value="shop">
        <input type="hidden" name="targets" value="<?php echo $orderText;?> <?php echo $orderId;?>">
        <input type="hidden" name="sum" value="<?php echo $amount; ?>" data-type="number" >
        <input type="hidden" name="comment" value="<?php echo $comment; ?>" >
        <input type="hidden" name="need-fio" value="false">
        <input type="hidden" name="need-email" value="false" >
        <input type="hidden" name="need-phone" value="false">
        <input type="hidden" name="need-address" value="false">
    </form>
    <div class="buttons">
        <div class="pull-right">
            <input type="button" id="button-confirm" value="<?php echo $language->get('text_continue'); ?>" class="btn btn-primary" />
        </div>
    </div>
    <script type="text/javascript"><!--
    jQuery('#button-confirm').on('click', function(e) {
        $.ajax({
            type: 'get',
            url: '<?php echo $validate_url; ?>',
            data: {
                payment_type: jQuery('#paymentForm')[0]['paymentType'].value
            },
            cache: false,
            success: function() {
                jQuery('#paymentForm').submit();
            }
        });
    });
    //--></script>

    <?php if ($fullView) : ?>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
<?php endif; ?>