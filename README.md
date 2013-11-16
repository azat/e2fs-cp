
Use resize2fs/nc/dd to copy the whole partitions

It will useful in case you have partitions with many small files.

Example at `resize_copy.sh`

TODO
====

- getopt
- mount/unmount
- waitpid

NOTES
=====

- md5sum is 300-400 MB/s so it won't slow down copying
  (and it is used, just in case)