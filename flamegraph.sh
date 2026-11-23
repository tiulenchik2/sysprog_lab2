#!/bin/bash
# ./flamegraph.sh prog_O0

mkdir -p results
perf record -F 999 -g -o perf.data ./$1
perf script -i perf.data > out.perf
./FlameGraph/stackcollapse-perf.pl out.perf > results/$1.folded
./FlameGraph/flamegraph.pl results/$1.folded > results/$1.svg
rm out.perf
