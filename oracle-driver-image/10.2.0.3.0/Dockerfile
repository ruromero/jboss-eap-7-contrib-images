FROM jboss-eap-7-contrib-base

LABEL   maintainer="rromerom@redhat.com" \
        name="Oracle JDBC Driver" \
        version="10.2.0.3.0"

COPY install.properties /extensions

# Download the driver into the module folder
ADD http://central.maven.org/maven2/com/oracle/ojdbc14/10.2.0.3.0/ojdbc14-10.2.0.3.0.jar \
    /extensions/modules/system/layers/openshift/org/apache/derby/main/