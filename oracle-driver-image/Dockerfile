FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="Oracle JDBC Driver" \
        version="12.1.0.1"

COPY install.sh oracle-driver-image/install.properties /extensions/
COPY oracle-driver-image/modules /extensions/modules/

# Download the driver into the module folder
# ADD http://central.maven.org/maven2/com/oracle/ojdbc7/12.1.0.1/ojdbc7-12.1.0.1.jar \
#    /extensions/modules/system/layers/openshift/com/oracle/main/ojdbc7.jar