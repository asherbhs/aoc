module Main (main) where

import System.Environment (getArgs)

import Year2015.Day01

main :: IO ()
main = do
    [year, day, part, path] <- getArgs
    input <- readFile path
    case year of
        "2015" -> case day of
            "01" -> case part of
                "1" -> print $ Year2015.Day01.solvePart1 input
                "2" -> print $ Year2015.Day01.solvePart2 input
