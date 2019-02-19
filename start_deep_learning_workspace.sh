#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tag="pilillo/deep_learning_workspace"
version="0.1"

if [ $# -eq 0 ]; then
  echo "Please provide a python version 'v2' or 'v3'"
  exit 1
else
  [[ $1 = "v2" ]] && t="${tag}:${version}" || t="${tag}-py3:${version}"
fi

docker run \
--runtime=nvidia -it \
-p 8888:8888 -p 5000:5000 \
-v $DIR/workspace:/notebooks/workspace \
--memory="50g" --memory-swap="50g" \
-v $(which docker):/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
$t || {
  docker build -t $t -f $1/Dockerfile $1
}
#--entrypoint bash $t
