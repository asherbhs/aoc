module Common
    ( splitOn
    ) where

splitOn :: Eq a => [a] -> [a] -> [[a]]
splitOn _ [] = [[]]
splitOn d l = undefined
    -- if d == take (length d) l
    -- then [] : splitOn d $ drop (length d) l
    -- else 