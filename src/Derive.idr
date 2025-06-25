module Derive

import Earley
help : Derive (W ~> "a" * "FbF", 0, 1)
help = do
    Scan 'a'
    Predict (W ==> "aFbF")
    Init

help' : Derive (W ~> "aFb" * "F", 0, 2)
help' = do
    Scan 'b'
    Complete help
    Predict (F ==> "")
    help

derive : InL
derive = do
    Complete Init
    Complete help'
    Predict (F ==> "")
    help'


derive' : InL
derive' = do
    Complete Init
    Complete (do
        Scan 'b'
        Complete (do
            Scan 'a'
            Predict (W ==> "aFbF")
            Init)
        Predict (F ==> "")
        Scan 'a'
        Predict (W ==> "aFbF")
        Init)
    Predict (F ==> "")
    Scan 'b'
    Complete (do
        Scan 'a'
        Predict (W ==> "aFbF")
        Init)
    Predict (F ==> "")
    Scan 'a'
    Predict (W ==> "aFbF")
    Init
