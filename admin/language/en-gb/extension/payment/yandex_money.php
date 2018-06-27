<?php

$_['module_title']             = 'Y.CMS 2.0';
$_['heading_title']            = $_['module_title'];
$_['text_yandex_money']        = '<a target="_blank" href="https://kassa.yandex.ru"><img src="../image/payment/yandex_money/yandex_money_logo.png" alt="Y.CMS 2.0 from Yandex.Checkout" /></a>';
$_['kassa_header_description'] = 'By operating the module, you accept its <a href="https://money.yandex.ru/doc.xml?id=527132">terms of use</a>.';
$_['kassa_version_string']     = 'Module version';

$_['kassa_breadcrumbs_extension']     = 'Extensions';
$_['kassa_breadcrumbs_home']          = 'Home';
$_['kassa_breadcrumbs_logs']          = 'Logs';
$_['kassa_text_success']              = 'Success';
$_['kassa_text_success_message']      = 'The settings have been saved';
$_['kassa_page_title']                = 'Yandex.Checkout settings';
$_['kassa_breadcrumbs_heading_title'] = 'Yandex.Checkout payment module\'s logs';
$_['kassa_test_mode_description']     = 'You have enabled the test mode. Check the payment making process and contact Yandex.Checkout\'s manager. They will provide you with shopId the Secret key. <a href="https://yandex.ru/support/checkout/payments/api.html#api__04" target="_blank">Manual</a>';

$_['kassa_enable_label'] = 'Enable payment acceptance via Yandex.Checkout';

$_['kassa_shop_id_label']             = 'shopId';
$_['kassa_shop_id_description']       = 'Copy your shopId from your Yandex.Checkout\'s Merchant Profile';
$_['kassa_shop_id_error_required']    = 'Specify the shopId from your Yandex.Checkout\'s Merchant Profile';
$_['kassa_error_invalid_credentials'] = 'Check shopId and Secret key—there is an error somewhere. Better yet, copy them directly from your <a href="https://kassa.yandex.ru/my" target="_blank">Yandex.Checkout\'s Merchant Profile</a>';

$_['kassa_password_label']          = 'Secret key';
$_['kassa_password_description']    = 'Issue and activate a secret key under your Yandex.Checkout\'s Merchant Profile. Then copy it here.';
$_['kassa_password_error_required'] = 'You are required to specify the secret key from your Yandex.Checkout\'s Merchant Profile';

$_['kassa_payment_mode_label']            = 'Select payment method';
$_['kassa_payment_mode_kassa_label']      = 'On Yandex.Checkout\'s site';
$_['kassa_use_yandex_button_label']       = 'Use a button with \'Pay with Yandex\' text';
$_['kassa_use_installments_button_label'] = 'Add the Installments payment method to checkout page';
$_['kassa_payment_mode_shop_label']       = 'On the store\'s site';

$_['kassa_payment_method_bank_card']    = 'Bank cards';
$_['kassa_payment_method_sberbank']     = 'Sberbank Online';
$_['kassa_payment_method_cash']         = 'Cash via payment kiosks';
$_['kassa_payment_method_qiwi']         = 'QIWI Wallet';
$_['kassa_payment_method_alfabank']     = 'Alfa-Click';
$_['kassa_payment_method_webmoney']     = 'Webmoney';
$_['kassa_payment_method_yandex_money'] = 'Yandex.Money';
$_['kassa_payment_method_mobile']       = 'Direct carrier billing';
$_['kassa_payment_method_installments'] = 'Installments';

$_['kassa_payment_method_error_required'] = 'Please select at least one option from the list';

$_['kassa_display_name_label']       = 'Payment serivce\'s name';
$_['kassa_display_name_description'] = 'This title will be shown to the customer';
$_['kassa_default_display_name']     = 'Yandex.Checkout (bank cards, e-money, etc.)';

