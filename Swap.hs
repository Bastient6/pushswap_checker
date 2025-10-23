{-
-- EPITECH PROJECT, 2024
-- Swap.hs
-- File description:
-- Rush
-}

module Swap where

swap :: [args] -> [args]
swap [] = []
swap (s:[]) = [s]
swap (s : s1:ds) = s1 : s : ds

sc :: ([args], [args2]) -> ([args], [args2])
sc (args, args2) = (swap args, swap args2)