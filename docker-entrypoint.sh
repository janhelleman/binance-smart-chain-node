#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for bsc"

  set -- bsc "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "bsc" ]; then
  if [ ! -d $BSC_DATADIR/geth/chaindata ]; then
    mkdir -p "$BSC_DATADIR"
    chmod 700 "$BSC_DATADIR"
    bsc --nousb --datadir "$BSC_DATADIR" init $BSC_DATADIR/genesis.json
    mv -f /config.toml $BSC_DATADIR/config.toml
  fi

  echo "$0: setting data directory to $BSC_DATADIR"

  set -- "$@" --datadir "$BSC_DATADIR" --config "$BSC_DATADIR/config.toml"
fi

echo
exec "$@"
