#!/bin/bash

make
mkdir -p results

lscpu > results/cpu.txt

for p in prog_O0 prog_O3 prog_ikj; do
    echo "=== $p ==="

    # 1. flamegraph
    ./flamegraph.sh $p

    # 2.1 time
    /usr/bin/time --verbose ./$p 2> results/${p}_time.txt

    # 2.2 perf stat
    perf stat -d ./$p 2> results/${p}_stat.txt

    # 2.3 perf record + report
    perf record -g ./$p
    perf report --stdio --no-children > results/${p}_report.txt

    # 3. енергія всієї системи під час роботи програми
    perf stat -a -e power/energy-pkg/ ./$p 2> results/${p}_energy.txt
done

# 1. flamegraph всієї системи
perf record -F 99 -a -g -o perf.data ./prog_O0
perf script -i perf.data > out.perf
./FlameGraph/stackcollapse-perf.pl out.perf > results/system.folded
./FlameGraph/flamegraph.pl results/system.folded > results/system.svg
rm out.perf

# 3. енергія в простої (10 сек) - щоб відняти від енергії програми
perf stat -a -e power/energy-pkg/ sleep 10 2> results/idle_energy.txt

# 4.3 різниця flamegraph до і після
./FlameGraph/difffolded.pl -n results/prog_O0.folded results/prog_O3.folded | ./FlameGraph/flamegraph.pl > results/diff.svg

rm -f perf.data perf.data.old
