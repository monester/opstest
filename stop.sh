#!/bin/sh

set -x

if test -f /etc/systemd/system/test_app.service; then
    /bin/systemctl stop test_app
fi
