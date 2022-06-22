(*
 * Copyright (c) 2015 Magnus Skjegstad <magnus@skjegstad.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

module Make : sig
    type buffer = Cstruct.t
    type id = int
    type macaddr = Macaddr.t
    type t

    val create : ?yield:(unit -> unit) -> ?use_async_readers:Eio.Switch.t -> unit -> t
    val disconnect : t -> unit
    val register : t -> id

    (** Unregister the listener and callback function *)
    val unregister : t -> id -> unit

    (** Unregister the listener, then block until all callbacks return for this
     * id. Useful when listeners are called in async. *)
    val unregister_and_flush : t -> id -> unit

    val mac : t -> id -> macaddr
    val writev : t -> id -> buffer list -> unit
    val set_listen_fn : t -> id -> (buffer -> unit) -> unit

end
