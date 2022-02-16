(* 
 you can pack some string by running:
 ligo compile expression cameligo "Bytes.pack \"http://localhost:4440\""  
 

 todo: deploy the discovery contract with initial data in contract in setup.mligo
       read the consensus contract's list of validators, and look up their addresses in the data on node 
startup


for use in the ligo ide: 
type uri = string
type nonce = int
type storage = (key, (nonce * uri)) big_map
let a : storage = Map.literal [
    (("edpkvBG8fFXMqAokhxW5Tw9iQGHt3mwaNTm8cxo1CMNEjZeTzzG9a1" : key), (0,"http://localhost:4440"));
    (("edpkvBG8fFXMqAokhxW5Tw9iQGHt3mwaNTm8cxo1CMNEjZeTzzG9a1" : key), (0,"http://localhost:4440"));]


compile contract: 
ligo compile contract src/tezos_interop/discovery.mligo --entry-point main

compile storage: 
ligo compile storage src/tezos_interop/discovery.mligo "$(cat src/tezos_interop/discovery_data.mligo)" --entry-point main

typecheck contract: 
tezos-client --endpoint http://localhost:20000 -l typecheck data "$(ligo compile storage src/tezos_interop/discovery.mligo "$(cat src/tezos_interop/discovery_data.mligo)" --entry-point main)" against type "big_map key (pair int string)"
 
inject contract:
tezos-client --endpoint http://localhost:20000 originate contract "discovery" \
transferring 0 from myWallet \
running "$(ligo compile contract src/tezos_interop/discovery.mligo --entry-point main)" \
--init "$(ligo compile storage src/tezos_interop/discovery.mligo "$(cat src/tezos_interop/discovery_data.mligo)" --entry-point main
)" \
--burn-cap 2 --force

read storage: 
tezos-client  --endpoint http://localhost:20000 get contract storage for discovery



 *)

Map.literal [
    (("edpkvBG8fFXMqAokhxW5Tw9iQGHt3mwaNTm8cxo1CMNEjZeTzzG9a1" : key), (0,"http://localhost:4440"));
    (("edpkvNE7v8NtGXPMuHZGsgwedBcdfTJ9cSjKHkNnWQSauRk14oJoH4" : key), (0,"http://localhost:4441"));
    (("edpkvBETmnQtBtebQ26gzePb5RHL8VdQWAxSpEzvgQx56YHt2Zopp2" : key), (0,"http://localhost:4442"));]