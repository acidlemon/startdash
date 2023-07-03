#!/bin/sh

if [ ! -f mitamae ]; then
    sh setup_mitamae.sh
fi

if [ ! -f node.yaml ]; then
    cp node.yaml.sample node.yaml
fi

./mitamae local -y node.yaml recipes.rb $@
