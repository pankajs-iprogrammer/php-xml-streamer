<?php
$start = microtime(true);

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/config/config.php';

use PdoBulk\PdoBulk;
use PdoBulk\PdoBulkSubquery;

// database connection
$conn    = new \PDO("mysql:host=" . DBHOST . ";dbname=" . DBNAME, DBUSER, DBPASS);
$pdoBulk = new PdoBulk($conn);
$pdoBulk->setAutoflush(100);

$column_names = array(
    'product_mkt_desc',
    'uup_circle',
    'cgrp_end_range',
    'up_sell_caption',
    'access_fee_tax_type',
    'open_market_flag',
    'cross_sell',
    'talktime_line_1',
    'talk_time_tax',
    'validity_period',
    'product_sub_category',
    'web_sub_category_2',
    'web_sellable',
    'vas_tax_type',
    'service_tax',
    'grace_period',
    'display_rank',
    'product_category',
    'product_name',
    'vas_tax',
    'data_line_2',
    'access_fee_tax',
    'voucher_amount',
    'bonus_talktime_type',
    'cgrp_start_range',
    'web_validity',
    'up_sell',
    'voice_line_1',
    'card_group_set_name',
    'lastupdate',
    'voice_line_2',
    'service_tax_type',
    'talktime_line_2',
    'read_more',
    'app_sellable',
    'online_recharge_flag',
    'sms_line_1',
    'access_fee_min',
    'csmdealercode',
    'bonus_talktime',
    'voucher_enabled',
    'homepage_display_flag',
    'additional_categories',
    'sms_line_2',
    'bonus_validity',
    'product_rating',
    'cross_sell_caption',
    'country',
    'web_exclusive',
    'voucher_count',
    'talk_time_type',
    'data_line_1',
    'homepage_display_rank',
    'creation_date',
    'access_fee_max',
    'in_cgrp',
    'vtopupcsmid',
    'promotion_title',
    'vtopupdbillid',
    'assume_infinite_inventory',
    'cost_currency',
    'description',
    'effective_start_date',
    'manufacturer_item_desc',
    'manufacturer_name',
    'short_description',
    'status',
    'unitcost',
    'circle_code',
    'item_group_code',
    'item_id',
    'organization_code',
    'unit_of_measure',
    'type',
    'category'
);

$log = array(
    'module' => 'POSTPAID-PLAN',
    'timestamp' => date('Y-m-d h:i:s'),
    'status' => 'SUCCESS',
    'details' => '',
    'execution_time' => 0
);

try {
    
    $ioFiles = new \Kedrigern\phpIO\Files();
    $ioFiles = $ioFiles->dir(PATH . 'VTOPUP*.xml');
    $file    = $ioFiles->getFiles();
    
    if (!is_array($file) || @$file[0] == '') {
        throw new Exception('File not found');
    }
    
    $streamer = Prewk\XmlStringStreamer::createStringWalkerParser(PATH . $file[0]);
    $i        = 0;
    echo "\nPrepaid packs data import started : ";
    
    while ($node = $streamer->getNode()) {
        $data1         = array();
        $data2         = array();
        $simpleXmlNode = simplexml_load_string($node);
        
        foreach ($simpleXmlNode->AdditionalAttributeList->AdditionalAttribute as $attribute) {
            $attribute["Name"]                  = strtolower(str_replace('-', '_', (string) $attribute["Name"]));
            $data1[(string) $attribute["Name"]] = (string) $attribute["Value"];
        }
        
        $data1['assume_infinite_inventory'] = $simpleXmlNode->PrimaryInformation['AssumeInfiniteInventory'];
        $data1['cost_currency']             = $simpleXmlNode->PrimaryInformation['CostCurrency'];
        $data1['description']               = $simpleXmlNode->PrimaryInformation['Description'];
        $data1['effective_start_date']      = $simpleXmlNode->PrimaryInformation['EffectiveStartDate'];
        $data1['manufacturer_item_desc']    = $simpleXmlNode->PrimaryInformation['ManufacturerItemDesc'];
        $data1['manufacturer_name']         = $simpleXmlNode->PrimaryInformation['ManufacturerName'];
        $data1['short_description']         = $simpleXmlNode->PrimaryInformation['ShortDescription'];
        $data1['status']                    = $simpleXmlNode->PrimaryInformation['Status'];
        $data1['unitcost']                  = $simpleXmlNode->PrimaryInformation['UnitCost'];
        $data1['circle_code']               = $simpleXmlNode->PrimaryInformation['CircleCode'];
        $data1['item_group_code']           = $simpleXmlNode['ItemGroupCode'];
        $data1['item_id']                   = $simpleXmlNode['ItemID'];
        $data1['organization_code']         = $simpleXmlNode['OrganizationCode'];
        $data1['unit_of_measure']           = $simpleXmlNode['UnitOfMeasure'];
        $data1['type']                      = $simpleXmlNode['Type'];
        $data1['category']                  = $simpleXmlNode['Category'];
        
        // Data correction & re-assignment of indexes
        foreach ($column_names as $column) {
            if (!empty($data1[$column])) {
                @$data2[$column] = addslashes($data1[$column]);
            } else {
                @$data2[$column] = '-';
            }
        }
        
        $i++;
        // $pdoBulk->persist('prepaid_pack', $data2);    
    }
    echo $log['details'] = "$i records Imported successfully :)";
    $ioFiles->move('Processed');
}
catch (Exception $e) {
    echo $log['details'] = 'Failed data import in Prepaid Packs. Details : ' . $e->getMessage();
    $log['status'] = 'ERROR';
}
$time_elapsed_secs     = microtime(true) - $start;
$log['execution_time'] = round($time_elapsed_secs, 4);
$pdoBulk->persist('data_import_logs', $log);