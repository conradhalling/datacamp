#!/usr/bin/env bash
set -euo pipefail
# set -vx

# USAGE
#   bash copy_log_file_if_good.bash filename
# DESCRIPTION
#   Copy the specified log file to the good_logs subdirectory if the
#   file contains the string "SVRM_" and the string "vpt".

# Create variable from first ARGV element
sfile=$1
# Create an IF statement on sfile's contents
if grep -q 'SRVM_' $sfile && grep -q 'vpt' $sfile ; then
    # Copy file if matched
    cp $sfile good_logs/
fi
