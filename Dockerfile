FROM alpine:3.6
RUN apk --no-cache add curl zip && \
    curl -L -o /trakt-for-plex.zip https://github.com/trakt/Plex-Trakt-Scrobbler/releases/download/v1.3.2/trakt_for_plex-1.3.2-1399686-linux_x86_64.zip && \
    unzip trakt-for-plex.zip

FROM plexinc/pms-docker:1.9.1.4272-b207937f1
COPY --from=0 ["/Trakttv.bundle", "/config/Library/Application Support/Plex Media Server/Plug-ins/Trakttv.bundle"]
