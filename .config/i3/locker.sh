#!/bin/bash

# lock screen with i3lock
#### i3lock -c000000 --show-failed-attempts && sleep 1
XSECURELOCK_SHOW_USERNAME=0 XSECURELOCK_SHOW_HOSTNAME=0 XSECURELOCK_SHOW_DATETIME=1 XSECURELOCK_PASSWORD_PROMPT=kaomoji xsecurelock
