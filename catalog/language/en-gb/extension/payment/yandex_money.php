<?php

$_['heading_title'] = 'Yandex.Checkout (bank cards, Yandex.Money, online banking, cash, direct carrier billing, etc.)';

$_['heading_payment'] = $_['heading_title'];
$_['text_continue'] = 'Proceed to checkout';
$_['kassa_title'] = $_['heading_title'];

$_['text_method_yandex_money'] = 'Yandex.Money';
$_['text_method_bank_card'] = 'Debit or credit cards—Visa, Mastercard, Maestro, MIR';
$_['text_method_cash'] = "Cash";
$_['text_method_mobile'] = 'Direct carrier billing—Beeline, MegaFon, MTS, Tele2';
$_['text_method_webmoney'] = 'Webmoney';
$_['text_method_alfabank'] = 'Alfa-Click';
$_['text_method_sberbank'] = 'Sberbank Online';
$_['text_method_qiwi'] = 'QIWI Wallet';
$_['text_method_installments'] = 'Installments (%s ₽ per month)';

$_['text_payment_method_qiwi_phone'] = 'Phone number linked to QIWI Wallet';
$_['text_payment_method_alfa_login'] = 'Specify the login, and we\'ll send the bill in Alfa-Click. All you have do after that is confirm the payment online at the bank\'s website.';

$_['error_payment_method'] = 'Select payment method';
$_['fast_pay_fio_label'] = 'Payer\'s full name';

$_['text_repay'] = 'Pay';
$_['text_order'] = 'Order';
$_['text_comment'] = 'Comment';

$_['yamoney_pay_button_text'] = '<span>Pay</span>with Yandex';

$_['text_invalid_payment_method'] = 'Wrong payment method';

$_['log_text_create_payment'] = 'Create payment for order №';
$_['log_text_payment_create_failed'] = 'Payment not created. Try to choose another payment method';
$_['log_text_payment_init_failed'] = 'Could not initialize payment';
$_['log_text_payment_capture'] = 'Capture payment for order №';
$_['log_text_order_not_found'] = 'Payment not found %s for order №%s';
$_['log_text_error_payment_capture'] = 'Payment not captured';
$_['log_text_status_canceled'] = 'Payment status %s for order №%s - canceled';

$_['text_error_phone_empty'] = 'Qiwi phone field is empty';
$_['text_error_alfa_login_empty'] = 'Alfa-click login field is empty';
$_['text_error_payment_id'] = 'Payment id not passed';
$_['text_module_disabled'] = 'Module is disabled';
$_['text_get_payment_id_failed'] = 'Could not get payment ID for order №';
$_['text_capture_init'] = 'Capture payment %s for order №%s';
$_['text_failure_status'] = 'Could not capture payment';
$_['text_success_status'] = 'Order №%s was created';

$_['kassa_default_payment_description'] = 'Payment for order No. %order_id%';
