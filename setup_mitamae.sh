#!/bin/sh

set +x

MITAMAE_VERSION=`curl -s https://api.github.com/repos/itamae-kitchen/mitamae/releases/latest | grep tag_name | cut -d : -f 2,3 | tr -d \",\ `

if [ ! -f mitamae ]; then
    OS=`uname | tr "[:upper:]" "[:lower:]"`
    ARCH=`uname -m`

    echo "Downloading mitamae ${MITAMAE_VERSION} for ${OS}-${ARCH}"
    curl -sL https://github.com/itamae-kitchen/mitamae/releases/download/${MITAMAE_VERSION}/mitamae-${ARCH}-${OS} > mitamae
    chmod +x mitamae

    echo "completed."
fi
