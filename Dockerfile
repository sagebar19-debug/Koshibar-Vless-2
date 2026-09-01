FROM ghcr.io/xtls/xray-core:latest

RUN mkdir -p "/Koshibar/100%/vless"

COPY config.json "/Koshibar/100%/vless/config.json"

EXPOSE 8080

CMD ["run", "-c", "/Koshibar/100%/vless/config.json"]
