<div role="tabpanel" class="tab-pane" id="updater">
    <div class='row'>
        <div class='col-md-12'>
            <?= $language->get('updater_header_text')?>
        </div>
    </div>
    <div class='row'>
        <div class='col-md-12'>
            <h4><?= $language->get('updater_about_title')?>:</h4>
            <ul>
                <li><?= $language->get('updater_current_version')?>: <?php echo $currentVersion; ?></li>
                <li><?= $language->get('updater_last_version')?>: <?php echo $newVersion; ?></li>
                <li>
                    <?= $language->get('updater_last_check_date')?>: <?php echo $newVersionInfo['date'] ?>
                    <?php if (time() - $newVersionInfo['time'] > 300) : ?>
                    <button type="button" class="btn btn-success btn-xs" id="force-check"><?= $language->get('updater_check_updates')?>
                    </button>
                    <?php endif; ?>
                </li>
            </ul>

            <?php if ($new_version_available) : ?>

            <h4><?= $language->get('updater_history_title')?></h4>
            <p><?php echo $changelog; ?></p>

                <form method="post" id="update-form" action="<?php echo $update_action; ?>&type=update">
                    <input name="update" value="1" type="hidden"/>
                    <input name="version" value="<?php echo htmlspecialchars($newVersion) ?>" type="hidden"/>
                </form>

                <button type="button" id="update-module" class="btn btn-primary"><?= $language->get('updater_update')?></button>

                <form method="post" id="update-form" action="<?php echo $update_action; ?>&type=update">
                    <input name="update" value="1" type="hidden"/>
                    <input name="version" value="<?php echo htmlspecialchars($newVersion) ?>" type="hidden"/>
                </form>

            <?php else: ?>
            <p><?= $language->get('updater_last_version_installed')?></p>
            <?php endif; ?>

            <form method="post" id="check-version" action="<?php echo $update_action; ?>&type=check">
                <input name="force" value="1" type="hidden"/>
            </form>

        </div>
    </div>

    <?php if (!empty($backups)) : ?>
    <div class="row">
        <h4><?= $language->get('updater_backups_title')?></h4>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><?= $language->get('updater_module_version')?></th>
                <th><?= $language->get('updater_date_create')?></th>
                <th><?= $language->get('updater_file_name')?></th>
                <th><?= $language->get('updater_file_size')?></th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($backups as $backup) : ?>
            <tr>
                <td><?php echo $backup['version'] ?></td>
                <td><?php echo $backup['date'] ?></td>
                <td><?php echo $backup['name'] ?></td>
                <td><?php echo $backup['size'] ?></td>
                <td class="text-right">
                    <button type="button" class="btn btn-success btn-xs restore-backup"
                            data-id="<?php echo $backup['name'] ?>" data-version="<?php echo $backup['version'] ?>"
                            data-date="<?php echo $backup['date'] ?>"><?= $language->get('updater_restore')?>
                    </button>
                    <button type="button" class="btn btn-danger btn-xs remove-backup"
                            data-id="<?php echo $backup['name'] ?>" data-version="<?php echo $backup['version'] ?>"
                            data-date="<?php echo $backup['date'] ?>"><?= $language->get('Удалить')?>
                    </button>
                </td>
            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>

        <form id="action-form" method="post" action="<?php echo $backup_action; ?>">
            <input type="hidden" name="action" id="action-form-action" value="none"/>
            <input type="hidden" name="file_name" id="action-form-file-name" value=""/>
            <input type="hidden" name="version" id="action-form-version" value=""/>
        </form>

    </div>
    <?php endif; ?>

</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('button.restore-backup').click(function () {
            var message = '<?= $language->get("updater_restore_message")?>' + this.dataset.version
                + ' от ' + this.dataset.date + '?';
            if (confirm(message)) {
                jQuery('#action-form-action').val('restore');
                jQuery('#action-form-file-name').val(this.dataset.id);
                jQuery('#action-form-version').val(this.dataset.version);
                jQuery('#action-form').submit();
            }
        });
        jQuery('button.remove-backup').click(function () {
            var message = '<?= $language->get("updater_delete_message")?> ' + this.dataset.version
                + ' от ' + this.dataset.date + '?';
            if (confirm(message)) {
                jQuery('#action-form-action').val('remove');
                jQuery('#action-form-file-name').val(this.dataset.id);
                jQuery('#action-form-version').val(this.dataset.version);
                jQuery('#action-form').submit();
            }
        });
        jQuery('#force-check').click(function () {
            jQuery('#check-version')[0].submit();
        });
        <?php if ($new_version_available):?>
        jQuery('#update-module').click(function () {
            jQuery('#update-form')[0].submit();
        });
        <?php endif;?>
    });
</script>
