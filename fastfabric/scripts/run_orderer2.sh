#!/bin/bash
source base_parameters.sh

export FABRIC_LOGGING_SPEC=INFO
export ORDERER_GENERAL_LISTENADDRESS=${ORDERER_ADDRESS2}
export ORDERER_GENERAL_LOCALMSPDIR=${FABRIC_CFG_PATH}/crypto-config/ordererOrganizations/${ORDERER_DOMAIN}/orderers/${ORDERER_ADDRESS2}.${ORDERER_DOMAIN}/msp

# (cd ${FABRIC_ROOT}/orderer/ && go install)
rm -rf ${ORDERER_FILELEDGER_LOCATION}
mkdir -p ${ORDERER_FILELEDGER_LOCATION}

if [ "$#" -eq 1 ]; then
    echo "  Running in sharp scheduler mode..."
    SCHEDULER_TYPE=sharp STORE_PATH=/tmp/mvs TXN_SPAN_LIMIT=20 fastordererX start > /data/ruanpc/fastorderer_log 2>&1 &
else
    fastorderer start > /data/ruanpc/fastorderer_log 2>&1 &
fi