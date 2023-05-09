#!/bin/bash -eEu

set -o pipefail

find construct-hub \( -name '*.orig' -o -name '*.rej' \) -delete
patch -d construct-hub -p1 -R < patch
find construct-hub \( -name '*.orig' -o -name '*.rej' \) -delete
