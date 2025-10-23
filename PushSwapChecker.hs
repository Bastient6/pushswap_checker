{-
-- EPITECH PROJECT, 2024
-- Main.hs
-- File description:
-- Rush
-}

module PushSwapChecker where
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

strToArray :: String -> String -> [String]
strToArray str c = map unpack (splitOn (pack c) (pack str))

strToInt :: [String] -> [Int]
strToInt = fmap read

execInstruction :: [Char] -> ([a], [a]) -> ([a], [a])
execInstruction "sa" tulpe = first swap tulpe
execInstruction "sb" tulpe = second swap tulpe
execInstruction "sc" tulpe = sc tulpe
execInstruction "pa" tulpe = pa tulpe
execInstruction "pb" tulpe = pb tulpe
execInstruction "ra" tulpe = first rf tulpe
execInstruction "rb" tulpe = second rf tulpe
execInstruction "rr" tulpe = rr tulpe
execInstruction "rra" tulpe = first rl tulpe
execInstruction "rrb" tulpe = second rl tulpe
execInstruction "rrr" tulpe = rrr tulpe
execInstruction _ t = t

execSwap :: [String] -> ([a], [a]) -> ([a], [a])
execSwap sx a = foldl (flip execInstruction) a sx

isValidNum :: [String] -> Bool
isValidNum [] = False
isValidNum str = all isValidSingleNumber str

isValidSingleNumber :: String -> Bool
isValidSingleNumber ('-':cs) = all isDigit cs
isValidSingleNumber (c:cs) = all isDigit (c:cs)
isValidSingleNumber _ = False

isValStr :: [String] -> Bool
isValStr [] = True
isValStr [""] = True
isValStr ("sa":sx) = isValStr sx
isValStr ("sb":sx) = isValStr sx
isValStr ("sc":sx) = isValStr sx
isValStr ("pa":sx) = isValStr sx
isValStr ("pb":sx) = isValStr sx
isValStr ("ra":sx) = isValStr sx
isValStr ("rb":sx) = isValStr sx
isValStr ("rr":sx) = isValStr sx
isValStr ("rra":sx) = isValStr sx
isValStr ("rrb":sx) = isValStr sx
isValStr ("rrr":sx) = isValStr sx
isValStr (_:sx) = False
