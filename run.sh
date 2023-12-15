#!/bin/env bash

set -e

export LB_USE_SERVER=true # pkill parser3
export LB_SERVER_PORT=4500
export LB_SERVER_SHOW_ERRORS=true
export LB_SERVER_AUTH=hi

cd ../logbuster
source .settings
cd ../logbuster-server


[ $LB_USE_SERVER ] && \
    [ ! "$( lsof -Pi :$LB_SERVER_PORT -sTCP:LISTEN )" ] && \
    (
        echo run parser
        cd server
        ./parser3/parser3.cgi \
        -p $LB_SERVER_PORT \
        index.html \
        $([ $LB_SERVER_SHOW_ERRORS ] && echo 1 || echo 0) \
        "$LB_DATADIR" "$LB_MACHINESDIR" "$LB_SSHSCRIPTSDIR" "$LB_SERVER_AUTH" &
    )
