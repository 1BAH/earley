# Early parser

> Formalization which allows to describe 
a derivation process via DSL with type checking.

## Set Grammar

Assume, you a grammar $\langle S, \Sigma :=\{a, b\}, N := \{S, W, F\}, P \rangle$

In module `Grammar.Declarations`:

* define `data N` - a set of nonterminal symbols (e.g. `data N = S | W | F`)
    * **Add `E` constructor** - it represents any unknown symbol
* define `data T` - a set of terminal symbols (e.g. `data T = A | B`)

In module `Grammar.Extra`:

* define `fromCharHelper` which allows later to use DSL
* define `data P` - a set of the grammar's productions 

## DSL

1. You can define any word from $(\Sigma \sqcup N)^\ast$ with a string literal: `"aFb"`
2. You can define a production via `==>` operator: `S ==> "aSbS"`
3. You can define an Earley item via `~>` & `*` operators: `(S ~> "a" * "SbS", 1, 1)`

## Derivation

Descibe the derivation process in the `Derive` module. You may study the provided example there for further research.

