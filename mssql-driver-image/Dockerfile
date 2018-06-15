FROM jboss-eap-7-contrib-base

LABEL   maintainer="rromerom@redhat.com" \
        name="Microsoft SQL Server JDBC Driver" \
        version="4.0"

COPY install.properties /extensions

# Download the driver into the module folder
ADD http://clojars.org/repo/com/microsoft/sqlserver/sqljdbc4/4.0/sqljdbc4-4.0.jar \
    /extensions/modules/system/layers/openshift/org/apache/derby/main/