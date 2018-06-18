FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="IBM DB2 JDBC Driver" \
        version="10.1"

COPY install.sh db2-driver-image/install.properties /extensions/
COPY db2-driver-image/modules /extensions/modules/

# Download the driver into the module folder
ADD https://artifacts.alfresco.com/nexus/content/repositories/public/com/ibm/db2/jcc/db2jcc4/10.1/db2jcc4-10.1.jar \
    /extensions/modules/system/layers/openshift/com/ibm/main/