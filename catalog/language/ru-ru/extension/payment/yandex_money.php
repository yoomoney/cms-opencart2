<?php

$_['heading_title'] = 'Яндекс.Касса (банковские карты, Яндекс.Деньги, интернет-банки, наличные, счет мобильного и другие)';

$_['heading_payment'] = $_['heading_title'];
$_['text_continue'] = 'Перейти к оплате';
$_['kassa_title'] = $_['heading_title'];

$_['text_method_yandex_money'] = 'Яндекс.Деньги';
$_['text_method_bank_card'] = 'Банковские карты — Visa, Mastercard и Maestro, «Мир»';
$_['text_method_cash'] = "Наличные";
$_['text_method_mobile'] = 'Баланс мобильного — Билайн, Мегафон, МТС, Tele2';
$_['text_method_webmoney'] = 'Webmoney';
$_['text_method_alfabank'] = 'Альфа-Клик';
$_['text_method_sberbank'] = 'Сбербанк Онлайн';
$_['text_method_qiwi'] = 'QIWI Wallet';
$_['text_method_installments'] = 'Заплатить по частям (%s ₽ в месяц)';
$_['text_method_tinkoff_bank'] = 'Интернет-банк Тинькофф';

$_['text_payment_method_qiwi_phone'] = 'Телефон, который привязан к Qiwi Wallet';
$_['text_payment_method_alfa_login'] = 'Укажите логин, и мы выставим счет в Альфа-Клике. После этого останется подтвердить платеж на сайте интернет-банка.';

$_['error_payment_method'] = 'Укажите способ оплаты';
$_['fast_pay_fio_label'] = 'Ф.И.О Плательщика';

$_['text_repay'] = 'Оплатить';
$_['text_order'] = 'Заказ';
$_['text_comment'] = 'Комментарий';

$_['text_invalid_payment_method'] = 'Не верный способ оплаты заказа';

$_['log_text_create_payment'] = 'Создание платежа для заказа №';
$_['log_text_payment_create_failed'] = 'Платеж не прошел. Попробуйте еще или выберите другой способ оплаты';
$_['log_text_payment_init_failed'] = 'Не удалось инициализировать платёж';
$_['log_text_payment_capture'] = 'Подтверждение платежа для заказа №';
$_['log_text_order_not_found'] = 'Не найден платёж %s для заказа №%s';
$_['log_text_error_payment_capture'] = 'Платёж не был проведён';
$_['log_text_status_canceled'] = 'Статус платежа %s заказа №%s - canceled';
$_[''] = '';

$_['text_error_phone_empty'] = 'Не был указан телефон';
$_['text_error_alfa_login_empty'] = 'Не указан логин в Альфа-клике';
$_['text_error_payment_id'] = 'Не был передан идентификатор платежа';
$_['text_module_disabled'] = 'Модуль оплаты выключен';
$_['text_get_payment_id_failed'] = 'Не удалось получить ID платежа для заказа №';
$_['text_capture_init'] = 'Проведение платежа %s заказа №%s';
$_['text_failure_status'] = 'Не удалось провести платёж';
$_['text_success_status'] = 'Заказ №%s был создан';
$_['yamoney_pay_button_text'] = '<span>Заплатить</span>через Яндекс';

$_['kassa_default_payment_description'] = 'Оплата заказа №%order_id%';

$_['yandex_money_b2b_sberbank'] = 'Сбербанк Бизнес Онлайн';
$_['b2b_tax_rates_error'] = 'У вас в корзине товары, для которых действуют разные ставки НДС — их нельзя оплатить одновременно. Можно разбить покупку на несколько этапов: сначала оплатить товары с одной ставкой НДС, потом — с другой.';