#continue on error
set +e

DB_USERNAME="kulowner"

# Put the table name in ARCHIVE for the TAR file
TABLE_NAME=$TABLE_NAME

echo "KFS3_DB_HOST=$KFS3_DB_HOST" >> jenkins_params.properties
echo "KFS3_DB_SERVICE=$KFS3_DB_SERVICE" >> jenkins_params.properties
echo "KFS7_DB_HOST=$KFS7_DB_HOST" >> jenkins_params.properties
echo "KFS7_DB_SERVICE=$KFS7_DB_SERVICE" >> jenkins_params.properties

cd CM


#KFS 3
QUERY_FILE_3=${TABLE_NAME}_3.sql

#KFS 7
QUERY_FILE_7=${TABLE_NAME}_7.sql


#KFS 3 GOLD
KFS3_DB_HOST=$KFS3_DB_HOST
KFS3_DB_SERVICE=$KFS3_DB_SERVICE

# KFS 7 GOLD DB
KFS7_DB_HOST=$KFS7_DB_HOST
KFS7_DB_SERVICE=$KFS7_DB_SERVICE

mkdir data


date
sqlplus $DB_USERNAME/$DB_PASSWORD@$KFS3_DB_HOST/$KFS3_DB_SERVICE @$QUERY_FILE_3 > sqlplus1.out
date
sqlplus $DB_USERNAME/$STG_DB_PASSWORD@$KFS7_DB_HOST/$KFS7_DB_SERVICE @$QUERY_FILE_7 > sqlplus2.out
date

cd data
ls -lhatr 

#if there is an error like one file is missing, or any fail, set var error = true
diff -s * > diff_results.csv || error=true
    

date


tar -cvf $TABLE_NAME.tar.gz *
aws s3 cp --sse AES256 $TABLE_NAME.tar.gz s3://kfs-upgrade-db-validation/$TABLE_NAME.tar.gz
    
#Fail the build if there was an error
if [ $error ]
then 
    exit -1
fi
