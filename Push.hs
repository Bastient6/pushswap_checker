{-
-- EPITECH PROJECT, 2024
-- Push.hs
-- File description:
-- Rush
-}

module Push where

pb :: ([a], [a]) -> ([a], [a])
pb ([], a) = ([], a)
pb (x:xs, a) = (xs, x:a)

pa :: ([a], [a]) -> ([a], [a])
pa (a, []) = (a, [])
pa ([], a) = ([], a)
pa (a, x:xs) = (x:a, xs)
