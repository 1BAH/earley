module Earley

import public Grammar
import public Grammar.Extra

public export infix 5 *
public export infix 5 ~>

public export
data RProd : Type where
    (*) : (l : GWord) -> (r : GWord) -> RProd

public export
data Production' : Type where
    (~>) : (from : N) -> (to : RProd) -> Production'

public export
Item : Type
Item = (Production', Nat, Nat)

public export
data Derive : (item : Item) -> Type where
    Init     : Derive (S ~> "" * "W", 0, 0)
    Predict  : (p : Production) ->
               (contains : P `Contains` p) =>
               (starts : r `StartsWith` p.from) =>
               (cont : Derive (a ~> l * r, i, j)) ->
               Derive (p.from ~> "" * p.to, j, j)
    Scan     : (c : Char) ->
               (charAt : CharAt Grammar.Declarations.word c j) =>
               (cont : Derive (a ~> l * (c +++ r), i, j)) ->
               Derive (a ~> (l +++ c) * r, i, j + 1)
    Complete : (curr : Derive (a ~> l * (b +++ r), i, k)) ->
               (cont : Derive (b ~> y * "", k, j)) ->
               Derive (a ~> (l +++ b) * r, i, j)

public export
(>>) : (Derive (a ~> b, i, j) -> Derive (a' ~> b', i', j')) ->
        Derive (a ~> b, i, j) -> Derive (a' ~> b', i', j')
(>>) = id

public export
InL : Type
InL = Derive (S ~> "W" * "", 0, len)
