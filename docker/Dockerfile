FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        archiso \
        make \
        bash \
        coreutils \
        curl \
        htmlq

WORKDIR /work

COPY Makefile build-iso.sh ./

CMD ["make"]
