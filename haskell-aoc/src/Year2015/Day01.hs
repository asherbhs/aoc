{-# LANGUAGE LambdaCase #-}

module Year2015.Day01 (solvePart1, solvePart2) where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

solvePart1 :: String -> Int
solvePart1 = sum . map
    (\case
        '(' -> 1
        ')' -> -1
    )

solvePart2
    = succ
    . fromJust
    . elemIndex (-1)
    . scanl1 (+)
    . map
        (\case
            '(' -> 1
            ')' -> -1
        )