# RPC rrd database

Install a one-minute check for establiched RPC connections for polkadot/Kusama RPC service.

Generates graphs.

## Installation
Run the creation of the rrd database

    rrdtool create rpcconnectionsdb.rrd --step=60 --start=now DS:rpcconnections:GAUGE:120:U:U RRA:AVERAGE:0.5:1:525960

## Update crontab
Add something like this with crontab -e

    */1 * * * * /root/rpc-rrd/ss.sh
    */1 * * * * /root/rpc-rrd/daygraph.sh
    */1 * * * * /root/rpc-rrd/hourgraph.sh

## Tools
Some tricks to query the data etc.

    rrdtool last # get time for last insertion: date +%s

    rrdtool fetch # get all

    rrdtool info # show info on a rrd db

