FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="Microsoft SQL Server JDBC Driver" \
        version="4.0"

COPY install.sh mssql-driver-image/install.properties /extensions/
COPY mssql-driver-image/modules /extensions/modules/

# Download the driver into the module folder
ADD http://clojars.org/repo/com/microsoft/sqlserver/sqljdbc4/4.0/sqljdbc4-4.0.jar \
    /extensions/modules/system/layers/openshift/com/microsoft/main/sqljdbc4.jar