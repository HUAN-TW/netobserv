#!/bin/bash

set -eux

oc-mirror --v2 \
	  --image-timeout 120m0s \
	  --parallel-images 4 \
	  --retry-delay 2s \
	  --retry-times 5 \
	  --port 55040 \
	  --cache-dir $(pwd)/netobserv \
	  -c isc.yaml file://mirror
