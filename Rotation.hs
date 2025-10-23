{-
-- EPITECH PROJECT, 2024
-- Push.hs
-- File description:
-- Rush
-}

module Rotation where

rf :: [a] -> [a]
rf [] = []
rf (x:xs) = xs ++ [x]

rl :: [a] -> [a]
rl [] = []
rl a = 
    let lastArg = last a
    in lastArg : init a

rr :: ([a], [a]) -> ([a], [a])
rr ([], []) = ([], [])
rr (a, b) = (rf a, rf b)

rrr :: ([a], [a]) -> ([a], [a])
rrr ([], []) = ([], [])
rrr (a, b) = (rl a, rl b)
