#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for bsc"

  set -- bsc "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "bsc" ]; then

  if [ ! -d $BSC_CONFIGDIR/config ]; then
    mkdir -p "$BSC_CONFIGDIR"
    chmod 700 "$BSC_CONFIGDIR"
    bsc --nousb --datadir "$BSC_DATADIR" init $BSC_CONFIGDIR/genesis.json
    MV /config.toml "$BSC_CONFIGDIR"/config.toml
  fi
  
  if [ ! -d $BSC_DATADIR/geth/chaindata ]; then
    mkdir -p "$BSC_DATADIR"
    chmod 700 "$BSC_DATADIR"
  fi

  echo "$0: setting data directory to $BSC_DATADIR"

  set -- "$@" --datadir "$BSC_DATADIR" --config "$BSC_CONFIGDIR/config.toml"
fi

echo
exec "$@"
