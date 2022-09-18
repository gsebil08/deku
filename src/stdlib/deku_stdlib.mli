module N = N
module Uri = Uri_ext

[%%let ("let.await" : 'a Lwt.t -> ('a -> 'b Lwt.t) -> 'b Lwt.t)]

[%%let
("let.ok" : ('a, 'err) result -> ('a -> ('b, 'err) result) -> ('b, 'err) result)]

[%%let ("let.some" : 'a option -> ('a -> 'b option) -> 'b option)]

module Parallel = Parallel