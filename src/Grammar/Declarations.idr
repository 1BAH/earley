module Grammar.Declarations

import public Grammar.Utils

-- E is a special Intermediate symbol which stands for unknown symbol
public export
data N = S | F | W | E

public export
data T = A | B

public export
word : List Char
word = "ab"

