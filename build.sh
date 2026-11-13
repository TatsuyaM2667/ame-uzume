#!/bin/sh
# ame-uzume をビルドする(POSIX sh。Odin dev-2026-08 以降)
set -eu
cd "$(dirname "$0")"
exec odin build . -out:ame-uzume -o:speed "$@"
