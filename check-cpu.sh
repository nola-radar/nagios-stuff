#!/bin/sh
#
# Check CPU usage by percentage
# Run this via SSH on Nagios
# Note: This only works on Linux
# Note: It uses 'top -bn4' if you have 4 CPUs

# Get number of CPUs
cpus=$(echo "-bn`cat /proc/cpuinfo | grep processor | wc -l`")

top $cpus | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'
