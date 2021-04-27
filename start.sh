#!/bin/bash

env  # debug

# note: don't quote parameters - they won't be unquoted
CMD="manet --port ${PORT} --engine ${ENGINE} --level ${DEBUG_LEVEL}"
test -n "${PASSWORD}" && CMD="$CMD --security:basic:username ${USER} --security:basic:password ${PASSWORD}"

echo "CMD: $CMD" #debug

exec $CMD