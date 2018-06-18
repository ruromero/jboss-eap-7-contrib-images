FROM scratch

LABEL   maintainer="rromerom@redhat.com" \
        name="Derby JDBC Driver" \
        version="10.12.1.1"

COPY install.sh derby-driver-image/install.properties /extensions/
COPY derby-driver-image/modules /extensions/modules/

# Download the driver into the module folder
ADD https://repo1.maven.org/maven2/org/apache/derby/derbyclient/10.12.1.1/derbyclient-10.12.1.1.jar \
    extensions/modules/system/layers/openshift/org/apache/derby/main/derbyclient.jar

ADD https://repo1.maven.org/maven2/org/apache/derby/derby/10.12.1.1/derby-10.12.1.1.jar \
    extensions/modules/system/layers/openshift/org/apache/derby/main/derby.jar