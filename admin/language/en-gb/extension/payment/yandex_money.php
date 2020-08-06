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
$_['kassa_add_installments_block_label']  = 'Add the information block about Installments to product descriptions';
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
$_['kassa_payment_method_tinkoff_bank'] = 'Tinkoff online banking';
$_['kassa_payment_method_widget']       = 'Payment widget from Yandex.Checkout (cards, Apple Pay and Google Play)';

$_['kassa_payment_method_error_required'] = 'Please select at least one option from the list';

$_['kassa_display_name_label']       = 'Payment serivce\'s name';
$_['kassa_display_name_description'] = 'This title will be shown to the customer';
$_['kassa_default_display_name']     = 'Yandex.Checkout (bank cards, e-money, etc.)';

$_['kassa_currency']                     = 'The payment currency in the Yandex.Checkout';
$_['kassa_currency_convert']             = 'Convert an amount from the store\'s current currency';
$_['kassa_currency_help']                = 'Currency must match in the Yandex.Checkout and in the store';
$_['kassa_currency_convert_help']        = 'A value from the store\'s currency list is used. If the currency is not in the list – the exchange rate of the Central Bank of the Russian Federation.';

$_['kassa_send_receipt_label']           = 'Transmit details for receipts to Yandex.Checkout (Federal Law 54-FZ)';
$_['kassa_send_receipt_tax_rate_title']  = 'VAT';
$_['kassa_second_receipt_header']        = 'Second Receipt';
$_['kassa_second_receipt_enable']        = 'Enabled';
$_['kassa_second_receipt_disable']       = 'Disabled';
$_['kassa_second_receipt_description']   = 'Два чека нужно формировать, если покупатель вносит предоплату и потом получает товар или услугу. Первый чек — когда деньги поступают вам на счёт, второй — при отгрузке товаров или выполнении услуг.<br> <a href="#">Читать про второй чек в Яндекс.Кассе</a>';
$_['kassa_second_receipt_enable_label']  = 'Generate a second receipt when the order changes to the status';
$_['kassa_second_receipt_help_info']     = 'Если в заказе будут позиции с признаками «Полная предоплата» — второй чек отправится автоматически, когда заказ перейдёт в выбранный статус.';
$_['kassa_second_receipt_history_info']  = 'The second receipt was sent. Amount %s rubles.';
$_['kassa_tax_rate_default_label']       = 'Default rate';
$_['kassa_tax_rate_default_description'] = 'The default rate applies if another rate is not set on the product\'s page.';
$_['kassa_tax_rate_1_label']             = 'Without VAT';
$_['kassa_tax_rate_2_label']             = '0%';
$_['kassa_tax_rate_3_label']             = '10%';
$_['kassa_tax_rate_4_label']             = '20%';
$_['kassa_tax_rate_5_label']             = 'Applicable rate 10/110';
$_['kassa_tax_rate_6_label']             = 'Applicable rate 20/120';
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
$_['billing_tab_header'] = 'Billing';
$_['metrika_tab_header'] = 'Yadnex.Metrica';
$_['market_tab_header']  = 'Yandex.Market';

$_['wallet_page_title']         = 'Yadnex.Money settings';
$_['wallet_header_description'] = 'Для работы с модулем нужно открыть <a href=\'https://money.yandex.ru/new\' target=\'_blank\'>кошелек</a> на Яндексе.';
$_['wallet_version_string']     = 'Module version';

$_['wallet_enable_label']              = 'Enable payment acceptance to the Yandex.Money Wallet';
$_['wallet_account_id_label']          = 'Wallet number';
$_['wallet_account_id_description']    = '';
$_['wallet_account_id_error_required'] = 'Specify Wallet number';


$_['wallet_password_label']          = 'Codeword';
$_['wallet_password_description']    = 'You will be provided with an ID and a codeword <a href=\'https://money.yandex.ru/myservices/online.xml\' target=\'_blank\'>from the notification settings page</a> at the Yandex.Money website';
$_['wallet_password_error_required'] = 'Specify the codeword';

$_['wallet_display_name_label']       = 'Payment service title';
$_['wallet_display_name_description'] = 'This title will be shown to the customer';
$_['wallet_default_display_name']     = 'Yandex.Checkout (bank cards, Wallet)';

$_['wallet_notification_url_label']       = 'RedirectURL';
$_['wallet_notification_url_description'] = 'Copy this link to the Redirect URI field on the <a href=\'https://money.yandex.ru/myservices/online.xml\' target=\'_blank\'>from the notification settings page</a> at Yandex.Money website.';

$_['wallet_before_redirect_label'] = 'When the user proceeds to checkout';
$_['wallet_create_order_label']    = 'Create an unpaid order in the dashboard';
$_['wallet_clear_cart_label']      = 'Delete items from the cart';

