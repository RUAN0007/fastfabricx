#!/bin/bash
source base_parameters.sh

p_addr=$(hostname)

export FABRIC_LOGGING_SPEC=INFO
export CORE_PEER_MSPCONFIGPATH=${FABRIC_CFG_PATH}/crypto-config/peerOrganizations/${PEER_DOMAIN}/peers/${p_addr}.${PEER_DOMAIN}/msp

export CORE_PEER_ID=${p_addr}
export CORE_PEER_ADDRESS=${p_addr}:7051
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=${p_addr}:7051
export CORE_PEER_CHAINCODEADDRESS=${p_addr}:7052
export CORE_PEER_GOSSIP_USELEADERELECTION=false
export CORE_PEER_GOSSIP_ORGLEADER=false

rm ${CORE_PEER_FILESYSTEMPATH} -r # clean up data from previous runs
# rm /var/hyperledger/production/* -r # clean up data from previous runs
# (cd ${FABRIC_ROOT}/peer/ && go install)

if [ "$#" -eq 1 ]; then
    SCHEDULER_TYPE=sharp fastpeerX node start -s --storageAddr $p_addr:10000  > /data/ruanpc/faststorage_log 2>&1 &
else
    fastpeer node start -s --storageAddr $p_addr:10000  > /data/ruanpc/faststorage_log 2>&1 &
fi
