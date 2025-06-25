module Grammar.Base

import public Grammar.Declarations

import public Data.String
import public Data.List

public export infixr 5 +++

public export
G : Type
G = Either N T

public export
fromChar : (c : Char) -> G

public export
GWord : Type
GWord = List G

public export
fromN : (i : N) -> GWord
fromN i = [Left i]

public export
data StartsWith : (w : GWord) -> (i : N) -> Type where
    MkStWh : (i : N) -> StartsWith (Left i :: rest) i

public export
fromString : (s : String) -> GWord
fromString s = asList s <&> fromChar

public export
(+++) : GWord -> GWord -> GWord
(+++) Nil w = w
(+++) (c :: other) w = c :: (other +++ w)

namespace CharLeft
    public export infixr 5 +++

    public export
    (+++) : GWord -> Char -> GWord
    (+++) w s = w +++ (fromString $ singleton s)

namespace CharRight
    public export infixr 5 +++

    public export
    (+++) : Char -> GWord -> GWord
    (+++) s w = (fromString $ singleton s) +++ w

namespace ILeft
    public export infixr 5 +++

    public export
    (+++) : GWord -> N -> GWord
    (+++) w i = w +++ fromN i

namespace IRight
    public export infixr 5 +++

    public export
    (+++) : N -> GWord -> GWord
    (+++) i w = fromN i +++ w
