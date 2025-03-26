FROM ghcr.io/ublue-os/fedora-toolbox:latest

RUN dnf5 copr enable yorickpeterse/lua-language-server -y
COPY extra-packages install-devtools /
RUN dnf5 upgrade -y && \
    grep -v '^#' /extra-packages | xargs dnf5 install -y
RUN /install-devtools
RUN rm /extra-packages /install-devtools

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
