#!/bin/bash
set -e
NUM_WORKERS=3
VE_DIR="/Users/spatial/.virtualenvs/spatiallab"
PROJECT_DIR="/Users/spatial/Deployment/spatiallab"
# user/group to run as
USER=spatial
source $VE_DIR/bin/activate
cd $PROJECT_DIR
exec $VE_DIR/bin/gunicorn_django -b 0.0.0.0:9001 -w $NUM_WORKERS \
    --user=$USER --log-level=info \
    --log-file=-