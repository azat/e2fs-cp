#!/usr/bin/env bash

#
# Aggregate functional of all helpers
# from this utils
#
# TODO: This script is just as an example
#

function copy_scripts()
{
    ssh $1 mkdir -p ~/resize_copy
    scp *.sh $1:~
}

set -e
set -x

dst=$1
src=$2
shift
shift

copy_scripts $src
copy_scripts $dst

ssh $src ~/resize_copy/e2fsck.sh $*
ssh $src ~/resize_copy/resize2fs.sh $*
ssh $dst ~/resize_copy/image_receiver.sh $* &
ssh $src ~/resize_copy/image_sender.sh $dst $*
ssh $dst ~/resize_copy/uuid.sh $*

ssh $src ~/resize_copy/enlarge2fs.sh $*
ssh $dst ~/resize_copy/enlarge2fs.sh $*

