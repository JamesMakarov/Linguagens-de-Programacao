module Gates (notGate, andGate, nandGate, orGate, xorGate) where

-- NOT gate: applies (1-x) to every element
notGate :: [Int] -> [Int]
notGate = map (\x -> 1 - x)

-- AND gate: multiplies elements pairwise
andGate :: [Int] -> [Int] -> [Int]
andGate = zipWith (*)

-- OR gate: Boolean OR arithmetic equivalent
orGate :: [Int] -> [Int] -> [Int]
orGate = zipWith (\x y -> x + y - x * y)

-- XOR gate: Boolean XOR arithmetic equivalent
xorGate :: [Int] -> [Int] -> [Int]
xorGate = zipWith (\x y -> x * (1 - y) + y * (1 - x))

-- NAND gate: 1 minus the product
nandGate :: [Int] -> [Int] -> [Int]
nandGate = zipWith (\x y -> 1 - x * y)