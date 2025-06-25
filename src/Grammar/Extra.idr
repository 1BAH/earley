module Grammar.Extra

import Grammar

public export
len : Nat
len = length word

-----------------------------------------------------

public export
fromCharHelper : (c : Char) -> G
fromCharHelper 'a' = Right A
fromCharHelper 'b' = Right B
fromCharHelper 'S' = Left S
fromCharHelper 'F' = Left F
fromCharHelper 'W' = Left W
fromCharHelper  _  = Left E

Grammar.Base.fromChar = fromCharHelper

------------------------------------------------------

Grammar.Productions.P = [
      S ==> "W"
    , W ==> "aFbF"
    , F ==> "aFb"
    , F ==> ""
]

