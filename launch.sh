#!/bin/bash

mode="release"

export AUTUMN_MONGO_URI="mongodb://localhost"
export AUTUMN_HOST="localhost:8001"
export JANUARY_HOST="localhost:7000"

cd ./revolt-backend-selfhosted
trap 'kill %1; kill %2; kill %3; kill %4' SIGINT
mold -run cargo run --$mode --bin revolt-delta & mold -run cargo run --$mode --bin revolt-bonfire & \
	cd ../autumn; mold -run cargo run --$mode & \
	cd ../january; mold -run cargo run --$mode
