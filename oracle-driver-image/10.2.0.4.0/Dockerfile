FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="Oracle JDBC Driver" \
        version="10.2.0.4.0"

COPY install.sh oracle-driver-image/10.2.0.4.0/install.properties /extensions/
COPY oracle-driver-image/10.2.0.4.0/modules /extensions/modules/

# Download the driver into the module folder
ADD http://central.maven.org/maven2/com/oracle/ojdbc14/10.2.0.4.0/ojdbc14-10.2.0.4.0.jar \
    /extensions/modules/system/layers/openshift/com/oracle/main/