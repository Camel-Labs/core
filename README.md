# Camel Core
![logo](logo.png)

## Install Daemon and CLI

```bash
make install
```

## Running the live network and using the commands

To initialize configuration and a `genesis.json` file for your application and an account for the transactions, start by running:

> _*NOTE*_: If you have the Cosmos app for ledger and you want to use it, when you create the key with `nscli keys add jack` just add `--ledger` at the end. That's all you need. When you sign, `jack` will be recognized as a Ledger key and will require a device.

```bash
# Initialize configuration files and genesis file
  # moniker is the name of your node
cameld init <moniker> --chain-id fiochain


# Copy the `Address` output here and save it for later use
# [optional] add "--ledger" at the end to use a Ledger Nano S
camelcli keys add fio

# Copy the `Address` output here and save it for later use
camelcli keys add alice

# Add both accounts, with coins to the genesis file
cameld add-genesis-account $(camelcli keys show fio -a) 1000nametoken,100000000stake
cameld add-genesis-account $(camelcli keys show alice -a) 1000nametoken,100000000stake

# Configure your CLI to eliminate need for chain-id flag
camelcli config chain-id fiochain
camelcli config output json
camelcli config indent true
camelcli config trust-node true

cameld gentx --name fio <or your key_name>

```


After you have generated a genesis transaction, you will have to input the genTx into the genesis file, so that your nameservice chain is aware of the validators. To do so, run:

`cameld collect-gentxs`

and to make sure your genesis file is correct, run:

`cameld validate-genesis`

You can now start `cameld` by calling `cameld start`. You will see logs begin streaming that represent blocks being produced, this will take a couple of seconds.

You have run your first node successfully.


```bash
$ cameld start
I[2020-01-07|18:35:04.112] starting ABCI with Tendermint                module=main
I[2020-01-07|18:35:09.401] Executed block                               module=state height=2 validTxs=0 invalidTxs=0
I[2020-01-07|18:35:09.407] Committed state                              module=state height=2 txs=0 appHash=72DDF95C42DA6E81CBC62F61DB289CAE2F9748FC1979846B1A1DC77391FA4497
I[2020-01-07|18:35:14.445] Executed block                               module=state height=3 validTxs=0 invalidTxs=0
I[2020-01-07|18:35:14.451] Committed state                              module=state height=3 txs=0 appHash=E453A39602DF94B4966AD934D278EA52AD5D0ADB8CAD5C864C94E02661F82D50
I[2020-01-07|18:35:19.490] Executed block                               module=state height=4 validTxs=0 invalidTxs=0
I[2020-01-07|18:35:19.496] Committed state                              module=state height=4 txs=0 appHash=F106451D15B81D1D30642357403FF430D7E393FC23C797C099556536F6DFB545
I[2020-01-07|18:35:24.531] Executed block                               module=state height=5 validTxs=0 invalidTxs=0
I[2020-01-07|18:35:24.537] Committed state                              module=state height=5 txs=0 appHash=55B52267CAE0F334BFD4EC561080B6557810FC9935483D582F7A2B8A44D53739
I[2020-01-07|18:35:29.572] Executed block                               module=state height=6 validTxs=0 invalidTxs=0
...and watch the blocks roll by!
```
