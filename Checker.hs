{-
-- EPITECH PROJECT, 2024
-- Main.hs
-- File description:
-- Rush
-}

module Checker where

listComp :: Ord a => [a] -> Bool
listComp [] = True
listComp [_] = True
listComp (a:b:xs)
    | a <= b    = listComp (b:xs)
    | otherwise = False


listChecker :: (Ord a, Show a) => ([a], [a]) -> IO ()
listChecker a
    | listComp (fst a) && null (snd a) = putStrLn "OK"
    | otherwise = putStrLn ("KO: " ++ show a) 
