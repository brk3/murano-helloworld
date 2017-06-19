#!/bin/bash

pushd ~/murano/meta/io.murano
zip -r ~/io.murano.zip *
murano package-import --exists-action u ~/io.murano.zip
popd

zip -r hello_world.zip *
murano package-import --exists-action u ./hello_world.zip
