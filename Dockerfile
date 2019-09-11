FROM ubuntu:18.04
LABEL maintainer "ryosuke ando<ryo@ando.link>"

RUN apt update && apt install -y nodejs npm git curl python wget sshfs tmux supervisor fish \
    && git clone https://github.com/c9/core.git /c9 \
    && curl -s -L https://raw.githubusercontent.com/c9/install/master/link.sh | bash \
    && mkdir -p /workspace \
    && cd /c9 \
    && ./scripts/install-sdk.sh

VOLUME ["/workspace"]
WORKDIR /workspace

EXPOSE 8080

ENV USERNAME user
ENV PASSWORD pass

ENTRYPOINT ["sh", "-c", "/usr/bin/nodejs /c9/server.js -l 0.0.0.0 -p 8080 -w /workspace -a $USERNAME:$PASSWORD"] 