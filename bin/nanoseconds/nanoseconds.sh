#!/bin/sh

# Yes this is a hack
# Not POSIX compliant since the diff header need not include nanoseconds
echo | diff -u /dev/null - | sed -n '2s/.*\(\.[0-9]*\).*/\1/p' | cut -d . -f 2