$_['wallet_success_order_status_label']       = 'Order status after the payment';
$_['wallet_success_order_status_description'] = '';

$_['wallet_minimum_payment_amount_label']       = 'Minimum order amount';
$_['wallet_minimum_payment_amount_description'] = 'Order amount required to make a payment';

$_['wallet_geo_zone_label']       = 'Area of display';
$_['wallet_geo_zone_description'] = 'Geographical area displaying the payment method';
$_['wallet_any_geo_zone']         = 'Any area';

$_['wallet_sort_order_label']       = 'Sorting';
$_['wallet_sort_order_description'] = '';

$_['billing_page_title']         = 'Billing settings';
$_['billing_header_description'] = '';
$_['billing_version_string']     = 'Module version';

$_['billing_enable_label']           = 'Activate payments via Billing';
$_['billing_form_id_label']          = 'Form ID';
$_['billing_form_id_description']    = '';
$_['billing_form_id_error_required'] = 'Specify Form ID';

$_['billing_purpose_label']       = 'Purpose of payment';
$_['billing_purpose_description'] = 'The purpose of payment is added to the payment order: specify whatever will help identify the order paid via Billing';
$_['billing_default_purpose']     = 'Order No. %order_id% Payment via Billing';

$_['billing_display_name_label']       = 'Payment service title';
$_['billing_display_name_description'] = 'This title will be shown to the customer';
$_['billing_default_display_name']     = 'Billing (bank cards, Wallet)';

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
$_['market_lnk_yml']                                          = 'Link for uploading products to Yandex.Market';
$_['market_sv_all']                                           = 'Fold all';
$_['market_rv_all']                                           = 'Show all';
$_['market_ch_all']                                           = 'Cancel all';
$_['market_unch_all']                                         = 'Uncheck all boxes';
$_['text_success']                                            = 'Settings saved';
$_['market_error_name_empty']                                 = 'Store name is missing';
$_['market_error_empty_price']                                = 'Specify the price of delivery in home region';
$_['market_error_delivery_period']                            = 'Specify the terms of delivery in home region';
$_['market_error_counter_number']                             = 'Counter number is missing';
$_['market_error_id']                                         = 'App ID is missing';
$_['market_error_password_empty']                             = 'App\'s password is missing';
$_['market_error_oauth_token']                                = 'Get OAuth token';
$_['market_header_offer_settings']                            = 'Настройка предложений';
$_['market_header_param_settings']                            = 'Параметры для Яндекс.Маркета';
$_['market_short_name']                                       = 'Короткое название магазина';
$_['market_full_name']                                        = 'Полное наименование организации';
$_['market_currencies']                                       = 'Валюта';
$_['market_categories']                                       = 'Выгружаем категории';
$_['market_categories_all']                                   = 'Все';
$_['market_categories_selected']                              = 'Выбранные';
$_['market_format']                                           = 'Формат предложений';
$_['market_format_vendor_model']                              = 'Произвольный';
$_['market_format_simple']                                    = 'Упрощенный с шаблоном названия предложения';
$_['market_currencies_rate_1']                                = 'основная валюта';
$_['market_currencies_rate_CBRF']                             = 'по курсу ЦБ РФ';
$_['market_currencies_rate_NBU']                              = 'по курсу НБ Украины';
$_['market_currencies_rate_NBK']                              = 'по курсу НБ Казахстана';
$_['market_currencies_rate_CB']                               = 'по курсу банка страны из личного кабинета';
$_['market_currencies_rate___cms']                            = 'по курсу из Opencart';
$_['ok']                                                      = 'OK';
$_['cancel']                                                  = 'Отмена';
$_['delete']                                                  = 'Удалить';
$_['market_currencies_plus']                                  = 'надбавка';
$_['market_error_message_empty_shop_name']                    = 'Не введено название магазина';
$_['market_error_message_none_delivery_cost']                 = 'Введите стоимость доставки в домашнем регионе';
$_['market_error_message_none_delivery_time']                 = 'Введите срок доставки в домашнем регионе';
$_['market_copy_url_to_clipboard']                            = 'Скопировать ссылку';
$_['market_url_copied_to_clipboard']                          = 'Ссылка скопирована';
$_['market_offer_name_template']                              = 'Шаблон названия';
$_['market_delivery_label']                                   = 'Курьерская доставка для домашнего региона';
$_['market_delivery_cost']                                    = 'Стоимость';
$_['market_delivery_days']                                    = 'Срок доставки';
$_['market_delivery_days_from']                               = 'от';
$_['market_delivery_days_to']                                 = 'до';
$_['market_delivery_more']                                    = 'ещё';
$_['market_delivery_days_order_before']                       = 'При заказе до';
$_['market_delivery_days_measurement_unit']                   = 'дн.';
$_['market_delivery_use_default']                             = 'Использовать значение по умолчанию';
$_['market_delivery_text']                                    = 'доставка';
$_['market_delivery_order_before']                            = 'при заказе до';
$_['market_delivery_default_value']                           = '13:00 (по умолчанию для Маркета)';
$_['market_available_non_zero_count_goods']                   = 'Для товаров в наличии';
$_['market_available_if_zero_count_goods']                    = 'Для товаров отсутствующих на складе';
$_['market_available_label']                                  = 'Статус товара и способы получения';
$_['market_available_delivery']                               = 'доставка';
$_['market_available_delivery_description']                   = 'доставка до места';
$_['market_available_pickup']                                 = 'самовывоз';
$_['market_available_pickup_description']                     = 'самовывоз из пункта заказа';
$_['market_available_store']                                  = 'в магазине';
$_['market_available_store_description']                      = 'покупка без предварительного заказа';
$_['market_available_dont_unload']                            = 'Не выгружать';
$_['market_available_ready']                                  = 'Готов к отправке';
$_['market_available_to_order']                               = 'На заказ';
$_['market_available_view_order_label']                       = 'Товары со статусом';
$_['market_available_view_dont_upload']                       = 'не будут выгружены';
$_['market_available_view_will_upload']                       = 'будут выгружены со статусом';
$_['market_available_view_ready']                             = 'готов к отправке';
$_['market_available_view_to_order']                          = 'на заказ';
$_['market_available_view_with_available']                    = 'и доступны';
$_['market_available_view_delivery']                          = 'доставкой';
$_['market_available_view_pickup']                            = 'самовывозом';
$_['market_available_view_store']                             = 'покупкой на месте';
$_['market_option_label']                                     = 'Варианты предложений с опциями';
$_['market_option_color_label']                               = 'цвет товара задается опцией';
$_['market_option_name_color_label']                          = 'включить цвет в название товара';
$_['market_option_prefix_color_label']                        = 'префикс (например, «цвет:»)';
$_['market_option_size_label']                                = 'размер товара задается опцией';
$_['market_option_name_size_label']                           = 'включить размер в название товара';
$_['market_option_prefix_size_label']                         = 'префикс (например, «размер:»)';
$_['market_offer_options_label']                              = 'Опции предложений';
$_['market_offer_options_export_attributes']                  = 'Выгружать все атрибуты товаров';
$_['market_offer_options_export_dimensions']                  = 'Выгружать размеры товаров';
$_['market_vat_label']                                        = 'Налоговые ставки';
$_['market_vat_enable_label']                                 = 'Добавить налоговые ставки в предложения';
$_['market_vat_rate_VAT_18_label']                            = '18%';
$_['market_vat_rate_VAT_18_118_label']                        = '18/118';
$_['market_vat_rate_VAT_10_label']                            = '10%';
$_['market_vat_rate_VAT_10_110_label']                        = '10/110';
$_['market_vat_rate_VAT_0_label']                             = '0%';
$_['market_vat_rate_NO_VAT_label']                            = 'НДС не облагается';
$_['market_additional_condition_label']                       = 'Дополнительные условия';
$_['market_additional_condition_name_label']                  = 'Название условия';
$_['market_additional_condition_tag_label']                   = 'Тег';
$_['market_additional_condition_static_value_label']          = 'Постоянное значение';
$_['market_additional_condition_data_value_label']            = 'Значение из карточки товара';
$_['market_additional_condition_for_categories_label']        = 'Для категорий';
$_['market_additional_condition_more']                        = 'Добавить условие';
$_['market_additional_condition_make_tag_label']              = 'задает параметру';
$_['market_additional_condition_with_value_label']            = 'значение';
$_['market_additional_condition_for_category_label']          = 'для';
$_['market_additional_condition_for_all_category_label']      = 'всех категорий';
$_['market_additional_condition_for_selected_category_label'] = 'выбранных категорий';
$_['market_additional_condition_for_more_category_label']     = 'и еще %s кат.';
$_['market_additional_condition_join_label']                  = 'Одинаковые теги в предложении';
$_['market_additional_condition_join_text']                   = 'объединять в один тег';
$_['market_additional_condition_dont_join_text']              = 'оставить в нескольких тегах';

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

