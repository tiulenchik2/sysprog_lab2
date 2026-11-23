#!/bin/bash
sudo apt install -y gcc make git time linux-tools-common linux-tools-$(uname -r)
git clone https://github.com/brendangregg/FlameGraph

# щоб perf працював без sudo
sudo sysctl kernel.perf_event_paranoid=-1
sudo sysctl kernel.kptr_restrict=0
