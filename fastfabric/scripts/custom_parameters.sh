#!/usr/bin/env bash


export PEER_DOMAIN="example.com"           # can be anything if running on localhost
export ORDERER_DOMAIN="example.com"        # can be anything if running on localhost

# fill in the addresses without domain suffix and without ports
export FAST_PEER_ADDRESS="ciidaa"
export ORDERER_ADDRESS1="slave-30"
export ORDERER_ADDRESS2="slave-31"

# leave endorser address and storage address blank if you want to run on a single server
export ENDORSER_ADDRESS=( "slave-5" "slave-6" )      # can define multiple addresses in the form ( "addr1" "addr2" ... )
export STORAGE_ADDRESS="slave-7"

export CHANNEL="rpcchannel"               # the name of the created channel of the network
export CHAINCODE="custom"             # the name of the chaincode used on the channel