<?php foreach ($market_status as $m) { echo $m; } ?>
<div class="panel panel-default">
    <div class="panel-body">
        <div>
            <p><?php echo $language->get('kassa_header_description'); ?></p>
            <p><?php echo $language->get('kassa_version_string'); ?> <?php echo $module_version; ?></p>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_market_shopname"><?php echo $market_s_name; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_market_shopname" value="<?php echo $yandex_money_market_shopname; ?>" id="yandex_money_market_shopname" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $market_prostoy; ?></label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_prostoy ? ' checked="checked"' : ''); ?> name="yandex_money_market_prostoy" value="1"/> <?php echo $active_on; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo (!$yandex_money_market_prostoy ? ' checked="checked"' : ''); ?> name="yandex_money_market_prostoy" value="0"/> <?php echo $active_off; ?></label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4"><?php echo $market_set; ?></label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label for="yandex_money_market_available"><input type="checkbox" <?php echo ($yandex_money_market_available ? ' checked="checked"' : ''); ?> name="yandex_money_market_available" id="yandex_money_market_available" class="" value="1"/> <?php echo $market_set_1; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_combination"><input type="checkbox" <?php echo ($yandex_money_market_combination ? ' checked="checked"' : ''); ?> name="yandex_money_market_combination" id="yandex_money_market_combination" class="" value="1"/> <?php echo $market_set_3; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_features"><input type="checkbox" <?php echo ($yandex_money_market_features ? ' checked="checked"' : ''); ?> name="yandex_money_market_features" id="yandex_money_market_features" class="" value="1"/> <?php echo $market_set_4; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_dimensions"><input type="checkbox" <?php echo ($yandex_money_market_dimensions ? ' checked="checked"' : ''); ?> name="yandex_money_market_dimensions" id="yandex_money_market_dimensions" class="" value="1"/> <?php echo $market_set_5; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_allcurrencies"><input type="checkbox" <?php echo ($yandex_money_market_allcurrencies ? ' checked="checked"' : ''); ?> name="yandex_money_market_allcurrencies" id="yandex_money_market_allcurrencies" class="" value="1"/> <?php echo $market_set_6; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_store"><input type="checkbox" <?php echo ($yandex_money_market_store ? ' checked="checked"' : ''); ?> name="yandex_money_market_store" id="yandex_money_market_store" class="" value="1"/> <?php echo $market_set_7; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_delivery"><input type="checkbox" <?php echo ($yandex_money_market_delivery ? ' checked="checked"' : ''); ?> name="yandex_money_market_delivery" id="yandex_money_market_delivery" class="" value="1"/> <?php echo $market_set_8; ?></label>
                </div>
                <div class="checkbox">
                    <label for="yandex_money_market_pickup"><input type="checkbox" <?php echo ($yandex_money_market_pickup ? ' checked="checked"' : ''); ?> name="yandex_money_market_pickup" id="yandex_money_market_pickup" class="" value="1"/> <?php echo $market_set_9; ?></label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $market_dostup; ?></label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_set_available == 1 ? ' checked="checked"' : ''); ?> name="yandex_money_market_set_available" value="1"/> <?php echo $market_dostup_1; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_set_available == 2 ? ' checked="checked"' : ''); ?> name="yandex_money_market_set_available" value="2"/> <?php echo $market_dostup_2; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_set_available == 3 ? ' checked="checked"' : ''); ?> name="yandex_money_market_set_available" value="3"/> <?php echo $market_dostup_3; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_set_available == 4 ? ' checked="checked"' : ''); ?> name="yandex_money_market_set_available" value="4"/> <?php echo $market_dostup_4; ?></label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for=""><?php echo $language->get('market_product_in_stock_header'); ?></label>
            <div class="col-sm-8">
                <table class="table">
                    <tr>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="yandex_money_market_localcoast"><?php echo $market_d_cost; ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="yandex_money_market_localcoast" value="<?php echo $yandex_money_market_localcoast; ?>"
                                       id="yandex_money_market_localcoast" class="form-control"/>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="yandex_money_market_localdays"><?php echo $market_d_days; ?></label>
                            <div class="col-sm-8">
                                <input type="text" name="yandex_money_market_localdays" value="<?php echo $yandex_money_market_localdays; ?>"
                                       id="yandex_money_market_localdays" class="form-control"/>
                            </div>
                        </div>
                    </tr>
                </table>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_market_localdays"><?php echo $language->get('market_product_in_out_of_stock'); ?></label>
            <div class="col-sm-8">
                <table class="table">
                    <tr>
                        <th><?php echo $language->get('market_product_status_in_stock'); ?></th>
                        <th><?php echo $language->get('market_product_delivery_date'); ?></th>
                        <th><?php echo $language->get('market_product_delivery_cost'); ?></th>
                    </tr>
                    <?php foreach ($stockstatuses as $stock) {?>
                    <tr>
                    <td>
                    <?php echo $stock['name']; ?>
                    </td>
                    <td>
                    <input type="text" name="yandex_money_market_stock_days[<?php echo $stock['id']; ?>]" value="<?php echo empty($yandex_money_market_stock_days) ? '' : $yandex_money_market_stock_days[$stock['id']]; ?>" class="form-control"/>
                    </td>
                    <td>
                    <input type="text" name="yandex_money_market_stock_cost[<?php echo $stock['id']; ?>]" value="<?php echo empty($yandex_money_market_stock_cost) ? '' : $yandex_money_market_stock_cost[$stock['id']]; ?>" class="form-control"/>
                    </td>
                    </tr>
                    <?php } ?>
                </table>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $market_color_option; ?></label>
            <div class="col-sm-8">
                <div class="scrollbox" style="height: 100px; overflow-x: auto; width: 100%;">
                    <?php $class = 'odd'; ?>
                    <?php foreach ($options as $option) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div class="<?php echo $class; ?>">
                        <?php if (!empty($yandex_money_market_color_options) && in_array($option['option_id'], $yandex_money_market_color_options)) { ?>
                        <input type="checkbox" name="yandex_money_market_color_options[]" value="<?php echo $option['option_id']; ?>" checked="checked" />
                        <?php echo $option['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="yandex_money_market_color_options[]" value="<?php echo $option['option_id']; ?>" />
                        <?php echo $option['name']; ?>
                        <?php } ?>
                    </div>
                    <?php } ?>
                </div>
                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $market_size_option; ?><br/><?php echo $market_size_unit; ?></label>
            <div class="col-sm-8">
                <div class="scrollbox" style="height: 160px; overflow-x: auto; width: 100%;">
                    <?php $class = 'odd'; ?>
                    <?php foreach ($options as $option) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div class="<?php echo $class; ?>">
                        <?php if (!empty($yandex_money_market_size_options) && in_array($option['option_id'], $yandex_money_market_size_options)) { ?>
                        <input type="checkbox" name="yandex_money_market_size_options[]" value="<?php echo $option['option_id']; ?>" checked="checked" />
                        <?php echo $option['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="yandex_money_market_size_options[]" value="<?php echo $option['option_id']; ?>" />
                        <?php echo $option['name']; ?>
                        <?php } ?>
                    </div>
                    <?php } ?>
                </div>
                <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $market_out; ?></label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" <?php echo ($yandex_money_market_catall ? ' checked="checked"' : ''); ?> name="yandex_money_market_catall" value="1"/> <?php echo $market_out_all; ?></label>
                <label class="radio-inline">
                    <input type="radio" <?php echo (!$yandex_money_market_catall ? 'checked="checked"' : ''); ?> name="yandex_money_market_catall" value="0"/> <?php echo $market_out_sel; ?></label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4"><?php echo $market_cat; ?></label>
            <div class="col-sm-8">
                <div class="panel panel-default">
                    <div class="tree-panel-heading tree-panel-heading-controls clearfix">
                        <div class="tree-actions pull-right">
                            <a onclick="hidecatall($('#categoryBox')); return false;" id="collapse-all-categoryBox" class="btn btn-default">
                                <i class="icon-collapse-alt"></i><?php echo $market_sv_all; ?>
                            </a>
                            <a onclick="showcatall($('#categoryBox')); return false;" id="expand-all-categoryBox" class="btn btn-default">
                                <i class="icon-expand-alt"></i><?php echo $market_rv_all; ?>
                            </a>
                            <a onclick="checkAllAssociatedCategories($('#categoryBox')); return false;" id="check-all-categoryBox" class="btn btn-default">
                                <i class="icon-check-sign"></i><?php echo $market_ch_all; ?>
                            </a>
                            <a onclick="uncheckAllAssociatedCategories($('#categoryBox')); return false;" id="uncheck-all-categoryBox" class="btn btn-default">
                                <i class="icon-check-empty"></i><?php echo $market_unch_all; ?>
                            </a>
                        </div>
                    </div>
                    <ul id="categoryBox" class="tree">
                        <?php echo $market_cat_tree; ?>
                    </ul>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="yandex_money_market_dynamic"><?php echo $market_lnk_yml; ?></label>
            <div class="col-sm-8">
                <input type="text" name="yandex_money_market_dynamic" value="<?php echo $yandex_money_market_lnk_yml; ?>" id="yandex_money_market_dynamic" disabled="disabled" class="form-control"/>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function showcatall($tree) {
        $tree.find("ul.tree").each(function() {
            $(this).slideDown();
        });
    }

    function hidecatall($tree) {
        $tree.find("ul.tree").each(function() {
            $(this).slideUp();
        });
    }
    function checkAllAssociatedCategories($tree) {
        $tree.find(":input[type=checkbox]").each(function() {
            $(this).prop("checked", true);
            $(this).parent().addClass("tree-selected");
        });
    }

    function uncheckAllAssociatedCategories($tree) {
        $tree.find(":input[type=checkbox]").each(function() {
            $(this).prop("checked", false);
            $(this).parent().removeClass("tree-selected");
        });
    }
</script>