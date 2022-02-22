#!/bin/bash

Gotify_URL="https://notif.domain.tld/"
Gotify_Token="token"

notify()
{
        curl -X POST -s \
                -F "title=${1}" \
                -F "message=${2}" \
                "${Gotify_URL}/message?token=${Gotify_Token}"

}

exec &> /dev/zero
MYPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

apt update

Packages=$(apt-get -s dist-upgrade | awk '/^Inst/ { print $2 }' 2>&1)
NUM_Packages=$(echo "$Packages" | wc -l)

if [ "$Packages" != "" ]
then
        notify "Updates found for ${HOSTNAME}" "$NUM_Packages packages require an update: $Packages"
fi

if [ -f /var/run/reboot-required ];
then
        # List packages that need a reboot
        Reboot_Packages=$(cat /var/run/reboot-required.pkgs)
        notify "${HOSTNAME} requires a reboot" "${Reboot_Packages}"
fi