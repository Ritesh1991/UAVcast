#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $DIR/../DroneConfig.cfg
if [[ $GCS_address =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]];
 then
    ip=$GCS_address
  else
  ip=`dig +short $GCS_address`
fi
echo Ground Control IP adress: $ip
sudo $DIR/./udp_redirect 0.0.0.0 14550 $ip 14550 &
