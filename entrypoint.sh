#!/bin/bash
set -e

# Add command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running the service
if [ "$1" = 'elasticsearch' ]; then
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
	exec gosu elasticsearch "$@"
fi

# Assume user wanting to run own process e.g. `bash` to explore this image.
exec "$@"
