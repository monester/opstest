#!/bin/sh

set -x

/bin/systemctl daemon-reload
/bin/systemctl enable test_app
/bin/systemctl start test_app
