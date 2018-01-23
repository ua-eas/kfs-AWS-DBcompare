#!/bin/bash

#continue on error
set +e

DB_USERNAME="kulowner"

# Put the ARCHIVE name for the TAR file
ARCHIVE=$ARCHIVE



echo "KFS3_DB_HOST=$KFS3_DB_HOST" >> jenkins_params.properties
echo "KFS3_DB_SERVICE=$KFS3_DB_SERVICE" >> jenkins_params.properties
echo "KFS7_DB_HOST=$KFS7_DB_HOST" >> jenkins_params.properties
echo "KFS7_DB_SERVICE=$KFS7_DB_SERVICE" >> jenkins_params.properties
echo "FLOWDOWN=$FLOWDOWN" >> jenkins_params.properties


echo "KFS3_DB_HOST=$KFS3_DB_HOST"
echo "KFS3_DB_SERVICE=$KFS3_DB_SERVICE" 
echo "KFS7_DB_HOST=$KFS7_DB_HOST" 
echo "KFS7_DB_SERVICE=$KFS7_DB_SERVICE" 
echo "FLOWDOWN=$FLOWDOWN" 


cd $DIRECTORY


#KFS 3
#QUERY_FILE_3=${QUERY_FILE_3}_3.sql
QUERY_FILE_3=${QUERY_FILE_3}

#KFS 7
#QUERY_FILE_7=${QUERY_FILE_7}_7.sql
QUERY_FILE_7=${QUERY_FILE_7}

sed -i "s/DBLINK/$KFS7_DB_SERVICE/" $QUERY_FILE_3


#KFS 3 
KFS3_DB_HOST=$KFS3_DB_HOST
KFS3_DB_SERVICE=$KFS3_DB_SERVICE

# KFS 7 
KFS7_DB_HOST=$KFS7_DB_HOST
KFS7_DB_SERVICE=$KFS7_DB_SERVICE

mkdir data


date
sqlplus $DB_USERNAME/$DB_PASSWORD_NON_FLOWDOWN@$KFS3_DB_HOST/$KFS3_DB_SERVICE @$QUERY_FILE_3 > sqlplus1.out
date

# because we have TWO different types of DBs for the moment need a flowdown and non flowdown version
# NOT USED at this time because we are using DB LINKS.  All Jenkins jobs have a FLOWDOWN boolean that can be used
# I am leaving it in just in case I need to run against a flowed down DB.
#if [ -z $FLOWDOWN  ];
#then
#	sqlplus $DB_USERNAME/$DB_PASSWORD_FLOWDOWN@$KFS7_DB_HOST/$KFS7_DB_SERVICE @$QUERY_FILE_7 > sqlplus2.out
#else 
#	sqlplus $DB_USERNAME/$DB_PASSWORD_NON_FLOWDOWN@$KFS7_DB_HOST/$KFS7_DB_SERVICE @$QUERY_FILE_7 > sqlplus2.out
#fi



cd data
ls -lhatr 

#if there is an error like one file is missing, or any fail, set var error = true
diff -s * > diff_results.csv || error=true
    

date


zip $ARCHIVE.zip *
aws s3 cp --sse AES256 $ARCHIVE.zip s3://kfs-upgrade-db-validation/$ARCHIVE.zip

    
#Fail the build if there was an error
if [ $error ]
then 
    exit -1
fi
