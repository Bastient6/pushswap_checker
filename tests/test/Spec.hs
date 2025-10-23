module Main where

import Test.HUnit
import Swap
import Push
import Rotation
import Checker
import PushSwapChecker

test1 :: Test
test1 = TestCase (assertEqual "test1" (swap [1,2,3,4,5]) [2,1,3,4,5])

test2 :: Test
test2 = TestCase (assertEqual "test2" (swap ([] :: [Int])) [])

test3 :: Test
test3 = TestCase (assertEqual "test3" (sc ([1,2,3,4], [5,6,7,8])) ([2,1,3,4], [6,5,7,8]))

test4 :: Test
test4 = TestCase (assertEqual "test4" (pb ([1,2,3,4], [5,6,7,8])) ([2,3,4], [1,5,6,7,8]))

test5 :: Test
test5 = TestCase (assertEqual "test5" (pb ([], [5,6,7,8])) ([], [5,6,7,8]))

test6 :: Test
test6 = TestCase (assertEqual "test6" (pa ([], [5,6,7,8])) ([], [5,6,7,8]))

test7 :: Test
test7 = TestCase (assertEqual "test7" (pa ([1,2,3,4], [])) ([1,2,3,4], []))

test8 :: Test
test8 = TestCase (assertEqual "test8" (pa ([1,2,3,4], [5,6,7,8])) ([5,1,2,3,4], [6,7,8]))

test9 :: Test
test9 = TestCase (assertEqual "test9" (rf [1,2,3,4]) [2,3,4,1])

test10 :: Test
test10 = TestCase (assertEqual "test10" (rf ([] :: [Int])) [])

test11 :: Test
test11 = TestCase (assertEqual "test11" (rl ([] :: [Int])) [])

test12 :: Test
test12 = TestCase (assertEqual "test12" (rl [1,2,3,4]) [4,1,2,3])

test13 :: Test
test13 = TestCase (assertEqual "test13" (rr ([1,2,3,4], [5,6,7,8])) ([2,3,4,1], [6,7,8,5]))

test14 :: Test
test14 = TestCase (assertEqual "test14" (rr (([] :: [Int]), ([] :: [Int]))) ([], []))

test15 :: Test
test15 = TestCase (assertEqual "test15" (rrr (([] :: [Int]), ([] :: [Int]))) ([], []))

test16 :: Test
test16 = TestCase (assertEqual "test16" (rrr ([1,2,3,4], [5,6,7,8])) ([4,1,2,3], [8,5,6,7]))

test17 :: Test
test17 = TestCase (assertEqual "test17" (listComp ([] :: [Int])) True)

test18 :: Test
test18 = TestCase (assertEqual "test18" (listComp [1,2,3,4,5,6,7,8]) True)

test19 :: Test
test19 = TestCase (assertEqual "test19" (listComp [2,1,3,4,5,6,7,8]) False)

test20 :: Test
test20 = TestCase $ do
    _ <- listChecker ([1,2,3,4,5], [])
    assertEqual "test20" "OK" "OK"

test21 :: Test
test21 = TestCase $ do
    _ <- listChecker ([2,1,3,4,5,6,7,8], [])
    assertEqual "test21" "KO: ([2,1,3,4,5,6,7,8],[])" "KO: ([2,1,3,4,5,6,7,8],[])"

test22 :: Test
test22 = TestCase $ do
    assertEqual "test22" ["1", "2", "3", "4", "5"] (strToArray "1 2 3 4 5" " ")

test23 :: Test
test23 = TestCase $ do
    assertEqual "test23" [1, 2, 3, 4, 5] (strToInt ["1", "2", "3", "4", "5"])

test24 :: Test
test24 = TestCase $ do
    assertEqual "test24" ([2, 1, 3, 4, 5], []) (execInstruction "sa" ([1, 2, 3, 4, 5], []))

test25 :: Test
test25 = TestCase $ do
    assertEqual "test25" ([], [2, 1, 3, 4, 5]) (execInstruction "sb" ([], [1, 2, 3, 4, 5]))

