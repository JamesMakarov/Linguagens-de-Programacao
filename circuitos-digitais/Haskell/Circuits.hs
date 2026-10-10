module Circuits (halfAdder, halfSubtractor, fullAdder, fullSubtractor) where

import Gates

-- Half Adder
-- Inputs: xs, ys
-- Outputs: (Sum, Carry)
halfAdder :: [Int] -> [Int] -> ([Int], [Int])
halfAdder xs ys = (s, c)
  where
    s = xorGate xs ys
    c = andGate xs ys

-- Half Subtractor
-- Inputs: xs, ys
-- Outputs: (Difference, Borrow)
halfSubtractor :: [Int] -> [Int] -> ([Int], [Int])
halfSubtractor xs ys = (d, b)
  where
    d     = xorGate xs ys
    notXs = notGate xs
    b     = andGate notXs ys

-- Full Adder
-- Inputs: xs, ys, cin
-- Outputs: (Sum, CarryOut)
-- Reuses Half Adder logic internally
fullAdder :: [Int] -> [Int] -> [Int] -> ([Int], [Int])
fullAdder xs ys cin = (s, cout)
  where
    (s1, c1) = halfAdder xs ys
    (s, c2)  = halfAdder s1 cin
    cout     = orGate c1 c2

-- Full Subtractor
-- Inputs: xs, ys, bin
-- Outputs: (Difference, BorrowOut)
-- Implements logic using basic gates as defined in the Oz code
fullSubtractor :: [Int] -> [Int] -> [Int] -> ([Int], [Int])
fullSubtractor xs ys bin = (d, bout)
  where
    d1     = xorGate xs ys
    inter1 = notGate xs
    b1     = andGate inter1 ys

    d      = xorGate d1 bin
    inter2 = notGate d1
    b2     = andGate inter2 bin

    bout   = orGate b1 b2