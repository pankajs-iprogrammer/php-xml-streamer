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