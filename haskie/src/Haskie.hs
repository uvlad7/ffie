{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Haskie (hello_haskie) where
-- import Data.Void (Void)
import Data.Colour.SRGB (sRGB24)
import System.Console.ANSI

foreign export ccall hello_haskie :: IO ()
hello_haskie = do
    putStr "Hello from "
    -- setSGR [SetRGBColor Foreground $ sRGB24 94 80 133]
    setSGR [SetRGBColor Foreground $ sRGB24 142 78 138]
    -- setSGR [SetRGBColor Foreground $ sRGB24 69 58 98]
    putStr "Haskell"
    setSGR [Reset]
    putStrLn "!"
