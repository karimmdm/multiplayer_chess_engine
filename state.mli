(* Representation of a dynamic chess game state.

   A game state will contain information about the player turn, whether
   or not a player is in check, or if the game has reached a win
   condition (checkmate or stalemate). If one of checkmate or stalemate
   is true, the other must be false. *)

(* The abstract type of values representing a game state. *)
type t

(* [init_state ()] initializes a new state with an empty 8x8 board and
   sets the player turn to 1 and all the booleans to false. *)
val init_state : unit -> t

(* [state_from_fen s] initializes a new state based on the piece
   placement of the fen notation [s] *)
val state_from_fen : string -> t

(* [fen_from_state st] is the string representation of the state [st]
   val fen_from_state : t -> string *)

(* [board st] is the current board configuration of the game state [st] *)
val board : t -> Piece.t option list list

(* [update_board st board] returns a new State with the updated board
   field. *)
val update_board : t -> Piece.t -> int * int -> t

(* [player_turn st] will return an int representing whose turn it is, 1
   for player 1 (white) and 2 for player 2 (black). *)
val player_turn : t -> int

(* [update_player_turn st pt] returns a new State with the updated
   player_turn field. *)
val update_player_turn : t -> int -> t

(* [check st] will return true if the current player is in check and
   false otherwise. *)
val check : t -> bool

(* [update_check st ch] returns a new State with the updated check
   field. *)
val update_check : t -> bool -> t

(* [checkmate st] will return true if the current player is in checkmate
   and false otherwise. *)
val checkmate : t -> bool

(* [update_player_turn st cm] returns a new State with the updated
   checkmate field. *)
val update_checkmate : t -> bool -> t

(* [stalemate st] will return true if the current player is in stalemate
   and false otherwise. *)
val stalemate : t -> bool

(* [update_player_turn st sm] returns a new State with the updated
   stalemate field. *)
val update_stalemate : t -> bool -> t

(* [piece_clicked st] will return a Piece option of the current piece
   clicked. *)
val piece_clicked : t -> Piece.t option

(* [update_player_turn st pt] returns a new State with the updated
   piece_clicked field. *)
val update_piece_clicked : t -> Piece.t option -> t