$_['kassa_send_receipt_label']           = 'Transmit details for receipts to Yandex.Checkout (Federal Law 54-FZ)';
$_['kassa_send_receipt_tax_rate_title']  = 'VAT';
$_['kassa_tax_rate_default_label']       = 'Default rate';
$_['kassa_tax_rate_default_description'] = 'The default rate applies if another rate is not set on the product\'s page.';
$_['kassa_tax_rate_1_label']             = 'Without VAT';
$_['kassa_tax_rate_2_label']             = '0%';
$_['kassa_tax_rate_3_label']             = '10%';
$_['kassa_tax_rate_4_label']             = '18%';
$_['kassa_tax_rate_5_label']             = 'Applicable rate 10/110';
$_['kassa_tax_rate_6_label']             = 'Applicable rate 18/118';
$_['kassa_tax_rate_table_caption']       = 'Compare rates';
$_['kassa_shop_tax_rate_header']         = 'Rate at your store';
$_['kassa_kassa_tax_rate_header']        = 'Rate for the receipt to the tax service';

$_['kassa_notification_url_label']       = 'Address for notifications';
$_['kassa_notification_url_description'] = 'Only required if Yandex.Checkout\'s specialists ask for it';

$_['kassa_before_redirect_label'] = 'When the user proceeds to checkout';
$_['kassa_create_order_label']    = 'Create an unpaid order in the dashboard';
$_['kassa_clear_cart_label']      = 'Delete items from the cart';

$_['kassa_success_order_status_label']       = 'Order status after the payment';
$_['kassa_success_order_status_description'] = '';

$_['kassa_minimum_payment_amount_label']       = 'Minimum order amount';
$_['kassa_minimum_payment_amount_description'] = 'Order amount required to make a payment via Yandex.Checkout';

$_['kassa_geo_zone_label']       = 'Area of display';
$_['kassa_geo_zone_description'] = 'Geographical area displaying the payment method';
$_['kassa_any_geo_zone']         = 'Any area';

$_['kassa_debug_log_label']       = 'Debug log';
$_['kassa_debug_log_description'] = 'Detailed logging for the payment process';
$_['kassa_debug_log_off']         = 'Disable';
$_['kassa_debug_log_on']          = 'Enable';
$_['kassa_view_logs']             = 'View the logs';

$_['kassa_sort_order_label']       = 'Sorting order';
$_['kassa_sort_order_description'] = '';

$_['kassa_invoice_label'] = 'Invoicing via email';

$_['kassa_invoice_heading_label']       = 'Email template';
$_['kassa_invoice_subject_label']       = 'Subject';
$_['kassa_invoice_subject_default']     = 'Payment for order %order_id%';
$_['kassa_invoice_subject_description'] = 'Order number (%order_id% value) will be added automatically';
$_['kassa_invoice_message_label']       = 'Additional text';
$_['kassa_invoice_message_description'] = 'This text will appear in the email below the amount and the Pay button: give the customer some important information or leave this filed empty';

$_['kassa_invoice_logo_label'] = 'Add the store\'s logo to the email';

$_['kassa_invoices_kassa_disabled']   = 'These features are only available for payments via Yandex.Checkout';
$_['kassa_invoices_disabled']         = 'These features are disabled in the Yandex.Checkout module settings';
$_['kassa_invoices_invalid_order_id'] = 'Order ID is invalid or missing';
$_['kassa_invoices_order_not_exists'] = 'Specified order not found';

$_['kassa_refund_status_pending_label']   = 'Pending';
$_['kassa_refund_status_succeeded_label'] = 'Success';
$_['kassa_refund_status_canceled_label']  = 'Canceled';
$_['kassa_refund_sum_error_int']          = 'The amount should be numerical';
$_['kassa_refund_sum_error']              = 'Invalid refund amount';
$_['kassa_refund_comment_error']          = 'Add a comment to the refund';
$_['kassa_refund_failed']                 = 'Unable to make the refund';

$_['kassa_breadcrumbs_payments']    = 'List of payments made via the Yandex.Checkout module';
$_['kassa_payments_page_title']     = 'List of payments made via the Yandex.Checkout module';
$_['kassa_payments_update_button']  = 'Update the list';
$_['kassa_payments_capture_button'] = 'Capture all payments';
$_['kassa_payment_list_label']      = 'List of payments made via the Yandex.Checkout module';
$_['kassa_payment_list_link']       = 'View the list';

$_['kassa_tab_header']   = 'Yandex.Checkout';
$_['wallet_tab_header']  = 'Yandex.Money';
$_['billing_tab_header'] = 'Yandex.Billing';
$_['metrika_tab_header'] = 'Yadnex.Metrica';
$_['market_tab_header']  = 'Yandex.Market';

