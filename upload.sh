#!/bin/bash

set -eux

export IMAGE_REG_URL=${IMAGE_REG_URL:-"repo-url"}

oc-mirror --v2 \
	  -c isc.yaml \
	  --authfile $(pwd)/auth.json \
	  --image-timeout 30m0s \
	  --dest-tls-verify=false \
	  --parallel-images=4 \
	  --retry-delay=5s \
	  --retry-times=5 \
	  --port 55002 \
          --log-level debug \
	  --cache-dir $(pwd)/netobserv \
	  --from file://mirror/ docker://${IMAGE_REG_URL}
