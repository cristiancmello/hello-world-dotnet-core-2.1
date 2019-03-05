FROM microsoft/dotnet:2.1-sdk-alpine

ARG WORKSPACE_USERNAME=workspace
ENV WORKSPACE_USERNAME ${WORKSPACE_USERNAME}

# Non-Root User
# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ARG PGID=1000

ENV PUID ${PUID}
ENV PGID ${PGID}

RUN addgroup -g ${PGID} ${WORKSPACE_USERNAME}
RUN adduser -D -u ${PUID} -G ${WORKSPACE_USERNAME} ${WORKSPACE_USERNAME}

RUN apk add --no-cache \
    curl \
    procps

# Install vsdbg
RUN curl -sSL https://aka.ms/getvsdbgsh | sh /dev/stdin -v latest -l /vsdbg

WORKDIR /app

ENTRYPOINT ["tail", "-f", "/dev/null"]