(* server *)
val listen :
  net:#Eio.Net.t ->
  port:int ->
  on_error:(exn -> unit) ->
  (read:(unit -> Network_message.t) ->
  write:(Network_message.t -> unit) ->
  unit) ->
  'a

(* client *)
exception Invalid_host

val connect :
  net:#Eio.Net.t ->
  host:string ->
  port:int ->
  (read:(unit -> Network_message.t) -> write:(Network_message.t -> unit) -> 'a) ->
  'a

val test : unit -> unit