FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && cd /root && mkdir /frp \
 && curl -OsL https://github.com/wangxisss/frpc/releases/download/29/frp_0.32.0_linux_amd64.zip \
 && unzip frp_0.32.0_linux_amd64 -d /frp \
 && cd /frp/frp_0.32.0_linux_amd64 \
 && chmod +x /frp/frp_0.32.0_linux_amd64/frpc \
 && chmod +x /frp/frp_0.32.0_linux_amd64/frpc.ini \
 && rm -rf /root/frp_0.32.0_linux_amd64.zip
CMD ["/frp/frp_0.32.0_linux_amd64/frpc", "-c /frp/frp_0.32.0_linux_amd64/frpc.ini"]
EXPOSE 22 9577