$_['wallet_page_title']         = 'Yadnex.Money settings';
$_['wallet_header_description'] = '';
$_['wallet_version_string']     = 'Module version';

$_['wallet_enable_label']              = 'Enable payment acceptance to the Yandex.Money Wallet';
$_['wallet_account_id_label']          = 'Wallet number';
$_['wallet_account_id_description']    = '';
$_['wallet_account_id_error_required'] = 'Specify Wallet number';

$_['wallet_application_id_label']          = 'App ID';
$_['wallet_application_id_description']    = '';
$_['wallet_application_id_error_required'] = 'Specify App ID';

$_['wallet_password_label']          = 'Codeword';
$_['wallet_password_description']    = 'You will be provided with an ID and a codeword after registering the app at the Yandex.Money website';
$_['wallet_password_error_required'] = 'Specify the codeword';

$_['wallet_display_name_label']       = 'Payment service title';
$_['wallet_display_name_description'] = 'This title will be shown to the customer';
$_['wallet_default_display_name']     = 'Yandex.Checkout (bank cards, Wallet)';

$_['wallet_notification_url_label']       = '';
$_['wallet_notification_url_description'] = 'Copy this link to the Redirect URI field on the <a href=\'https://sp-money.yandex.ru/myservices/new.xml\' target=\'_blank\'>app registration page</a>';

$_['wallet_before_redirect_label'] = 'When the user proceeds to checkout';
$_['wallet_create_order_label']    = 'Create an unpaid order in the dashboard';
$_['wallet_clear_cart_label']      = 'Delete items from the cart';

$_['wallet_success_order_status_label']       = 'Order status after the payment';
$_['wallet_success_order_status_description'] = '';

$_['wallet_minimum_payment_amount_label']       = 'Minimum order amount';
$_['wallet_minimum_payment_amount_description'] = 'Order amount required to make a payment via Yandex.Checkout';

$_['wallet_geo_zone_label']       = 'Area of display';
$_['wallet_geo_zone_description'] = 'Geographical area displaying the payment method';
$_['wallet_any_geo_zone']         = 'Any area';

$_['wallet_sort_order_label']       = 'Sorting';
$_['wallet_sort_order_description'] = '';

$_['billing_page_title']         = 'Yandex.Billing settings';
$_['billing_header_description'] = '';
$_['billing_version_string']     = 'Module version';

$_['billing_enable_label']           = 'Activate payments via Yandex.Billing';
$_['billing_form_id_label']          = 'Form ID';
$_['billing_form_id_description']    = '';
$_['billing_form_id_error_required'] = 'Specify Form ID';

$_['billing_purpose_label']       = 'Purpose of payment';
$_['billing_purpose_description'] = 'The purpose of payment is added to the payment order: specify whatever will help identify the order paid via Yandex.Billing';
$_['billing_default_purpose']     = 'Order No. %order_id% Payment via Yandex.Billing';

$_['billing_display_name_label']       = 'Payment service title';
$_['billing_display_name_description'] = 'This title will be shown to the customer';
$_['billing_default_display_name']     = 'Yandex.Billing (bank cards, Wallet)';

$_['billing_success_order_status_label']       = 'Order status';
$_['billing_success_order_status_description'] = 'The status should indicate that the result of the payment is unknown: you can only find out if the customer paid or not by checking the notification sent to your email or by contacting your bank';

$_['billing_minimum_payment_amount_label']       = 'Minimum order amount';
$_['billing_minimum_payment_amount_description'] = 'Order amount required to make a payment via Yandex.Checkout';

$_['billing_geo_zone_label']       = 'Area of display';
$_['billing_geo_zone_description'] = 'Geographical area displaying the payment method';
$_['billing_any_geo_zone']         = 'Any area';

$_['billing_sort_order_label']       = 'Sorting';
$_['billing_sort_order_description'] = '';


