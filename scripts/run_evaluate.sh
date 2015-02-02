#!/usr/bin/env bash
#
# Evaluate and save to file
set -e

usage="Usage: $0 GOLD SYSTEM"

if [ "$#" -ne 2 ]; then
    echo $usage
    exit 1
fi

gold=$1; shift # prepared gold standard annotations (.combined.tsv)
sys=$1; shift # prepared system annotations (.combined.tsv)

out=`echo $sys | sed 's/.combined.tsv/.evaluation/'`
python -m cProfile nel.py evaluate \
    -m all \
    -f 'tab' \
    -g $gold \
    $sys \
    > $out
