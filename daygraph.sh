#!/bin/bash

RRD_DB=/root/rpc-rrd/rpcconnectionsdb.rrd
GRAPH_DIR=.
HOUR=3600
DAY=$((24*$HOUR))
YEAR=$((365*$DAY))

COLOR="#CC0000"

# past hour
rrdtool graph $GRAPH_DIR/kusama-rpc-connections-last-day.png  \
--width 800 --height 200 \
--start -$DAY  --end -1 \
--vertical-label "Connections" \
--title "Dwellir RPC Kusama (Last 24h)" \
DEF:connections=$RRD_DB:rpcconnections:AVERAGE \
LINE1:connections$COLOR:"Established connections"

