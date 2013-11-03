#!/usr/bin/env bash

set -e
set -x

function get_uuid()
{
    # TODO: or accept mount points instead of block devices
    fstab_line=$(grep ext4 /etc/fstab | egrep -v ' (/usr|/|/home|/var|) ' | tail -n+$get_uuid_i | head -n1)

    echo "$fstab_line" | cut -d' ' -f1 | cut -d= -f2
}

get_uuid_i=1
for fs in $*; do
    tune2fs $fs -U $(get_uuid $fs)
    let ++get_uuid_i
done

