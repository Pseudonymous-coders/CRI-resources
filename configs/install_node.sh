#!/bin/bash

NODEBREW="https://github.com/hokaccha/nodebrew/archive/v0.9.8.tar.gz"

echo "Downloading node"
curl -Ls "$NODEBREW" | bash

echo "Intalling node"