test26 :: Test
test26 = TestCase (assertEqual "test26" (strToInt []) [])

test27 :: Test
test27 = TestCase (assertEqual "test27" (execInstruction "sa" ([1,2,3], [])) ([2,1,3], []))

test28 :: Test
test28 = TestCase (assertEqual "test28" (execInstruction "sb" ([1,2,3], [])) ([1,2,3], []))

test29 :: Test
test29 = TestCase (assertEqual "test29" (execInstruction "pa" ([1], [2,3])) ([2,1], [3]))

test30 :: Test
test30 = TestCase (assertEqual "test30" (execInstruction "pb" ([1], [2,3])) ([], [1,2,3]))

test31 :: Test
test31 = TestCase (assertEqual "test31" (execSwap ["sa", "ra", "pb"] ([1,2,3], [])) ([3,2], [1]))

test32 :: Test
test32 = TestCase (assertEqual "test32" (isValidNum ["-123", "45", "6789"]) True)

test33 :: Test
test33 = TestCase (assertEqual "test33" (isValidNum ["-123", "45a", "6789"]) False)

test34 :: Test
test34 = TestCase (assertEqual "test34" (isValStr ["sa", "rra", "pb"]) True)

test35 :: Test
test35 = TestCase (assertEqual "test35" (isValStr ["sa", "rra", "px"]) False)

test36 :: Test
test36 = TestCase (assertEqual "test36" (execInstruction "rr" ([1,2,3], [4,5,6])) ([2,3,1], [5,6,4]))

test37 :: Test
test37 = TestCase (assertEqual "test37" (execInstruction "rrr" ([1,2,3], [4,5,6])) ([3,1,2], [6,4,5]))

test38 :: Test
test38 = TestCase (assertEqual "test38" (execInstruction "rrb" ([1,2,3], [4,5,6])) ([1,2,3], [6,4,5]))

test39 :: Test
test39 = TestCase (assertEqual "test39" (execInstruction "rra" ([1,2,3], [4,5,6])) ([3,1,2], [4,5,6]))

test40 :: Test
test40 = TestCase (assertEqual "test40" (execInstruction "rr" ([], [1,2,3])) ([], [2,3,1]))

test41 :: Test
test41 = TestCase (assertEqual "test41" (execInstruction "rra" ([1], [2,3])) ([1], [2,3]))

test42 :: Test
test42 = TestCase (assertEqual "test42" (execInstruction "rrb" ([1], [2,3])) ([1], [3,2]))

test43 :: Test
test43 = TestCase (assertEqual "test43" (execInstruction "rrr" ([1], [2,3])) ([1], [3,2]))

test44 :: Test
test44 = TestCase (assertEqual "test44" (execSwap ["rr", "pb"] ([1,2,3], [])) ([3,1], [2]))

test45 :: Test
test45 = TestCase (assertEqual "test45" (execSwap ["rrr", "sa"] ([1,2,3], [])) ([1,3,2], []))

test46 :: Test
test46 = TestCase (assertEqual "test46" (isValidNum [] ) False)

test47 :: Test
test47 = TestCase (assertEqual "test47" (isValidSingleNumber [] ) False)

test48 :: Test
test48 = TestCase (assertEqual "test48" (execInstruction "sc" ([1], [2,3])) ([1], [3,2]))

test49 :: Test
test49 = TestCase (assertEqual "test49" (execInstruction "rb" ([1], [2,3])) ([1], [3,2]))

test50 :: Test
test50 = TestCase (assertEqual "test50" (execInstruction "" ([1], [2,3])) ([1], [2, 3]))

test51 :: Test
test51 = TestCase (assertEqual "test51" (isValStr ["rb", "rrb", "ra"]) True)

test52 :: Test
test52 = TestCase (assertEqual "test52" (isValStr ["rr", "ra", "sc"]) True)

test53 :: Test
test53 = TestCase (assertEqual "test53" (isValStr ["rra", "sc", "rr"]) True)

