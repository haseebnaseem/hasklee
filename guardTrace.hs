import System.Environment
import Debug.Trace

bmiTell bmi
    | f bmi < 10 && 20<=18.5= trace ("(fbmi<10),(20<=18.5)") 8.5
    | f bmi > 20 && 40<=18.5= trace ("NOT(fbmi<10),NOT(20<=18.5),(fbmi>20),(40<=18.5)") 8.5
    |bmi<=18.5= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),(bmi<=18.5)") 8.5
    | f bmi < 10 && 20<=25.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),(fbmi<10),(20<=25.0)") 5.0
    | f bmi > 20 && 40<=25.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),(fbmi>20),(40<=25.0)") 5.0
    |bmi<=25.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),NOT(fbmi>20),NOT(40<=25.0),(bmi<=25.0)") 5.0
    | f bmi < 10 && 20<=30.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),NOT(fbmi>20),NOT(40<=25.0),NOT(bmi<=25.0),(fbmi<10),(20<=30.0)") 0.0
    | f bmi > 20 && 40<=30.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),NOT(fbmi>20),NOT(40<=25.0),NOT(bmi<=25.0),NOT(fbmi<10),NOT(20<=30.0),(fbmi>20),(40<=30.0)") 0.0
    |bmi<=30.0= trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),NOT(fbmi>20),NOT(40<=25.0),NOT(bmi<=25.0),NOT(fbmi<10),NOT(20<=30.0),NOT(fbmi>20),NOT(40<=30.0),(bmi<=30.0)") 0.0
    | otherwise = trace ("NOT(fbmi<10),NOT(20<=18.5),NOT(fbmi>20),NOT(40<=18.5),NOT(bmi<=18.5),NOT(fbmi<10),NOT(20<=25.0),NOT(fbmi>20),NOT(40<=25.0),NOT(bmi<=25.0),NOT(fbmi<10),NOT(20<=30.0),NOT(fbmi>20),NOT(40<=30.0),NOT(bmi<=30.0),(f==VAR)") 58.0

g x
    | x < 5 && 25<10= trace ("(x<5),(25<10)") 0
    | x < 8 && 45<10= trace ("NOT(x<5),NOT(25<10),(x<8),(45<10)") 0
    |x*2<10= trace ("NOT(x<5),NOT(25<10),NOT(x<8),NOT(45<10),(x)") 0
    | x < 5 && 25>20= trace ("NOT(x<5),NOT(25<10),NOT(x<8),NOT(45<10),NOT(x),(x<5),(25>20)") 0
    | x < 8 && 45>20= trace ("NOT(x<5),NOT(25<10),NOT(x<8),NOT(45<10),NOT(x),NOT(x<5),NOT(25>20),(x<8),(45>20)") 0
    |x*2>20= trace ("NOT(x<5),NOT(25<10),NOT(x<8),NOT(45<10),NOT(x),NOT(x<5),NOT(25>20),NOT(x<8),NOT(45>20),(x)") 0
    | otherwise = trace ("NOT(x<5),NOT(25<10),NOT(x<8),NOT(45<10),NOT(x),NOT(x<5),NOT(25>20),NOT(x<8),NOT(45>20),NOT(x),(f==VAR)") x
f y
    | y < 5 = trace ("(y<5)") 25
    | y < 8 = trace ("NOT(y<5),(y<8)") 45
    | otherwise = trace ("NOT(y<5),NOT(y<8),(f==VAR)") y*2

main = do
    minput1 <- getArgs
    let input1 = head minput1
    let instrxx3567 = (read input1)
    print (bmiTell instrxx3567)
