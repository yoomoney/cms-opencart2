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
                <button type="submit" form="form-payment-yoomoney" data-toggle="tooltip" title="<?php echo $language->get('button_save'); ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4><?= $language->get('log_title');?></h4>
            </div>
            <div class="panel-body">
                <form action="" method="post" id="log-form">
                    <input type="hidden" name="clear-logs" value="0" />
                    <input type="hidden" name="download" value="0" />
                    <div class="buttons">
                        <button type="button" class="btn btn-primary" data-value="download"><?= $language->get('log_download');?></button>
                        <button type="button" class="btn btn-danger" data-value="clear-logs"><?= $language->get('log_clear');?></button>
                    </div>
                </form>
                <?php if (empty($logs)): ?>
                <p><?= $language->get('log_empty');?></p>
                <?php else: ?>
                <pre style="margin-top: 10px; font-size: 9pt;"><?php echo $logs; ?></pre>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        var form = jQuery('#log-form');
        form.find('button').bind('click', function () {
            form[0][this.dataset.value].value = 1;
            if (this.dataset.value == 'download') {
                form[0].target = '_blank';
            } else {
                form[0].target = '_self';
            }
            form[0].submit();
        });
    });
</script>
<?php echo $footer; ?>