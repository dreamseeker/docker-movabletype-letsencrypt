#!/bin/bash

# Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi

# Make directory if it does not exist.
mkdir -p $CMS_BASE_PATH

# Copy mt-config.cgi
cp ./docker/config/mt-config.cgi $CMS_BASE_PATH/mt-config.cgi

# Change Working directory
cd $CMS_BASE_PATH

# Modified mt-config.cgi
sed -i "" 's:CGIPath /mt/:CGIPath '${CMS_BASE_PATH#.}'/:g' mt-config.cgi
sed -i "" 's:StaticWebPath /mt/mt-static:StaticWebPath '${CMS_BASE_PATH#.}'/mt-static:g' mt-config.cgi
sed -i "" 's:Database mt7\-db:Database '$MYSQL_DATABASE':g' mt-config.cgi
sed -i "" 's:DBUser root:DBUser '$MYSQL_USER':g' mt-config.cgi
sed -i "" 's:DBPassword root:DBPassword '$MYSQL_PASSWORD':g' mt-config.cgi
sed -i "" 's:DBHost mt7\-db:DBHost '$CONTAINER_BASE_NAME'-db:g' mt-config.cgi

exit 0
