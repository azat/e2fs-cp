#!/usr/bin/env bash

# TODO: add common consts
port=255

for fs in $*; do
    nc -nlp $port | tee -a >(md5sum >&2) | dd of=$fs oflag=direct iflag=fullblock bs=16k
done

