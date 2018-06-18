FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="MariaDB JDBC Driver" \
        version="2.2.5"

COPY install.sh mariadb-driver-image/install.properties /extensions/
COPY mariadb-driver-image/modules /extensions/modules/

# Download the driver into the module folder
ADD http://central.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.2.5/mariadb-java-client-2.2.5.jar \
    /extensions/modules/system/layers/openshift/org/mariadb/main/mariadb-java-client.jar