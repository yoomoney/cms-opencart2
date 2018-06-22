<?php foreach ($metrika_status as $me) { echo $me; } ?>
<div class="panel panel-default">
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('kassa_header_description'); ?></p>
            <p><?php echo $language->get('kassa_version_string'); ?> <?php echo $module_version; ?></p>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $active; ?></label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_metrika_active ? ' checked="checked"' : ''); ?> name="yandex_money_metrika_active" value="1"/> <?php echo $active_on; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo (!$yandex_money_metrika_active ? ' checked="checked"' : ''); ?> name="yandex_money_metrika_active" value="0"/> <?php echo $active_off; ?></label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_metrika_number"><?php echo $metrika_number; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_metrika_number" value="<?php echo $yandex_money_metrika_number; ?>" id="yandex_money_metrika_number" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_metrika_idapp"><?php echo $metrika_idapp; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_metrika_idapp" value="<?php echo $yandex_money_metrika_idapp; ?>" id="yandex_money_metrika_idapp" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_metrika_pw"><?php echo $metrika_pw; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_metrika_pw" value="<?php echo $yandex_money_metrika_pw; ?>" id="yandex_money_metrika_pw" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_metrika_callback"><?php echo $metrika_callback; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_metrika_callback" disabled="disabled" value="<?php echo $yandex_money_metrika_callback; ?>" id="yandex_money_metrika_callback" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4"><?php echo $metrika_set; ?></label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label for="yandex_money_metrika_webvizor"><input type="checkbox" <?php echo ($yandex_money_metrika_webvizor ? ' checked="checked"' : ''); ?> name="yandex_money_metrika_webvizor" id="yandex_money_metrika_webvizor" class="" value="1"/> <?php echo $metrika_set_1; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_metrika_clickmap"><input type="checkbox" <?php echo ($yandex_money_metrika_clickmap ? ' checked="checked"' : ''); ?> name="yandex_money_metrika_clickmap" id="yandex_money_metrika_clickmap" class="" value="1"/> <?php echo $metrika_set_2; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_metrika_hash"><input type="checkbox" <?php echo ($yandex_money_metrika_hash ? ' checked="checked"' : ''); ?> name="yandex_money_metrika_hash" id="yandex_money_metrika_hash" class="" value="1"/> <?php echo $metrika_set_5; ?></label>
                </div>
            </div>
        </div>
    </div>
</div>