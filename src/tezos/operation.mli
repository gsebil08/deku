open Crypto

(* TODO: operation here means Manager_operation *)

type parameters = {
  entrypoint : string;
  value : Michelson.t Data_encoding.lazy_t;
}
type transaction = {
  amount : Tez.t;
  destination : Address.t;
  parameters : parameters option;
}

type content = Transaction of transaction
type t = {
  source : Key_hash.t;
  fee : Tez.t;
  counter : Z.t;
  content : content;
  gas_limit : Gas.integral;
  storage_limit : Z.t;
}

(* TODO: better API for this *)
val forge :
  secret:Secret.t -> branch:Block_hash.t -> operations:t list -> string