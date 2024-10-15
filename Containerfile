FROM ghcr.io/ublue-os/fedora-toolbox:latest

RUN dnf copr enable yorickpeterse/lua-language-server -y
COPY extra-packages install-devtools /
RUN dnf upgrade -y && \
    grep -v '^#' /extra-packages | xargs dnf install -y
RUN /install-devtools
RUN rm /extra-packages /install-devtools

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