$_['kassa_hold_setting_label']         = 'Включить отложенную оплату';
$_['kassa_hold_setting_description']   = 'Если опция включена, платежи с карт проходят в 2 этапа: у клиента сумма замораживается, и вам вручную нужно подтвердить её списание – через панель администратора';
$_['kassa_statuses_description_label'] = 'Какой статус присваивать заказу, если он:';
$_['kassa_hold_order_status_label']    = 'ожидает подтверждения';
$_['kassa_cancel_order_status_label']  = 'отменён';

$_['refunds_title']              = 'Refunds';
$_['refunds_new']                = 'New Refund';
$_['refunds_payment_data']       = 'Payment Details';
$_['refunds_payment_id']         = 'Transaction number in Yandex.Checkout';
$_['refunds_order_id']           = 'Order ID';
$_['refunds_payment_method']     = 'Payment method';
$_['refunds_payment_sum']        = 'Payment amount';
$_['refunds_refund_data']        = 'Refund details';
$_['refunds_refund_sum']         = 'Refund amount';
$_['refunds_refund_cause']       = 'Refund reason';
$_['refunds_refund_create']      = 'Создать возврат';
$_['refunds_history']            = 'Refund History';
$_['refunds_history_empty']      = 'Для заказа №%s возвраты не проводились.';
$_['refunds_header_id']          = 'Refund ID';
$_['refunds_header_status']      = 'Status';
$_['refunds_header_date_create'] = 'Дата создания';
$_['refunds_header_sum']         = 'Refund amount';

