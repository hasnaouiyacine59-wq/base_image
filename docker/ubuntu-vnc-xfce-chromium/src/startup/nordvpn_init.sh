#!/bin/bash
set -e

### Initialize TUN device for NordVPN
if [ ! -c /dev/net/tun ]; then
    echo "Creating /dev/net/tun ..."
    if [ ! -d /dev/net ]; then
        mkdir -p /dev/net
    fi
    mknod /dev/net/tun c 10 200
    chmod 666 /dev/net/tun
fi

### Start nordvpnd if not already running
if ! pgrep -x nordvpnd > /dev/null 2>&1; then
    echo "Starting nordvpnd ..."
    nordvpnd &
    sleep 2
fi

echo "NordVPN init complete"
