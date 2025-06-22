{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# LANGUAGE ForeignFunctionInterface #-}

-- https://github.com/minimapletinytools/haskell-ffi-cabal-foreign-library-examples/blob/master/src/Potato.hs
-- https://wiki.haskell.org/Foreign_Function_Interface

module Haskie (hello_haskie) where
-- import Data.Void (Void)
import Data.Colour.SRGB (sRGB24)
import System.Console.ANSI

import Foreign.C.Types
import Foreign.Ptr

-- Foreign import for atexit
foreign import ccall "stdlib.h atexit"
    c_atexit :: FunPtr (IO ()) -> IO CInt

foreign import ccall "wrapper" wrapper :: (IO ()) -> IO (FunPtr (IO ()))

foreign export ccall bye_haskie :: IO ()
bye_haskie = do
    putStr "Bye from "
    setSGR [SetRGBColor Foreground $ sRGB24 142 78 138]
    putStr "Haskell"
    setSGR [Reset]
    putStrLn "!"

foreign export ccall hello_haskie :: IO ()
hello_haskie = do
    bye_haskie_ptr <- wrapper bye_haskie
    c_atexit bye_haskie_ptr
    -- Don't do that! Keep it valid
    -- freeHaskellFunPtr bye_haskie_ptr
    putStr "Hello from "
    -- setSGR [SetRGBColor Foreground $ sRGB24 94 80 133]
    setSGR [SetRGBColor Foreground $ sRGB24 142 78 138]
    -- setSGR [SetRGBColor Foreground $ sRGB24 69 58 98]
    putStr "Haskell"
    setSGR [Reset]
    putStrLn "!"
