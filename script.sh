#!/bin/bash

log_file="logs/log_$(date +%F_%R).txt"
touch $log_file
echo "Cleaning local Processed files..." >> $log_file
rm ./docs/Processed/*
echo "Started downloading files..." >> $log_file
rsync -azP --remove-source-files cms_user@172.30.232.24:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp /cms/product_catelog_importer/docs/
echo "Cleaning remote Processed files..." >> $log_file
ssh cms_user@172.24.247.129 'rm /websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/Processed/*'
echo "Uploading latest Processed files to remote server" >> $log_file
scp -r  /cms/product_catelog_importer/docs/Processed/ cms_user@172.24.247.129:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/Processed/
# scp -r cms_user@172.24.247.114:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp /cms/product_catelog_importer/docs/
# scp -r cms_user@172.24.247.129:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/ /cms/product_catelog_importer/docs/
#rsync -avz --remove-source-files -e ssh cms_user@172.24.247.129:/websphere8/wasadmin/Idea/IdeaDataTransformation/MyIdeaApp/ /cms/product_catelog_importer/docs/

echo "All files are downloaded successfully." >> $log_file

php -e pdo_postpaid_packs.php >> $log_file
php -e pdo_postpaid_plans.php >> $log_file
php -e pdo_prepaid.php >> $log_file
