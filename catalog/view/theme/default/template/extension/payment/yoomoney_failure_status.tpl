<?php

echo $header;
echo $column_left;
echo $column_right;

?>
<div class="container">
    <?php echo $content_top; ?>

    <p><?= $language->get('text_failure_status')?></p>

    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>
