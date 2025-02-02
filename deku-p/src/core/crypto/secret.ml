open Deku_repr

type secret =
  | Ed25519 of Ed25519.Secret.t
  | Secp256k1 of Secp256k1.Secret.t
  | P256 of P256.Secret.t

and t = secret [@@deriving eq, ord]

let of_b58 =
  let ed25519 string =
    match Ed25519.Secret.of_b58 string with
    | Some secret -> Some (Ed25519 secret)
    | None -> None
  in
  let secp256k1 string =
    match Secp256k1.Secret.of_b58 string with
    | Some secret -> Some (Secp256k1 secret)
    | None -> None
  in
  let p256 string =
    match P256.Secret.of_b58 string with
    | Some secret -> Some (P256 secret)
    | None -> None
  in
  fun string -> decode_variant [ ed25519; secp256k1; p256 ] string

let to_b58 secret =
  match secret with
  | Ed25519 secret -> Ed25519.Secret.to_b58 secret
  | Secp256k1 secret -> Secp256k1.Secret.to_b58 secret
  | P256 secret -> P256.Secret.to_b58 secret

include With_yojson_of_b58 (struct
  type t = secret

  let of_b58 = of_b58
  let to_b58 = to_b58
end)