$_['captures_title']                  = 'Payment capture';
$_['captures_expires_date']           = 'Подтвердить до';
$_['captures_new']                    = 'Payment capture';
$_['captures_payment_data']           = 'Payment Details';
$_['captures_payment_id']             = 'Transaction number in Yandex.Checkout';
$_['captures_order_id']               = 'Order ID';
$_['captures_payment_method']         = 'Payment method';
$_['captures_payment_sum']            = 'Payment amount';
$_['captures_capture_data']           = '';
$_['captures_capture_sum']            = 'Сумма подтверждения';
$_['captures_capture_create']         = 'Подтвердить платеж';
$_['cancel_payment_button']           = 'Отменить платеж';
$_['capture_payment_success_message'] = 'Платеж подтвержден успешно';
$_['capture_payment_fail_message']    = 'Ошибка подтверждения платежа';
$_['cancel_payment_success_message']  = 'Платеж отменен успешно';
$_['cancel_payment_fail_message']     = 'Ошибка отмены платежа';

$_['column_product']  = 'Product name';
$_['column_quantity'] = 'Product quantity';
$_['column_price']    = 'Product price';
$_['column_total']    = 'Totals';

$_['kassa_payment_description_label']       = 'Transaction data';
$_['kassa_payment_description_description'] = 'Full description of the transaction that the user will see during the checkout process. You can find it in your Yandex.Checkout Merchant Profile. For example, "Payment for order No. 72 by user@yandex.ru".
Limitations: no more than 128 symbols';
$_['kassa_default_payment_description']     = 'Payment for order No. %order_id%';

$_['nps_text'] = '';

$_['b2b_sberbank_label']             = 'Enable payments via Sberbank Business Online';
$_['b2b_sberbank_on_label']          = 'If you enable this option, you will be able to accept online payments from legal entities. Learn more at the <a href="https://checkout.yandex.com">Yandex.Checkout website</a>.';
$_['b2b_sberbank_template_label']    = 'Template for payment details';
$_['b2b_sberbank_vat_default_label'] = 'Default VAT rate';
$_['b2b_sberbank_template_help']     = 'These payment details will be shown in the payment order.';
$_['b2b_sberbank_vat_default_help']  = 'This rate will be sent to Sberbank Business Online if there\'s no other rate indicated in the payment description.';
$_['b2b_sberbank_vat_label']         = 'Compare the VAT rates in your store with the rates for Sberbank Business Online';
$_['b2b_sberbank_vat_cms_label']     = 'VAT rate at your store';
$_['b2b_sberbank_vat_sbbol_label']   = 'VAT rate for Sberbank Business Online';
$_['b2b_tax_rate_untaxed_label']     = 'Without VAT';
$_['b2b_tax_rate_7_label']           = '7%';
$_['b2b_tax_rate_10_label']          = '10%';
$_['b2b_tax_rate_18_label']          = '18%';
$_['b2b_sberbank_tax_message']       = 'There is a restriction for payments via Sberbank Business Online: one receipt can only contain products with the same VAT rate. If the client wants to pay for products with different VAT rates at the same time, we will show him the message explaining that it\'s not possible.';

$_['kassa_default_payment_mode_label']             = 'Признак способа расчета';
$_['kassa_default_payment_subject_label']          = 'Признак предмета расчета';
$_['kassa_default_delivery_payment_mode_label']    = 'Признак способа расчета для доставки';
$_['kassa_default_delivery_payment_subject_label'] = 'Признак предмета расчета для доставки';