<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<div>
    <div style="margin:0;padding:0;">
        <table cellpadding="0" cellspacing="0" width="100%" height="auto" style="border-collapse:collapse;">
            <tbody>
            <tr>
                <td bgcolor="#f6f5f3" style="padding:50px;">
                    <table style="border-collapse:collapse;margin-left:auto;margin-right:auto;" cellpadding="0" cellspacing="0" width="610" height="auto" align="center" bgcolor="#ffffff">
                        <tbody>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" height="auto" style="border-collapse:collapse;">
                                    <tbody>
                                    <tr>
                                        <td style="padding:15px 25px;">
                                            <a href="https://kassa.yandex.ru/?_openstat=mail%3Bmy%3Binvoice_p%3Blogo" target="_blank" style="font-weight:normal;text-decoration:none;cursor:pointer;">
                                                <font color="#4d7fd2" face="Arial" size="3">
                                                    <img src="https://money.yandex.ru/i/html-letters/header__logo_theme_office.png" width="143" height="38" alt="Яндекс.Касса" title="Яндекс.Касса" style="border:0;vertical-align:middle;">
                                                </font>
                                            </a>
                                        </td>
                                        <?php if ($b_logo===true && !empty($shop_logo)){ ?>
                                        <td style="padding:15px 25px;" align="right">
                                            <a href="<?php echo $shop_url; ?>" target="_blank" style="font-weight:normal;text-decoration:none;cursor:pointer;">
                                                <font color="#4d7fd2" face="Arial" size="3">
                                                    <img src="<?php echo $shop_logo; ?>" width="143" height="38" alt="<?php echo $shop_name; ?>" title="<?php echo $shop_name; ?>" style="border:0;vertical-align:middle;">
                                                </font>
                                            </a>
                                        </td>
                                        <?php } ?>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr size="1" color="#e1dbdb" style="margin:0;">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:30px 25px 20px 25px;">
                                <h1 style="line-height:normal;padding:0;margin:0;margin-bottom:20px;margin-bottom:24px;font-weight:normal;">
                                    <font size="5" color="#000000" face="Arial"> <?php echo sprintf($language->get('invoice_sum_text'), $sum); ?></font>
                                </h1>
                                <p style="font-weight:normal;line-height:21px;padding:0;margin:0;margin-bottom:15px;">
                                    <font color="#000000" face="Arial" size="3"> <?php echo $language->get('invoice_greeting')?>, <font style="font-weight:bold;" color="#000000" face="Arial" size="3"><?php echo $customer_name; ?></font>. </font>
                                </p>
                                <p style="font-weight:normal;line-height:21px;padding:0;margin:0;margin-bottom:15px;">
                                    <font color="#000000" face="Arial" size="3">
                                        <?php echo sprintf($language->get('invoice_thanks'), $shop_name, $order_id);?>.
                                    </font>
                                </p>
                                <div>
                                    <img src="https://money.yandex.ru/i/html-letters/margin-block.png" width="100%" height="13" style="border:0;background:#ffffff;">
                                </div>
                                <h2 style="font-weight:normal;line-height:normal;padding:0;margin:0;margin-bottom:10px;font-weight:bold;">
                                    <font size="4" color="#000000" face="Arial"><?php echo $language->get('invoice_receipt_header');?></font>
                                </h2>
                                <table style="margin:0;padding:0;width:100%;">
                                    <tbody>
                                    <!-- -->
                                    <?php foreach ($products as $product){ ?>
                                    <tr>
                                        <td style="width:70%;">
                                            <div style="line-height:20px;vertical-align:top;">
                                                <font style="background-color:#fff;" color="#000000" face="Arial" size="3"><?php echo $product['name']; ?>&nbsp;</font>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                            </div>
                                        </td>
                                        <td valign="top">
                                            <font color="#000000" face="Arial" size="3"><?php echo $product['quantity']; ?>&nbsp;x&nbsp;<?php echo number_format($product['price'],2,'.',''); ?>&nbsp;<?php echo $language->get('invoice_currency')?>.</font>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                    <!-- -->
                                    <tr>
                                        <td>
                                            <div>
                                                <img src="https://money.yandex.ru/i/html-letters/margin-block.png" width="100%" height="10" style="border:0;background:#ffffff;">
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table style="margin:0;padding:0;width:100%;">
                                    <tbody>
                                    <tr>
                                        <td style="width:70%;">
                                            <div style="line-height:20px;vertical-align:top;">
                                                <font style="background-color:#fff;font-weight:bold;" color="#000000" face="Arial" size="3"><?php echo $language->get('invoice_sum_label');?></font>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                            </div>
                                        </td>
                                        <td valign="top">
                                            <font style="font-weight:bold;" color="#000000" face="Arial" size="3"><?php echo $sum; ?>&nbsp;<?php echo $language->get('invoice_currency')?>.</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <img src="https://money.yandex.ru/i/html-letters/margin-block.png" width="100%" height="25" style="border:0;background:#ffffff;">
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <?php if (!empty($instruction)){ ?>
                                <div>
                                    <p><?php echo $instruction; ?></p>
                                </div>
                                <?php } ?>
                                <div>
                                    <img src="https://money.yandex.ru/i/html-letters/margin-block.png" width="100%" height="25" style="border:0;background:#ffffff;">
                                </div>
                                <table cellpadding="0" cellspacing="0" width="100%" height="auto" style="border-collapse:collapse;">
                                    <tbody>
                                    <tr>
                                        <td style="padding-bottom:16px;">

                                            <table border="0" cellspacing="1" align="center"  width = "80%">
                                                <tr>
                                                    <td align="center">
                                                        <div>
                                                            <a href="<?php echo $link; ?>">
                                                                <img width="176" height="81" src="cid:yandex_buttons.png" border="0" alt="<?php echo $language->get('invoice_yandex_text');?>">
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div>
                                    <img src="https://money.yandex.ru/i/html-letters/margin-block.png" width="100%" height="45" style="border:0;background:#ffffff;">
                                </div>
                                <table cellpadding="0" cellspacing="0" width="100%" height="auto" style="border-collapse:collapse;">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <span>
                                            <font color="#999999" size="2" face="Arial"><?php echo $language->get('invoice_footer_text')?><a href="https://github.com/yoomoney/yandex-money-ycms-v2-opencart" target="_blank" style="font-weight:normal;text-decoration:none;cursor:pointer;">
                                                    <font color="#666699" size="2" face="Arial"><?php echo $language->get('invoice_footer_text_ycms')?></font>
                                                </a>
                                            </font>
                                            </span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>