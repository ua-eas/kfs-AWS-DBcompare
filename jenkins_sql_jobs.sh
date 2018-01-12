#continue on error
set +e

DB_USERNAME="kulowner"

# Put the ARCHIVE name for the TAR file
ARCHIVE=$ARCHIVE



echo "KFS3_DB_HOST=$KFS3_DB_HOST" >> jenkins_params.properties
echo "KFS3_DB_SERVICE=$KFS3_DB_SERVICE" >> jenkins_params.properties
echo "KFS7_DB_HOST=$KFS7_DB_HOST" >> jenkins_params.properties
echo "KFS7_DB_SERVICE=$KFS7_DB_SERVICE" >> jenkins_params.properties

cd $DIRECTORY


#KFS 3
#QUERY_FILE_3=${QUERY_FILE_3}_3.sql
QUERY_FILE_3=${QUERY_FILE_3}

#KFS 7
#QUERY_FILE_7=${QUERY_FILE_7}_7.sql
QUERY_FILE_7=${QUERY_FILE_7}


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

# because we have TWO different types of DBs for the moment need a flowdown and non flowdown version
if [ "$FLOWDOWN" == "true" ];
then
	sqlplus $DB_USERNAME/$STG_DB_PASSWORD@$KFS7_DB_HOST/$KFS7_DB_SERVICE @$QUERY_FILE_7 > sqlplus2.out
else 
	sqlplus $DB_USERNAME/$DB_PASSWORD@$KFS7_DB_HOST/$KFS7_DB_SERVICE @$QUERY_FILE_7 > sqlplus2.out
fi

date

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