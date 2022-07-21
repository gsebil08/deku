(* TODO: make those GADTs *)
type key_hash =
  | Ed25519 of Ed25519.Key_hash.t
  | Secp256k1 of Secp256k1.Key_hash.t
  | P256 of P256.Key_hash.t

type t = key_hash [@@deriving eq, ord, yojson]

(* repr *)
val of_b58 : string -> key_hash option
val to_b58 : key_hash -> string

(* operations *)
val of_key : Key.t -> t