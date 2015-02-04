#!/bin/bash

#ETCD_URL=http://localhost:4001
#PUBLISH_IP=''

ETCD_TTL=45

curl ${ETCD_URL}/v2/keys/ldap/${PUBLISH_IP} -XPUT -d ttl=${ETCD_TTL} -d dir=true >/dev/null 2>&1

while [[ 1 ]]; do

	curl -f ${ETCD_URL}/v2/keys/ldap/${PUBLISH_IP} -XPUT -d ttl=${ETCD_TTL} -d dir=true -d prevExist=true >/dev/null 2>&1 || exit 1

	sleep 20
done
