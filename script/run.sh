#!/bin/bash

function finish {
  kill -9 `pidof php`
}

trap finish SIGTERM SIGKILL

DEFAULT_ENV=production_lab
DEFAULT_MAX_LIFETIME_SECONDS=100
DEFAULT_VERBOSE=1

echo "Docker > Starting video indexation container with params: ${ENV:-$DEFAULT_ENV} ${MAX_LIFETIME_SECONDS:-$DEFAULT_MAX_LIFETIME_SECONDS} ${VERBOSE:-$DEFAULT_VERBOSE}"

# modify the hosts file
bash /opt/script/updateHostsFile.sh

exec php /opt/miniproject/cli/workers/video-indexation.php ${ENV:-$DEFAULT_ENV} ${MAX_LIFETIME_SECONDS:-$DEFAULT_MAX_LIFETIME_SECONDS} ${VERBOSE:-$DEFAULT_VERBOSE}
