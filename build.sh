#!/bin/bash

    cp docker-compose-template.yml docker-compose.yml 
    export MINER_TAG=$(curl -s 'https://quay.io/api/v1/repository/team-helium/miner/tag/?limit=100&page=1&onlyActiveTags=true' | jq -c '[ .tags[] | select( .namecontains("arm")) ][0].name' | cut -d'"' -f2)
    sed.exe s/MINER_TAG/$MINER_TAG/g docker-compose.yml > docker-temp.yml
   
