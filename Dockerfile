FROM fedora:39

RUN dnf update -y && \
    dnf install -y \
    git \
    gcc \
    atk-devel \
    cairo-devel \
    freetype-devel \
    fontconfig-devel \
    dbus-devel \
    giflib-devel \
    glibc-devel \
    libgccjit-devel \
    libpng-devel \
    libjpeg-turbo-devel \
    libjpeg-turbo \
    libtiff-devel \
    libX11-devel \
    libXau-devel \
    libXdmcp-devel \
    libXrender-devel \
    libXt-devel \
    libXpm-devel \
    ncurses-devel \
    xorg-x11-proto-devel \
    zlib-devel \
    gnutls-devel \
    librsvg2-devel \
    m17n-lib-devel \
    libotf-devel \
    libselinux-devel \
    alsa-lib-devel \
    gpm-devel \
    liblockfile-devel \
    libxml2-devel \
    autoconf \
    bzip2 \
    cairo \
    texinfo \
    gzip \
    desktop-file-utils \
    libacl-devel \
    harfbuzz-devel \
    jansson-devel \
    systemd-devel \
    lcms2-devel \
    systemd-rpm-macros \
    libtree-sitter-devel \
    gtk3-devel \
    webkit2gtk3-devel \
    gnupg2

RUN git clone --depth 1 --branch emacs-29.1 https://github.com/emacs-mirror/emacs.git

WORKDIR /emacs

RUN ./autogen.sh && \
    ./configure --with-dbus --with-gif --with-jpeg --with-png --with-rsvg \
            --with-tiff --with-xft --with-xpm --with-gpm=no \
            --with-xwidgets --with-modules --with-harfbuzz --with-cairo --with-json \
            --with-tree-sitter --with-pgtk --with-native-compilation && \
     make -j$(nproc)

RUN src/emacs --batch --version
