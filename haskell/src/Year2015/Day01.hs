module Year2015.Day01 (solvePart1, solvePart2) where

solvePart1 :: String -> Int
solvePart1 = foldr
    (\c floor -> floor + case c of
        '(' -> 1
        ')' -> -1
    )
    0

solvePart2
    = length
    . takeWhile (>= 0)
    . scanl
        (\floor c -> floor + case c of
            '(' -> 1
            ')' -> -1
        )
        0