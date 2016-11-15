# video-index-worker
Docker container for Miniplay's Youtube video indexation workers

Note: You'll need to have a hosts file under the script/ folder to run the worker properly as the container does not recognizes some aliases.

# build image and run container

``` docker build --tag "miniplay/video-index-worker"  --no-cache=true . ```

``` docker run -it --name=worker-01 \
-e ENV=desired_environment \
-e VERBOSE=0 \
-e MAX_LIFETIME_SECONDS=60 \
-h worker-hostname \
-v /path/to/miniproject/:/opt/miniproject \
miniplay/video-index-worker ```

