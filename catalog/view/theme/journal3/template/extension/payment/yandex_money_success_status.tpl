<?php

echo $header;
echo $column_left;
echo $column_right;

?>
<div class="container">
    <?php echo $content_top; ?>

    <p><a href="<?php echo $orderLink; ?>"><?= sprintf($language->get('text_success_status'),$orderId);?></p>

    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
