<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/config/config.php';

use Box\Spout\Writer\WriterFactory;
use Box\Spout\Common\Type;
use Box\Spout\Reader\ReaderFactory;

if (isset($argc) && isset($argv[1]) && isset($argv[2])) {
	$date  = $argv[1];
	$time  = $argv[2];
}
else {
	$date  = '2018-09-24';
	$time  = '11:00:00';
}


$reportData = file_get_contents('./docs/response.json'); //'http://172.30.239.11/api/v1/ButtonPress/getCompleteReport/?date='.$date.'&time='.$time
$reportData = json_decode($reportData);

$excelHeader = array('Sr No', 'Mobile', 'Counter', 'date');

if( $reportData->status->code == 200 && $reportData->data != '' ){	
	$excelData = $reportData->data->ByDate;
}

if( $reportData->status->code == 200 && $reportData->data != '' ){	
	$excelData2 = $reportData->data->ByTimeStamp;
}

$customTempFolderPath = '/tmp/';
$filePath = './Reports/report.xlsx';
$writer = WriterFactory::create(Type::XLSX);
$writer->setTempFolder($customTempFolderPath)
		->setShouldUseInlineStrings(true)
		->openToFile($filePath)
		->addRow($excelHeader)
		->addRows($excelData)
		->addNewSheetAndMakeItCurrent();
		$writer->addRow($excelHeader)
		->addRows($excelData2)
		->close();




