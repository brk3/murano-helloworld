#!/bin/bash

pushd ~/murano/meta/io.murano
zip -r ~/io.murano.zip *
murano package-import --exists-action u ~/io.murano.zip
popd

zip -r hello_world.zip *

murano package-import --exists-action u ./hello_world.zip

#cat << EOF > input.json
#[
    #{ "op": "add", "path": "/-", "value":
        #{
            #"instance": {
                #"name": "HelloWorld",
                #"image": "3c283ad4-2d50-4735-9295-2ec4613bd489",
                #"keyname": "mykey",
                #"flavor": "m1.tiny",
                #"assignFloatingIp": true,
                #"?": {
                    #"type": "io.murano.resources.LinuxMuranoInstance",
                    #"id": "===id1==="
                #}
            #},
            #"name": "HelloWorld",
            #"enablePHP": true,
            #"?": {
                #"type": "com.paul.HelloWorld",
                #"id": "===id2==="
            #}
        #}
    #}
#]
#EOF

#environment_name="HelloWorld-$(date +%s)"

#openstack environment create ${environment_name}

#environment_id=$(openstack \
                 #environment show \
                 #${environment_name} \
                 #-c id -f value)

#session_id=$(openstack \
             #environment session create \
             #${environment_id} \
             #-c id -f value)

#openstack environment apps edit \
  #--session-id ${session_id} ${environment_id} ./input.json

#openstack environment deploy \
  #--session-id ${session_id} ${environment_id}
