FROM ghcr.io/logscale-contrib/image-logscale-base/container:1.0.3

#
# Pull Zulu OpenJDK binaries from official repository:
#

ARG ZULU_VERSION_LOCK="19.0.1-*"
ARG ZULU_MAJOR=19
RUN dnf versionlock zulu${ZULU_MAJOR}-*-${ZULU_VERSION_LOCK} ;\
    dnf -y install zulu${ZULU_MAJOR}-jdk ;\
    dnf clean all 

ENV JAVA_HOME=/usr/lib/jvm/zulu${ZULU_MAJOR}

# ENTRYPOINT [ "/entrypoint.sh" ]
