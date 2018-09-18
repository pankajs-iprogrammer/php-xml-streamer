<?php
$start = microtime(true);
$table = 'postpaid_pack';

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/config/config.php';
require __DIR__ . '/functions.php';

use PdoBulk\PdoBulk;
use PdoBulk\PdoBulkSubquery;

// database connection
$conn    = new \PDO("mysql:host=" . DBHOST . ";dbname=" . DBNAME, DBUSER, DBPASS);
$pdoBulk = new PdoBulk($conn);
$pdoBulk->setAutoflush(100);
// columnes to import
$column_names = array(
    'crm_long_desc',
    'uup_circle',
    'is_prorated',
    'crm_fup_id',
    'data_line_1',
    'display_rank',
    'crm_prod_type',
    'product_category',
    'overage_text',
    'product_name',
    'open_market_flag',
    'product_sub_category',
    'web_validity',
    'data_line_2',
    'crm_web_sellable',
    'product_mkt_desc',
    'lastupdate',
    'web_sellable',
    'crm_iplan_identifier',
    'pack_code',
    'creation_date',
    'crm_circle_code',
    'crm_prod_subtype',
    'web_exclusive',
    'AssumeInfiniteInventory',
    'CostCurrency',
    'Description',
    'ManufacturerItemDesc',
    'ManufacturerName',
    'ShortDescription',
    'Status',
    'UnitCost',
    'CircleCode',
    'crm_rental_amount',
    'promotion_title',
    'read_more',
    'voice_line_1',
    'sms_line_2',
    'web_sub_category_2',
    'up_sell',
    'fup_limit_text',
    'bill_shield_value_text',
    'sms_line_1',
    'up_sell_caption',
    'voice_line_2',
    'cross_sell',
    'country_group',
    'crm_fup_desc',
    'cross_sell_caption',
    'crm_pack_rank',
    'additional_categories',
    'Type',
    'ItemGroupCode',
    'ItemID',
    'OrganizationCode',
    'UnitOfMeasure',
    'Category'
);

$log = array(
    'module' => 'Postpaid Packs',
    'timestamp' => date('Y-m-d h:i:s'),
    'status' => 'SUCCESS',
    'details' => '',
    'execution_time' => 0
);

try {
    $ioFiles = new \Kedrigern\phpIO\Files();
    $ioFiles = $ioFiles->dir(PATH . 'POSTPAID-PACK*.xml');
    $file    = $ioFiles->getFiles();
    
    if (!is_array($file) || @$file[0] == '') {
        die('File not available');
    }
    $maxID = getMaxId($conn, $table);
    // echo '\nMax ID : ' . $maxID . '\n';
    $streamer = Prewk\XmlStringStreamer::createStringWalkerParser(PATH . $file[0]);
    $i        = 0;
    echo "Postpaid packs data import started : ";
    while ($node = $streamer->getNode()) {
        $simpleXmlNode   = simplexml_load_string($node);
        $action          = (string) $simpleXmlNode["Action"];
        $data1["ItemID"] = (string) $simpleXmlNode["ItemID"];
        
        if ($action == 'Manage') {
            $id = (int) checkIfRecordExist($conn, $data1["ItemID"], $table);
            if ($id > 0) {
                // echo '\n----Update----\n';
                insertData($pdoBulk, $simpleXmlNode, $column_names, $id, $table);
            } else {
                $maxID++;
                insertData($pdoBulk, $simpleXmlNode, $column_names, $maxID, $table);
            }
        } else {
            deleteData($conn, $simpleXmlNode, $table);
        }
        $i++;
    }
    echo $log['details'] = "$i records Imported successfully :)\n";
    $ioFiles->move('Processed');
}
catch (Exception $e) {
    echo $log['details'] = 'Failed data import in Postpaid Packs. Details : ' . $e->getMessage();
    $log['status'] = 'ERROR';
}
$time_elapsed_secs     = microtime(true) - $start;
$log['execution_time'] = round($time_elapsed_secs, 4);
$pdoBulk->persist('data_import_logs', $log);


function insertData($pdoBulk, $simpleXmlNode, $column_names, $id = 0, $table)
{
    $data1 = array();
    $data2 = array();
    
    foreach ($simpleXmlNode->AdditionalAttributeList->AdditionalAttribute as $attribute) {
        $attribute["Name"]                  = strtolower(str_replace('-', '_', (string) $attribute["Name"]));
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
    
    $data1["Action"]           = (string) $simpleXmlNode["Action"];
    $data1["Type"]             = (string) $simpleXmlNode["Type"];
    $data1["ItemGroupCode"]    = (string) $simpleXmlNode["ItemGroupCode"];
    $data1["ItemID"]           = (string) $simpleXmlNode["ItemID"];
    $data1["OrganizationCode"] = (string) $simpleXmlNode["OrganizationCode"];
    $data1["UnitOfMeasure"]    = (string) $simpleXmlNode["UnitOfMeasure"];
    $data1["Category"]         = (string) $simpleXmlNode["Category"];
    
    // Data correction & re-assignment of indexes
    foreach ($column_names as $column) {
        if (!empty($data1[$column])) {
            @$data2[$column] = addslashes($data1[$column]);
        } else {
            @$data2[$column] = '-';
        }
    }
    $data2["id"] = $id;
    
    $pdoBulk->persist("$table", $data2);
}