// market_
$_['market_set']     = 'Upload setups';
$_['market_set_1']   = 'Upload products in stock only';
$_['market_set_3']   = 'Upload all options of the product (colors, sizes, etc.)';
$_['market_set_4']   = 'Upload all features of the product';
$_['market_set_5']   = 'View dimensions of the packed product';
$_['market_set_6']   = 'Upload all currencies (if not specified, only the default currency will be uploaded)';
$_['market_set_7']   = 'The product is available in retail store';
$_['market_set_8']   = 'Delivery option';
$_['market_set_9']   = 'Customer pickup available';
$_['market_lnk_yml'] = 'Link for uploading products to Yandex.Market';
$_['market_cat']     = 'Categories and products for upload';
$_['market_out']     = 'Upload';
$_['market_out_all'] = 'All products';
$_['market_out_sel'] = 'Selected categories';

$_['market_dostup']   = 'Доступность';
$_['market_dostup_1'] = 'Все доступны';
$_['market_dostup_2'] = 'Доступны если > 0, остальные на заказ';
$_['market_dostup_3'] = 'Если = 0, не выгружать';
$_['market_dostup_4'] = 'Все на заказ';

$_['market_s_name']                = 'Store name';
$_['market_d_cost']                = 'Price of delivery in home region';
$_['market_d_days']                = 'Terms of delivery in home region';
$_['market_sv_all']                = 'Fold all';
$_['market_rv_all']                = 'Show all';
$_['market_ch_all']                = 'Cancel all';
$_['market_unch_all']              = 'Uncheck all boxes';
$_['market_sv']                    = 'Save';
$_['market_gen']                   = 'Generate';
$_['market_prostoy']               = 'Simplified YML';
$_['text_success']                 = 'Settings saved';
$_['market_color_option']          = 'Color parameters';
$_['market_size_option']           = 'Size parameters';
$_['market_size_unit']             = '';
$_['market_error_name_empty']      = 'Store name is missing';
$_['market_error_empty_price']     = 'Specify the price of delivery in home region';
$_['market_error_delivery_period'] = 'Specify the terms of delivery in home region';
$_['market_error_counter_number']  = 'Counter number is missing';
$_['market_error_id']              = 'App ID is missing';
$_['market_error_password_empty']  = 'App\'s password is missing';
$_['market_error_oauth_token']     = 'Get OAuth token';

// metrika
$_['metrika_number']   = 'Counter number';
$_['metrika_pw']       = 'App password';
$_['metrika_idapp']    = 'ID of the app';
$_['metrika_set']      = 'Settings';
$_['metrika_set_1']    = 'Webvisor';
$_['metrika_set_2']    = 'Heatmap';
$_['metrika_set_5']    = 'Tracking hash in browser\'s URL bar';
$_['metrika_callback'] = 'Link for the app';

// Error
$_['error_permission'] = 'You do not have the permission to operate the module!';
$_['active_on']        = 'Enabled';
$_['active_off']       = 'Disabled';
$_['active']           = 'Activity';
$_['mod_off']          = 'Install the Yandex.Money extension from the payment modules folder.';

$_['update_tab_header']                  = 'Module update';
$_['updater_success_message']            = 'Module version %s successfully downloaded and installed';
$_['updater_error_unpack_failed']        = 'Unable to extract archive %s. More about the error in <a href="">module\'s logs</a>';
$_['updater_error_backup_create_failed'] = 'Unable to create a backup copy of the installed module version. More about the error in <a href="%s">module\'s logs</a>';
$_['updater_error_archive_load']         = 'Unable to load the latest module version archive. More about the error in <a href="%s">module\'s logs</a>';
$_['updater_restore_backup_message']     = 'Module version %s successfully restored from backup %s';
$_['updater_error_restore_backup']       = 'Unable to restore data from the backup. More about the error in <a href="%s">module\'s logs</a>';
$_['updater_backup_deleted_message']     = 'Backup %s successfully deleted';
$_['updater_error_delete_backup']        = 'Unable to delete backup %s. More about the error in the <a href="%s">module\'s logs</a>';
$_['updater_error_create_directory']     = 'Unable to create directory %s';
$_['updater_error_load']                 = 'Unable to load the archive with the update';
$_['updater_header_text']                = 'New module versions with added features and fixed errors will appear here. Click the Update button to install the latest module version.';
$_['updater_about_title']                = 'About the module';
$_['updater_current_version']            = 'Current module version';
$_['updater_last_version']               = 'Latest available module version';
$_['updater_last_check_date']            = 'Date of the last check for updates';
$_['updater_check_updates']              = 'Check for updates';
$_['updater_history_title']              = 'Changelog:';
$_['updater_update']                     = 'Update module';
$_['updater_error_load']                 = 'Unable to load the archive with the update';
$_['updater_last_version_installed']     = 'You have the latest module version installed.';
$_['updater_backups_title']              = 'Backups';
$_['updater_module_version']             = 'Module version';
$_['updater_date_create']                = 'Creation date';
$_['updater_file_name']                  = 'File name';
$_['updater_file_size']                  = 'File size';
$_['updater_restore']                    = 'Restore';
$_['updater_delete']                     = 'Delete';
$_['updater_delete_message']             = 'Do you really want to delete the backup copy of this module version ';
$_['updater_restore_message']            = 'Do you really want to restore the module from the backup copy of this version';

