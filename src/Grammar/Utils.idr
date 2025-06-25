module Grammar.Utils

import public Data.String

public export
(<&>) : (AsList s) -> (f : Char -> ty) -> List ty
(<&>) [] f = []
(<&>) (c :: x) f = (f c) :: (x <&> f)

public export
fromString : (s : String) -> List Char
fromString s = asList s <&> id

public export
data CharAt : (l : List Char) -> (char : Char) -> (ind : Nat) -> Type where
    Start  : (c : Char) -> (rest : List Char) -> CharAt (c :: rest) c 0
    Concat : (c' : Char) -> CharAt s c i -> CharAt (c' :: s) c (S i)
