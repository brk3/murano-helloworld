#!/bin/bash

pushd ~/murano/meta/io.murano
zip -r ~/io.murano.zip *
murano package-import --exists-action u ~/io.murano.zip
popd

pushd ~/murano/meta/io.murano.applications
zip -r ~/io.murano.applications.zip *
murano package-import --exists-action u ~/io.murano.applications.zip
popd

zip -r hello_world.zip *
murano package-import --exists-action u ./hello_world.zip
