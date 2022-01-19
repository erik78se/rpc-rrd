#!/bin/bash
set -x
#
# https://donfuge.wordpress.com/2014/05/11/data-logging-and-graphing-using-rrdtool/
# rrdtool create rpcconnectionsdb.rrd --step=60 --start=now DS:rpcconnections:GAUGE:120:U:U RRA:AVERAGE:0.5:1:525960
# NOTE! Heartbeat value (120) must be larger than step (60) value.
# 
#
VALUE=$(ss -o state established '( dport = :9966 )' | wc -l)
VALUE=$(expr ${VALUE} - 1) # -1 for header
rrdtool update /root/rpc-rrd/rpcconnectionsdb.rrd N:${VALUE}

