open State
open Piece

(* val move_piece : State.t -> State.t

   val is_check : State.t -> bool

   val can_castle : State.t -> bool

   val promote : 'a -> 'a *)

(* [locations st p] returns a list of positions represented by int
   tuples that the given piece can move to via official chess rules with
   one exception: a locaiton that causes ones one king to be checked is
   still a valid locaiton but not a legal move *)
val locations : State.t -> Piece.t -> (int * int) list

(* [valid_move st p loc] returns true if the given piece can move to the
   given location if the given piece can legally move to that location,
   if that location is not occupied, and and if the given location is
   within the bounds of the board. *)
val valid_move : State.t -> Piece.t -> int * int -> bool

(* [move_piece st piece loc] is the new state after piece has moved to
   locaion [loc]*)
val move_piece : State.t -> Piece.t -> int * int -> State.t