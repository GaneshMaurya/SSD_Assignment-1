#!/bin/bash

# a
echo "All direcotires:"
ls -l | grep '^d' | awk '{print $NF}'

echo

echo "Directory Size"
# b
du -h -d 1 | sort -h -k1 | awk '{printf("%s\t%sB\n", $NF, $1)}' | grep './' | cut -b 3-