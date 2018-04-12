module Main (main) where

import Control.Concurrent.Async (asyncThreadId, wait, withAsync)
import Control.Exception (evaluate)
import Control.DeepSeq (force)
import Debug.Trace (traceEventIO)
import GHC.Conc (labelThread, myThreadId)

main :: IO ()
main = do
  threadId <- myThreadId
  labelThread threadId "main"

  withAsync (doWork fib 35) $ \worker1 -> do
    labelThread (asyncThreadId worker1) "worker1"
    withAsync (doWork fact 68000) $ \worker2 -> do
      labelThread (asyncThreadId worker2) "worker2"
      result1 <- wait worker1
      result2 <- wait worker2
      print result1
      print result2

doWork :: (Integer -> Integer) -> Integer -> IO Integer
doWork f i = do
  result <- evaluate . force . f $ i
  traceEventIO "doWork: returning..."
  pure result

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)
