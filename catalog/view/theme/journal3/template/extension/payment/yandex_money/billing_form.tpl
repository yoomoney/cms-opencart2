<?php

/**
 * @var \YandexMoneyModule\Model\BillingModel $billing
 */
?>

<?php if ($fullView) : ?>
<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div class="container">
    <?php echo $content_top; ?>
    <?php endif; ?>
    <form action="<?php echo $action; ?>" id="paymentForm" method="POST">
        <input type="hidden" name="formId" value="<?php echo $billing->getFormId();?>" />
        <input type="hidden" name="narrative" value="<?php echo $purpose; ?>" />
        <input type="hidden" name="quickPayVersion" value="2">
        <div class="form-group required" id="fast-pay-fio-wrapper">
            <label class="control-label" for="fio"><?php echo $language->get('fast_pay_fio_label'); ?></label>
            <input type="text" name="fio" id='fast-pay-fio' value="<?php echo $customerName; ?>" />
            <div class="text-danger"></div>
        </div>
        <input type="hidden" name="sum" value="<?php echo $amount; ?>" />
    </form>
    <div class="buttons">
        <div class="pull-right">
            <input type="button" id="button-confirm" value="<?php echo $language->get('text_continue'); ?>" class="btn btn-primary" />
        </div>
    </div>

    <script type="text/javascript"><!--
    jQuery('#button-confirm').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var fioValue = jQuery('#fast-pay-fio').val(),
        wrapper = jQuery('#fast-pay-fio-wrapper');

        if (fioValue.match(/^[A-Яа-яA-Za-z]+\s[A-Яа-яA-Za-z]+\s[A-Яа-яA-Za-z]+$/) == null) {
            wrapper.addClass('has-error');
            wrapper.find('.text-danger').html('Введите верное Ф.И.О.').show();
        } else {
            wrapper.removeClass('has-error');
            wrapper.find('.text-danger').html('').hide();
            $.ajax({
                type: 'get',
                url: '<?php echo $validate_url; ?>',
                data: {
                    payMethod: 'fast_pay'
                },
                cache: false,
                success: function() {
                    jQuery('#paymentForm').submit();
                }
            });
        }
    });
    //--></script>

    <?php if ($fullView) : ?>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
<?php endif; ?>