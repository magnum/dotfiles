#!/bin/sh
ENV_FILENAME=.env
if test -f .env.local; then
	ENV_FILENAME=.env.local
fi
echo "setting ENV from $ENV_FILENAME"
set -a; source $ENV_FILENAME; set +a
