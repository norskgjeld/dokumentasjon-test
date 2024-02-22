#!/bin/bash

CURRENT_DIRECTORY=$(pwd | xargs basename)
if [ "$CURRENT_DIRECTORY" != "dokumentasjon-test" ]; then
    echo "Error: Must be run in repository root. You ran from $(pwd)"
    exit 1
fi

docker run --user "$(id -u)" --volume .:/data plantuml/plantuml -verbose -tsvg -output /data/docs/images/ /data/docs/**/*.md

echo "Remember to commit the generated PlantUML images!"