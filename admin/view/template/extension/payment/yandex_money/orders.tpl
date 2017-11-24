<?php foreach ($pokupki_status as $po) { echo $po; } ?>
<div class="panel panel-default">
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('kassa_header_description'); ?></p>
            <p><?php echo $language->get('kassa_version_string'); ?> <?php echo $module_version; ?></p>
        </div>
        <input type="hidden" name="yandex_money_pokupki_yapi" value="https://api.partner.market.yandex.ru/v2/" id="yandex_money_pokupki_yapi"/>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_stoken"><?php echo $pokupki_stoken; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_stoken" value="<?php echo $yandex_money_pokupki_stoken; ?>" id="yandex_money_pokupki_stoken" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_number"><?php echo $pokupki_number; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_number" value="<?php echo $yandex_money_pokupki_number; ?>" id="yandex_money_pokupki_number" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_idapp"><?php echo $pokupki_idapp; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_idapp" value="<?php echo $yandex_money_pokupki_idapp; ?>" id="yandex_money_pokupki_idapp" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_pw"><?php echo $pokupki_pw; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_pw" value="<?php echo $yandex_money_pokupki_pw; ?>" id="yandex_money_pokupki_pw" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_callback"><?php echo $pokupki_callback; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_callback" disabled="disabled" value="<?php echo $yandex_money_pokupki_callback; ?>" id="yandex_money_pokupki_callback" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_idpickup"><?php echo $pokupki_idpickup; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_pokupki_idpickup" value="<?php echo $yandex_money_pokupki_idpickup; ?>" id="yandex_money_pokupki_idpickup" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_pokupki_sapi"><?php echo $pokupki_sapi; ?></label>
            <div class="col-sm-8">
                <input type="text" disabled="disabled" name="yandex_money_pokupki_sapi" value="<?php echo $yandex_money_pokupki_sapi; ?>" id="yandex_money_pokupki_sapi" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4"><?php echo $pokupki_method; ?></label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label for="yandex_money_pokupki_yandex"><input type="checkbox" <?php echo ($yandex_money_pokupki_yandex ? ' checked="checked"' : ''); ?> name="yandex_money_pokupki_yandex" id="yandex_money_pokupki_yandex" class="" value="1"/> <?php echo $pokupki_set_1; ?></label>
                </div>
                <!--<div class="checkbox">
                    <label for="yandex_money_pokupki_sprepaid"><input type="checkbox" <?php echo ($yandex_money_pokupki_sprepaid ? ' checked="checked"' : ''); ?> name="yandex_money_pokupki_sprepaid" id="yandex_money_pokupki_sprepaid" class="" value="1"/> <?php echo $pokupki_set_2; ?></label>
                </div>-->
                <div class="checkbox">
                    <label for="yandex_money_pokupki_cash"><input type="checkbox" <?php echo ($yandex_money_pokupki_cash ? ' checked="checked"' : ''); ?> name="yandex_money_pokupki_cash" id="yandex_money_pokupki_cash" class="" value="1"/> <?php echo $pokupki_set_3; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_pokupki_bank"><input type="checkbox" <?php echo ($yandex_money_pokupki_bank ? ' checked="checked"' : ''); ?> name="yandex_money_pokupki_bank" id="yandex_money_pokupki_bank" class="" value="1"/> <?php echo $pokupki_set_4; ?></label>
                </div>
            </div>
        </div>
        <!-- -->
        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-4 control-label"><?php echo $pokupki_text_status; ?></label>
                <div class="col-sm-8">
                    <?php foreach(array('pickup','cancelled','delivery','processing','unpaid','delivered') as $val){?>
                    <div class="">
                    <label class="control-label col-sm-5"><?php echo ${'pokupki_text_status_'.$val}; ?></label>
                    <div class='col-sm-7'>
                    <select name="yandex_money_pokupki_status_<?php echo $val; ?>" id="yandex_money_pokupki_status_<?php echo $val; ?>" class="form-control">
                    <?php foreach ($orderStatuses as $id => $order_status) { ?>
                    <?php if ($id == ${'yandex_money_pokupki_status_'.$val}) { ?>
                    <option value="<?php echo $id; ?>" selected="selected"><?php echo $order_status; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $id; ?>"><?php echo $order_status; ?></option>
                    <?php } ?>
                    <?php } ?>
                    </select>
                </div>
            </div>
            <?php }?>
        </div>
    </div>
</div>
<!-- -->
<div class="form-group">
    <label class="col-sm-4 control-label" for="yandex_money_pokupki_token"><?php echo $pokupki_token; ?></label>
    <div class="col-sm-8">
        <input type="text" name="yandex_money_pokupki_token" value="<?php echo $yandex_money_pokupki_gtoken; ?>" id="yandex_money_pokupki_token" disabled="disabled" class="form-control"/>
        <p class="help-block">
            <a href="<?php echo $yandex_money_pokupki_callback_url; ?>"><?php echo $pokupki_gtoken; ?></a>
        </p>
    </div>
</div>
<?php echo $data_carrier ?>