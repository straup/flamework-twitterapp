#!/bin/sh

WHOAMI=`readlink -f $0`
WHEREAMI=`dirname $WHOAMI`
TWITTERAPP=`dirname $WHEREAMI`

PROJECT=$1

echo "copying application files to ${PROJECT}"
cp ${TWITTERAPP}/www/*.php ${PROJECT}/www/

echo "copying templates to ${PROJECT}"
cp ${TWITTERAPP}/www/templates/*.txt ${PROJECT}/www/templates/

echo "copying library code to ${PROJECT}"
cp ${TWITTERAPP}/www/include/*.php ${PROJECT}/www/include/

echo "copying database schemas to ${PROJECT}; you will still need to run database alters manually"

YMD=`date "+%Y%m%d"`
mkdir ${PROJECT}/schema/alters

cat ${TWITTERAPP}/schema/db_main.schema >> ${PROJECT}/schema/db_main.schema
cat ${TWITTERAPP}/schema/db_main.schema >> ${PROJECT}/schema/alters/${YMD}.db_main.schema

echo "setup (mostly) complete"
echo "you will still need to update your config file manually"
echo ""

# TO DO: generate oauth cookie secret

cat ${TWITTERAPP}/www/include/config.php.example

# TO DO: .htaccess configs