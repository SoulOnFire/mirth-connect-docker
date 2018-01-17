#! /bin/bash

set -e

if [ "$1" = 'java' ]; then
    if [ -f /opt/mirth-connect/conf/mirth.properties_env ]; then
        echo "Setting mirth.properties from environment"
        envsubst < /opt/mirth-connect/conf/mirth.properties_env > /opt/mirth-connect/conf/mirth.properties
    fi
    chown -R mirth /opt/mirth-connect/appdata

    exec gosu mirth "$@"
fi

exec "$@"
