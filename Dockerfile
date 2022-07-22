FROM alpine:3.13 as build

RUN mkdir /rootfs
ADD https://alpha.de.repo.voidlinux.org/live/current/void-aarch64-ROOTFS-20210930.tar.xz /rootfs
WORKDIR /rootfs
RUN tar xvf *.tar.xz
RUN rm -rf *.tar.xz

FROM scratch

COPY --from=build /rootfs /

RUN xbps-install -Sy \
  neovim lua git wget curl \
  python3 python3-pip python python-pip base-devel go

ADD . /root/.config/nvim

WORKDIR /root/.config/nvim
RUN nvim +PaqInstall +q

CMD ["nvim"]
