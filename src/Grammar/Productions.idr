module Grammar.Productions

import Grammar.Base

public export infix 5 ==>

public export
data Production : Type where
    (==>) : (from : N) -> (to : GWord) -> Production

public export
(.from) : (p : Production) -> N
(.from) (f ==> to) = f

public export
(.to) : (p : Production) -> GWord
(.to) (f ==> t) = t

public export
P : List Production

public export
data Contains : (ps : List Production) -> (p : Production) -> Type where
    [search ps p]
    Here  : Contains (p :: _) p
    There : Contains ps p -> Contains (_ :: ps) p
