<?php

function checkIfRecordExist($pdo, $ItemID, $table)
{
    // select a particular user by id
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE ItemID=:ItemID");
    $stmt->execute(['ItemID' => $ItemID]);
    $item = $stmt->fetchAll();
    if (is_array($item)) {
        return @$item[count($item) - 1];
    } else {
        return false;
    }
}

function getMaxId($pdo, $table)
{
    // select a particular user by id
    $stmt = $pdo->prepare("SELECT max(id) FROM $table");
    $stmt->execute();
    $item = $stmt->fetch();
    if (is_array($item) && @$item[0] > 0) {
        return @$item[0];
    } else {
        return 0;
    }
}

function deleteData($pdo, $ItemID, $table)
{
    $stmt = $pdo->prepare("DELETE FROM $table WHERE ItemID=:ItemID  AND Type = 'Item'");
    $stmt->execute(['ItemID' => $ItemID]);
    return true;
}

function showError($error, $row){
    echo json_encode(array( "error" => $error, "data" => $row ));
    die();
}

function exception_handler($exception) {
  echo "Uncaught exception: " , $exception->getMessage(), "\n";
}

function createQuery($table, $columns, $data) {
    $query = "INSERT INTO $table (".implode(",", $columns).") VALUES ";
    $values = "";
    $update = " ON DUPLICATE KEY UPDATE ";
    foreach ($columns as $column) {
        $update .= "$column = values($column), ";    
    }
    $update = substr($update, 0, strlen($update) - 2);
    foreach ($data as $i => $row) {
        $i++;
        $flag = 0;
        $values .= '('.implode(",", $row).'), ';
        if($i % MAX_QUERY_SIZE == 0) {
          $flag = 1;
          $values = substr($values, 0, strlen($values) - 2);
          $insert_query = $query . $values. $update;
          executeQuery($insert_query);
          $values = '';  
        }
    }
    if ($flag === 0) {
        executeQuery($insert_query);
    }
    return true;
}

function executeQuery($query) {
    $result = mysqli_query( $GLOBALS["conn"], $query)
    OR showError(mysqli_error($GLOBALS["conn"]), $query);
    return ($result) ? true : false;
}