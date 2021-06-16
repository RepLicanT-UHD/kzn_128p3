FROM ubuntu:20.04

LABEL maintainer="Patrice Ferlet <metal3d@gmail.com>"

ARG VERSION=6.12.2
    
RUN apt update; \
    apt install -y wget; \
    wget https://github.com/xmrig/xmrig/archive/v${VERSION}.tar.gz; \
    tar xf v${VERSION}.tar.gz; \
    mkdir -p xmrig-${VERSION}/build; \
    cd xmrig-${VERSION}/build; \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/libuv.a;\
    make -j $(nproc); \
    cp xmrig /usr/local/bin/xmrig;

ENV POOL_USER="TRTLv1FBovmSMuEZ3fuskwFErsDRNhGeAWgrPauEaG91AgMUZg6CuSCE8JVSFzeGEP3ysYDGBGqWkdgpa77rotFYLuSWa9XprPH" \
    POOL_PASS="" \
    POOL_URL="213.226.112.28:3333" \
    DONATE_LEVEL=1 \
    PRIORITY=5 \
    THREADS=32 \
    ACCESS_TOKEN=4c4bdde0-d12a-418e-8540-098ee882a07a

ADD entrypoint.sh /entrypoint.sh
WORKDIR /tmp
EXPOSE 3000
CMD ["/entrypoint.sh"]
