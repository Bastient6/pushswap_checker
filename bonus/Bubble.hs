{-
-- EPITECH PROJECT, 2024
-- Bubble.hs
-- File description:
-- Rush
-}

import System.Console.ANSI

colorRed :: String -> String
colorRed msg = "\x1b[31m" ++ msg ++ "\x1b[0m" -- Affiche le texte en rouge

bubbleSort :: (Ord a, Show a) => [a] -> IO [a]
bubbleSort xs = bubbleSort' xs (length xs) -- Récupère la liste et sa taille

bubbleSort' :: (Show a, Ord a) => [a] -> Int -> IO [a]
bubbleSort' xs n = 
    let (sortedList, swapped) = bubblePass xs -- Récupère la liste triée et un booléen
        continueSorting = (\sorted -> isSorted sorted || n <= 0) sortedList -- Vérifie si la liste est triée ou si n est inférieur ou égal à 0
    in
        putStrLn (formatList xs sortedList) >>  -- Affiche la liste triée
    if continueSorting then
        return sortedList -- On retourne la liste triée
    else
        bubbleSort' sortedList (n - 1) -- On continue le tri

bubblePass :: (Ord a, Show a) => [a] -> ([a], Bool)
bubblePass [] = ([], False) -- Si la liste est vide, on retourne une liste vide et False
bubblePass [x] = ([x], False) -- Si la liste ne contient qu'un élément, on retourne la liste et False
bubblePass (x:y:rest)
    | x > y     = let (sortedRest, wasSwapped) = bubblePass (x : rest) -- Si le premier élément est plus grand que le deuxième, on continue
                in (y : sortedRest, True) -- On retourne la liste triée et True
    | otherwise = let (sortedRest, wasSwapped) = bubblePass (y : rest) -- Si le premier élément est plus petit que le deuxième, on continue
                in (x : sortedRest, wasSwapped) -- On retourne la liste triée et False
formatList :: (Show a, Eq a) => [a] -> [a] -> String -- Récupère deux listes et les compare
formatList [] [] = "" 
formatList (x:xs) (y:ys) 
    | x == y = show x ++ " " ++ formatList xs ys -- Si les deux listes sont identiques
    | otherwise = colorRed (show x) ++ " " ++ formatList xs ys -- Si les deux listes sont differentes

isSorted :: Ord a => [a] -> Bool -- Vérifie si la liste est triée
isSorted [] = True -- Si la liste est vide, elle est triée
isSorted [_] = True -- Si la liste ne contient qu'un élément, elle est triée
isSorted (x:y:xs) = x <= y && isSorted (y:xs) -- Si le premier élément est plus petit que le deuxième, on continue, sinon on arrête
