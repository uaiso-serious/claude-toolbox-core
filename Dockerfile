FROM ghcr.io/uaiso-serious/claude-runtime:latest

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      bash bash-completion gnupg \
      findutils grep sed gawk diffutils patch file less tree \
      tar gzip bzip2 xz-utils zstd zip unzip \
      procps bc gettext-base \
      locales tzdata tini \
      xxd nano vim \
 && rm -rf /var/lib/apt/lists/*

COPY rootfs/etc/ /etc/

USER agent

COPY --chown=agent:agent rootfs/home/agent/ /home/agent/

ENV MISE_YES=1 \
    MISE_IDIOMATIC_VERSION_FILE_ENABLE_TOOLS=node,python
RUN mise install && mise reshim
