import System.Environment
import Debug.Trace

bmiTell bmi
    | f bmi < 10 && 20<=18.5=18.5
    | f bmi > 20 && 40<=18.5=18.5
    |bmi<=18.5=18.5
    | f bmi < 10 && 20<=25.0=25.0
    | f bmi > 20 && 40<=25.0=25.0
    |bmi<=25.0=25.0
    | f bmi < 10 && 20<=30.0=30.0
    | f bmi > 20 && 40<=30.0=30.0
    |bmi<=30.0=30.0
    | otherwise = 58.0

g x
    | x < 5 && 25<10=20
    | x < 8 && 45<10=20
    |x*2<10=20
    | x < 5 && 25>20=40
    | x < 8 && 45>20=40
    |x*2>20=40
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
