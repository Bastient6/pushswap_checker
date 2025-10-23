{-
-- EPITECH PROJECT, 2024
-- Main.hs
-- File description:
-- Rush
-}

import System.Environment
import System.Exit ( exitWith, ExitCode(ExitFailure), exitFailure )
import Data.ByteString (split, packCString)
import Data.Text ( Text, splitOn, pack, unpack )
import Data.Char (isDigit)
import Data.Bifunctor
import Swap
import Push
import Rotation
import Checker
import PushSwapChecker

main :: IO ()
main = do
    inst <- getLine
    args <- getArgs
    if not (isValidNum args) || not (isValStr (strToArray inst " "))
        then exitWith (ExitFailure 84)
        else listChecker (execSwap (strToArray inst " ") (strToInt args, []))