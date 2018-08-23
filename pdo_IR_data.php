<?php
$start = microtime(true);
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/config/config.php';

use Box\Spout\Reader\ReaderFactory;
use Box\Spout\Common\Type;
use PdoBulk\PdoBulk;
use PdoBulk\PdoBulkSubquery;

// database connection
$conn    = new \PDO("mysql:host=" . DBHOST . ";dbname=" . DBNAME, DBUSER, DBPASS);
$pdoBulk = new PdoBulk($conn);
$pdoBulk->setAutoflush(100);

$log                          = array(
    'module' => 'IR-Data',
    'timestamp' => date('Y-m-d h:i:s'),
    'status' => 'SUCCESS',
    'details' => '',
    'execution_time' => 0
);
// flags
$postpaid_call_roaming_tarrif = 0;

try {
    $ioFiles = new \Kedrigern\phpIO\Files();
    $ioFiles = $ioFiles->dir(PATH . '*IR*.xlsx');
    $file    = $ioFiles->getFiles();
    
    if (!is_array($file) || @$file[0] == '') {
        throw new Exception('File not found');
    }
    
    // for XLSX files
    $reader   = ReaderFactory::create(Type::XLSX);
    $filePath = PATH . $file[0];
    $reader->open($filePath);
    $ignoreList = array(
        "Prepaid NR Tieup & Tariff",
        "Postpaid NR Tieup & Tariff",
        "CountryGroup"
    );
    $output     = '';
    foreach ($reader->getSheetIterator() as $sheet) {
        if (!in_array($sheet->getName(), $ignoreList)) {
            $output .= $sheet->getName();
            foreach ($sheet->getRowIterator() as $index => $row) {
                if ($index > 1) {
                    switch ($sheet->getName()) {
                        case 'Postpaid Call Roaming Tarrif':
                            $columns = array(
                                'zone_id',
                                'outgoing_call_to_india',
                                'outgoing_call_within_the_visited_country',
                                'outgoing_call_international',
                                'incoming_calls',
                                'outgoing_sms'
                            );
                            $row     = array_combine($columns, $row);
                            // $pdoBulk->persist('postpaid_call_roaming_tarrif', $row);
                            break;
                        
                        case 'Postpaid Data Roaming Tarrif':
                            $columns = array(
                                'zone_id',
                                'rate'
                            );
                            $row     = array_combine($columns, $row);
                            // $pdoBulk->persist('postpaid_data_roaming_tarrif', $row);
                            break;
                        
                        case 'Postpaid':
                            $columns = array(
                                'idea_plmn',
                                'idea_network',
                                'rp_plmn',
                                'mcc',
                                'mnc',
                                'rp_operator',
                                'rp_country',
                                'international_roaming_on_idea_postpaid',
                                'data_roaming_on_idea_postpaid',
                                '3g__launch',
                                'network_freqency',
                                'handset_display',
                                'customer_care_number_from_visited_network',
                                'customer_care_number_from_landline',
                                'website',
                                'postpaid_zone',
                                'data_zone',
                                'country_flag'
                            );
                            $row     = array_combine($columns, $row);
                            // $pdoBulk->persist('postpaid', $row);
                            break;
                        
                        case 'Prepaid Call Roaming Tarrif':
                            $columns = array(
                                'zone_id',
                                'outgoing_calls',
                                'outgoing_call_within_the_visited_country',
                                'outgoing_inmarsat_or_satlelite_calls',
                                'incoming_calls',
                                'outgoing_sms'
                            );
                            $row     = array_combine($columns, $row);
                            // $pdoBulk->persist('prepaid_call_roaming_tarrif', $row);
                            break;
                        
                        case 'Prepaid Data Roaming Tarrif':
                            $columns = array(
                                'zone_id',
                                'rate'
                            );
                            $row     = array_combine($columns, $row);
                            $pdoBulk->persist('prepaid_data_roaming_tarrif', $row);
                            break;
                        
                        case 'Prepaid':
                            $columns = array(
                                'idea_plmn',
                                'idea_network',
                                'rp_plmn',
                                'mcc',
                                'mnc',
                                'rp_operator',
                                'rp_country',
                                'international_roaming_on_idea_prepaid',
                                'data_roaming_on_idea_prepaid',
                                '3g_launch',
                                'network_freqency',
                                'handset_display',
                                'customer_care_number_from_visited_network',
                                'customer_care_number_from_landline',
                                'website',
                                'prepaid_zone',
                                'data_zone',
                                'prepaid_country_flag'
                            );
                            $row     = array_combine($columns, $row);
                            $pdoBulk->persist('prepaid', $row);
                            break;
                        
                        case 'CountryGroup':
                            $columns = array(
                                'country_group_id',
                                'country_group_description',
                                'country'
                            );
                            $row     = array_combine($columns, $row);
                            //$pdoBulk->persist('country_group', $row);
                            break;
                        default:
                            # code...
                            break;
                    }
                }
            }
            $output .= " : Import Completed !!!" . "\n";
        }
    }
    echo $log['details'] = $output;
    $ioFiles->move('Processed');
    $reader->close();
}
catch (Exception $e) {
    echo $log['details'] = 'Failed import in IR Data. Details : ' . $e->getMessage();
    $log['status'] = 'ERROR';
}
$time_elapsed_secs     = microtime(true) - $start;
$log['execution_time'] = round($time_elapsed_secs, 4);
$pdoBulk->persist('data_import_logs', $log);