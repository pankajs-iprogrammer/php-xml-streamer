#!/bin/bash

MUSER="root"
MPASS="iprogrammer123#"
MDB="my_idea_cms"
MHOST="localhost"

# MUSER="myidea"
# MPASS="Qwe123!@#"
# MDB="myideacms"
# MHOST="172.30.232.129"
MYSQL=$(which mysql)

log_file="logs/log_$(date +%F_%R).txt"
touch $log_file

# make sure we can connect to server
$MYSQL -u $MUSER -p$MPASS -h $MHOST -e "use $MDB"  &>/dev/null
if [ $? -ne 0 ]
then
	echo "Error - Cannot connect to mysql server using given username, password or database does not exits!" >> $log_file
	exit 2
fi

TABLES=(postpaid_plan postpaid_pack prepaid_pack)
for t in ${TABLES[@]};
do
	echo "Deleting data of $t table from $MDB database..." >> $log_file
	$MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e "truncate table $t" >> $log_file
done

echo "Started downloading files..." >> $log_file
# scp -r cms_user@172.24.247.114:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp /cms/product_catelog_importer/docs/
# scp -r cms_user@172.24.247.129:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/ /cms/product_catelog_importer/docs/
#rsync -avz --remove-source-files -e ssh cms_user@172.24.247.129:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/ /cms/product_catelog_importer/docs/

echo "All files are downloaded successfully." >> $log_file

php -e pdo_postpaid_packs.php >> $log_file
php -e pdo_postpaid_plans.php >> $log_file
php -e pdo_prepaid.php >> $log_file
