module Main where

import Circuits

-- Main execution block
main :: IO ()
main = do
    -- Defining input streams (Lazy lists)
    let xs  = [0, 1, 0, 1]
    let ys  = [0, 0, 1, 1]
    let cin = [0, 0, 0, 0]
    let bin = [0, 0, 0, 0]

    -- Running the circuits
    let (ha_s, ha_c) = halfAdder xs ys
    let (hs_d, hs_b) = halfSubtractor xs ys
    let (fa_s, fa_c) = fullAdder xs ys cin
    let (fs_d, fs_b) = fullSubtractor xs ys bin

    -- Printing Inputs
    putStrLn "Inputs:"
    print xs
    print ys
    print cin

    putStrLn "\n--- Half Adder (Sum / Carry) ---"
    print ha_s
    print ha_c

    putStrLn "\n--- Half Subtractor (Diff / Borrow) ---"
    print hs_d
    print hs_b

    putStrLn "\n--- Full Adder (Sum / CarryOut) ---"
    print fa_s
    print fa_c

    putStrLn "\n--- Full Subtractor (Diff / BorrowOut) ---"
    print fs_d
    print fs_b