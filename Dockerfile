ARG RELEASE=7

FROM centos:${RELEASE}

LABEL authors="Vincent 'bigbrozer' BESANCON <besancon.vincent@gmail.com>"
LABEL package_name='netdata'
LABEL package_sources='https://github.com/firehol/netdata'

RUN set -ex \
        && mkdir -p /build/dist /build/patches /build/src

RUN set -ex \
        && yum -y install epel-release \
        && yum clean all \
        && rm -rf /var/cache/yum/*

RUN set -ex \
        && yum -y install \
                autoconf \
                automake \
                curl \
                gcc \
                git \
                jq \
                libmnl-devel \
                libuuid-devel \
                make \
                pkgconfig \
                redhat-rpm-config \
                rpm-build \
                yum-utils \
                zlib-devel \
                libuv-devel\
                gcc-c++\
                autoconf-archive\
                autogen\
                openssl-devel\
                Judy-devel\
                lz4-devel\
                nc\
                json-c-devel\
                freeipmi-devel\
                snappy-devel\
                protobuf-devel\
                protobuf-c-devel\
        && yum clean all \
        && rm -rf /var/cache/yum/*

COPY patches/* /build/patches
COPY build-netdata.sh /build

CMD ["/build/build-netdata.sh"]