test54 :: Test
test54 = TestCase (assertEqual "test54" (isValStr ["rrb", "pb", "ra"]) True)

test55 :: Test
test55 = TestCase (assertEqual "test55" (isValStr ["rrr", "ra", "pb"]) True)

test56 :: Test
test56 = TestCase (assertEqual "test56" (isValStr ["rrr", "pb", "sc"]) True)

test57 :: Test
test57 = TestCase (assertEqual "test57" (isValStr ["ra", "pb", "sa"]) True)

test58 :: Test
test58 = TestCase (assertEqual "test58" (isValStr ["ra", "sc", "sb"]) True)

test59 :: Test
test59 = TestCase (assertEqual "test59" (isValStr ["rra", "sc", "rrb"]) True)

test60 :: Test
test60 = TestCase (assertEqual "test60" (isValStr ["rrb", "pb", "rrr"]) True)

test61 :: Test
test61 = TestCase (assertEqual "test61" (isValStr ["rr", "pb", "sb"]) True)

test62 :: Test
test62 = TestCase (assertEqual "test62" (isValStr ["sc", "pb", "ra"]) True)

test63 :: Test
test63 = TestCase (assertEqual "test63" (isValStr ["ra", "pb", "pb"]) True)

test64 :: Test
test64 = TestCase (assertEqual "test64" (isValStr ["sc", "sa", "sb"]) True)

test65 :: Test
test65 = TestCase (assertEqual "test65" (isValStr ["rrb", "pb", "pa"]) True)

tests :: Test
tests = TestList [TestLabel "Test 1" test1, TestLabel "Test 2" test2, TestLabel "Test 3" test3, TestLabel "Test 4" test4, TestLabel "Test 5" test5, TestLabel "Test 6" test6, TestLabel "Test 7" test7, TestLabel "Test 8" test8, TestLabel "Test 9" test9, TestLabel "Test 10" test10, TestLabel "Test 11" test11, TestLabel "Test 12" test12, TestLabel "Test 13" test13, TestLabel "Test 14" test14, TestLabel "Test 15" test15, TestLabel "Test 16" test16, TestLabel "Test 17" test17, TestLabel "Test 18" test18, TestLabel "Test 19" test19, TestLabel "Test 20" test20, TestLabel "Test 21" test21, TestLabel "Test 22" test22, TestLabel "Test 23" test23, TestLabel "Test 24" test24, TestLabel "Test 25" test25, TestLabel "Test 26" test26, TestLabel "Test 27" test27, TestLabel "Test 28" test28, TestLabel "Test 29" test29, TestLabel "Test 30" test30, TestLabel "Test 31" test31, TestLabel "Test 32" test32, TestLabel "Test 33" test33, TestLabel "Test 34" test34, TestLabel "Test 35" test35, TestLabel "Test 36" test36, TestLabel "Test 37" test37, TestLabel "Test 38" test38, TestLabel "Test 39" test39, TestLabel "Test 40" test40, TestLabel "Test 41" test41, TestLabel "Test 42" test42, TestLabel "Test 43" test43, TestLabel "Test 44" test44, TestLabel "Test 45" test45, TestLabel "Test 46" test46, TestLabel "Test 47" test47, TestLabel "Test 48" test48, TestLabel "Test 49" test49, TestLabel "Test 50" test50, TestLabel "Test 51" test51 ,TestLabel "Test 52" test52 ,TestLabel "Test 53" test53 ,TestLabel "Test 54" test54 ,TestLabel "Test 55" test55 ,TestLabel "Test 56" test56 ,TestLabel "Test 57" test57 ,TestLabel "Test 58" test58 ,TestLabel "Test 59" test59 ,TestLabel "Test 60" test60 ,TestLabel "Test 61" test61 ,TestLabel "Test 62" test62 ,TestLabel "Test 63" test63 ,TestLabel "Test 64" test64,TestLabel "Test 65" test65]

main :: IO ()
main = do
    runTestTT tests
    putStrLn "Tests exécutés avec succès!"
