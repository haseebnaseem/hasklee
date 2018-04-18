import System.Environment
import Debug.Trace

bmiTell bmi
    | g bmi <= 18.5 = 18.5
    | g bmi <= 25.0 = 25.0
    | g bmi <= 30.0 = 30.0
    | otherwise = 58.0

g x
    | f x < 10 = 20
    | f x > 20 = 40
    | otherwise = x
f y
    | y < 5 = 25
    | y < 8 = 45
    | otherwise = y*2

main = do
    minput1 <- getArgs
    let input1 = head minput1
    let instrxx3567 = (read input1)
    print (bmiTell instrxx3567)
