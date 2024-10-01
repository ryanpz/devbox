FROM ghcr.io/ublue-os/fedora-toolbox:latest

COPY extra-packages /
RUN dnf upgrade && \
    grep -v '^#' /extra-packages | xargs dnf install -y
RUN rm /extra-packages

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