$_['invoice_sum_text']         = 'К оплате %s руб.';
$_['invoice_greeting']         = 'Здравствуйте';
$_['invoice_thanks']           = 'Магазин %s благодарит вас за заказ и просит оплатить счет №&nbsp;%s.';
$_['invoice_receipt_header']   = 'В вашем заказе';
$_['invoice_currency']         = 'руб';
$_['invoice_yandex_text']      = 'Заплатить через Яндекс';
$_['invoice_sum_label']        = 'К оплате';
$_['invoice_footer_text']      = 'Счет выставлен через';
$_['invoice_footer_text_ycms'] = 'модуль Y.CMS';

$_['kassa_show_url_link']             = 'Show the link to the Yandex.Checkout\'s website';
$_['kassa_show_url_link_description'] = 'The link will be dispalyed in your website\'s footer';
$_['market_product_in_stock_header']  = 'Product is in stock';
$_['market_product_in_out_of_stock']  = 'Product is out of stock';
$_['market_product_status_in_stock']  = 'Product\'s availability';
$_['market_product_delivery_date']    = 'Delivery time';
$_['market_product_delivery_cost']    = 'Delivery price';
$_['text_payment_on_hold']            = 'Payment on hold';

$_['kassa_hold_setting_label']            = 'Включить отложенную оплату';
$_['kassa_hold_setting_description']      = 'Если опция включена, платежи с карт проходят в 2 этапа: у клиента сумма замораживается, и вам вручную нужно подтвердить её списание – через панель администратора';
$_['kassa_statuses_description_label'] = 'Какой статус присваивать заказу, если он:';
$_['kassa_hold_order_status_label']    = 'ожидает подтверждения';
$_['kassa_cancel_order_status_label']  = 'отменён';

$_['captures_title']                  = 'Подтверждение платежа';
$_['captures_expires_date']           = 'Подтвердить до';
$_['captures_new']                    = 'Подтверждение платежа';
$_['captures_payment_data']           = 'Данные платежа';
$_['captures_payment_id']             = 'Номер транзакции в Яндекс.Кассе';
$_['captures_order_id']               = 'Номер заказа';
$_['captures_payment_method']         = 'Способ оплаты';
$_['captures_payment_sum']            = 'Сумма платежа';
$_['captures_capture_data']           = '';
$_['captures_capture_sum']            = 'Сумма подтверждения';
$_['captures_capture_create']         = 'Подтвердить платеж';
$_['cancel_payment_button']           = 'Отменить платеж';
$_['capture_payment_success_message'] = 'Платеж подтвержден успешно';
$_['capture_payment_fail_message']    = 'Ошибка подтверждения платежа';
$_['cancel_payment_success_message']  = 'Платеж отменен успешно';
$_['cancel_payment_fail_message']     = 'Ошибка отмены платежа';

$_['column_product'] = 'Product name';
$_['column_quantity'] = 'Product quantity';
$_['column_price'] = 'Product price';
$_['column_total'] = 'Totals';

$_['kassa_payment_description_label']       = 'Transaction data';
$_['kassa_payment_description_description'] = 'Full description of the transaction that the user will see during the checkout process. You can find it in your Yandex.Checkout Merchant Profile. For example, "Payment for order No. 72 by user@yandex.ru".
Limitations: no more than 128 symbols';
$_['kassa_default_payment_description']     = 'Payment for order No. %order_id%';