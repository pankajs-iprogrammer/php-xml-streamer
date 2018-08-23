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
    'crm_plan_rental',
    'uup_circle',
    'crm_prod_subtype',
    'crm_short_desc',
    'sms_line_2',
    'crm_price_group',
    'crm_enrollment_fee',
    'product_sub_category',
    'crm_myplan_flag',
    'product_mkt_desc',
    'crm_prod_category',
    'roaming_idea_net_std_out_cost',
    'std_idea_to_idea_cost',
    'crm_long_desc',
    'roaming_idea_net_sms_local_cost',
    'product_name',
    'roaming_line_1',
    'sms_line_1',
    'local_idea_to_fixed_line_cost',
    'local_idea_to_other_mobile_cost',
    'display_rank',
    'additional_categories',
    'is_prorated',
    'web_exclusive',
    'crm_prod_type',
    'sms_isd_cost',
    'sms_local_cost',
    'std_idea_to_fixed_line_cost',
    'lastupdate',
    'creation_date',
    'roaming_idea_net_sms_std_cost',
    'roaming_idea_net_in_cost',
    'refundable_security_deposit',
    'local_idea_to_idea_cost',
    'activation_charge_fees',
    'roaming_line_2',
    'roaming_other_net_in_cost',
    'crm_arp_charge',
    'plan_code',
    'roaming_other_net_std_out_cost',
    'crm_activation_fee',
    'product_category',
    'crm_ultimate_plan_flag',
    'crm_security_deposit',
    'web_sellable',
    'open_market_flag',
    'roaming_other_net_local_out_cost',
    'crm_circle_code',
    'sms_std_cost',
    'crm_open_market',
    'roaming_idea_net_local_out_cost',
    'std_idea_to_other_mobile_cost',
    'crm_web_sellable',
    'roaming_idea_net_sms_isd_cost',
    'voice_line_1',
    'voice_line_2',
    'v_call_roaming_idea_net_local_out_cost',
    'cross_sell_caption',
    'up_sell_caption',
    'web_sub_category_2',
    'v_call_roaming_idea_net_in_cost',
    'per_second_plan',
    'v_call_local_idea_to_fixed_line_cost',
    'v_call_local_idea_to_idea_cost',
    'nbs_limit',
    'v_call_std_idea_to_other_mobile_cost',
    'cross_sell',
    'up_sell',
    'product_note',
    'overage_text',
    'v_call_roaming_idea_net_std_out_cost',
    'v_call_std_idea_to_idea_cost',
    'data_line_2',
    'v_call_std_idea_to_fixed_line_cost',
    'v_call_local_idea_to_other_mobile_cost',
    'promotion_title',
    'AssumeInfiniteInventory',
    'CostCurrency',
    'Description',
    'ManufacturerItemDesc',
    'ManufacturerName',
    'ShortDescription',
    'Status',
    'UnitCost',
    'CircleCode'
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
    $ioFiles = $ioFiles->dir(PATH . 'POSTPAID-PLAN*.xml');
    $file    = $ioFiles->getFiles();
    
    if (!is_array($file) || $file[0] == '') {
        throw new Exception('File not found');
    }
    
    $streamer = Prewk\XmlStringStreamer::createStringWalkerParser(PATH . $file[0]);
    $i        = 0;
    echo "\nPostpaid plans data import started : ";
    while ($node = $streamer->getNode()) {
        $data1         = array();
        $data2         = array();
        $simpleXmlNode = simplexml_load_string($node);
        foreach ($simpleXmlNode->AdditionalAttributeList->AdditionalAttribute as $attribute) {
            $attribute["Name"]                  = strtolower(str_replace('-', '_', (string) $attribute["Name"]));
            $attribute["Name"]                  = strtolower(str_replace(' ', '_', (string) $attribute["Name"]));
            $data1[(string) $attribute["Name"]] = (string) $attribute["Value"];
        }
        
        $data1['AssumeInfiniteInventory'] = $simpleXmlNode->PrimaryInformation['AssumeInfiniteInventory'];
        $data1['CostCurrency']            = $simpleXmlNode->PrimaryInformation['CostCurrency'];
        $data1['Description']             = $simpleXmlNode->PrimaryInformation['Description'];
        $data1['ManufacturerItemDesc']    = $simpleXmlNode->PrimaryInformation['ManufacturerItemDesc'];
        $data1['ManufacturerName']        = $simpleXmlNode->PrimaryInformation['ManufacturerName'];
        $data1['ShortDescription']        = $simpleXmlNode->PrimaryInformation['ShortDescription'];
        $data1['Status']                  = $simpleXmlNode->PrimaryInformation['Status'];
        $data1['UnitCost']                = $simpleXmlNode->PrimaryInformation['UnitCost'];
        $data1['CircleCode']              = $simpleXmlNode->PrimaryInformation['CircleCode'];
        
        // Data correction & re-assignment of indexes
        foreach ($column_names as $column) {
            if (!empty($data1[$column])) {
                @$data2[$column] = addslashes($data1[$column]);
            } else {
                @$data2[$column] = '-';
            }
        }
        
        // $pdoBulk->persist('postpaid_plan', $data2);
        $i++;
    }
    
    echo $log['details'] = "$i records Imported successfully :)";
    $ioFiles->move('Processed');
}
catch (Exception $e) {
    echo $log['details'] = 'Failed data import in Postpaid Plans. Details : ' . $e->getMessage();
    $log['status'] = 'ERROR';
}
$time_elapsed_secs     = microtime(true) - $start;
$log['execution_time'] = round($time_elapsed_secs, 4);
$pdoBulk->persist('data_import_logs', $log);