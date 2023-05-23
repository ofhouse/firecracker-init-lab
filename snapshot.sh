#!/bin/bash

mkdir ./snapshots

sudo curl --unix-socket /tmp/firecracker.socket -i \
    -X PATCH 'http://localhost/vm' \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
            "state": "Paused"
    }'

sudo curl --unix-socket /tmp/firecracker.socket -i \
    -X PUT 'http://localhost/snapshot/create'   \
    -H  'Accept: application/json'          \
    -H  'Content-Type: application/json'    \
    -d '{ 
        "mem_file_path": "./snapshots/mem.snap" ,
        "snapshot_path": "./snapshots/disk.snap"
    }'

sudo curl --unix-socket /tmp/firecracker.socket -i \
    -X PATCH 'http://localhost/vm' \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d '{
            "state": "Resumed"
    }'
