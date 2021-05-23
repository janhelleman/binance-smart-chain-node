# Binance Smart Chain node Docker image

## QuickStart

`docker run -d -v/data/bsc:/root -p 30311:30311 -p 6060:6060 -p 8545:8545 -p 8546:8546 -p 8547:8547 --name binance-smart-chain-node slaaitjuh/binance-smart-chain-node:latest --syncmode snap --nousb --cache 4096`

Blockchain data will be stored at `/data/bsc` folder.

## Check sync status

```
docker exec binance-smart-chain-node bsc attach --exec eth.syncing

docker logs -f binance-smart-chain-node
```

## PORTS

# NODE P2P
EXPOSE 30311/udp
EXPOSE 30311/tcp

# pprof / metrics
EXPOSE 6060/tcp

# HTTP based JSON RPC API
EXPOSE 8545/tcp
# WebSocket based JSON RPC API
EXPOSE 8546/tcp
# GraphQL API
EXPOSE 8547/tcp

## More info

[original BSC repo](https://github.com/binance-chain/bsc)
