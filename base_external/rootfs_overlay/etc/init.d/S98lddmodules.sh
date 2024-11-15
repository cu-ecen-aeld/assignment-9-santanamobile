#!/bin/sh
# Script to load/unload drivers

set -e

# Common functions
get_group()
{
    grep -q '^staff:' /etc/group && echo "staff" || echo "wheel"
}

create_device()
{
    device=$1
    major=$2
    minor=$3
    mode=$4
    group=$5
    rm -f /dev/${device}${minor}
    mknod /dev/${device}${minor} c $major $minor
    chgrp $group /dev/${device}${minor}
    chmod $mode /dev/${device}${minor}
}

load_driver()
{
    module=$1
    mode="664"
    group=$(get_group)

    modprobe $module
    major=$(awk "\$2==\"$module\" {print \$1}" /proc/devices)

    [ -z "$major" ] && echo "No device found for $module" && return

    create_device $module $major 0 $mode $group
}

unload_driver()
{
    module=$1
    rmmod $module || exit 1
    rm -f /dev/${module}*
}

# Load/unload specific modules
load_scull()
{
    module="scull"
    group=$(get_group)
    mode="664"

    modprobe $module
    major=$(awk "\$2==\"$module\" {print \$1}" /proc/devices)

    for minor in $(seq 0 11); do
        create_device $module $major $minor $mode $group
    done

}

unload_scull()
{
    unload_driver "scull"
}

# Main script logic
case $1 in
    start)
        load_scull
        load_driver "faulty"
        load_driver "hello"
        ;;
    stop)
        unload_driver "hello"
        unload_driver "faulty"
        unload_scull
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
