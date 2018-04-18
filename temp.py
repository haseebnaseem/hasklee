#!/usr/bin/env python3


##############################################
############ Version 1 #######################
# Works for cases where:
# Only 1 function
# Function has only 1 variable
# Pattern matcing with equal and not equal
##############################################
##############################################



import os
from pyparsing import *
os.chdir(os.getcwd())




case1 = Word(alphanums) + ZeroOrMore(Word(alphanums) | Literal('-'))
case2 = Word(alphanums) + ZeroOrMore(Word(alphanums) | Literal('==') | Literal('>=') | Literal('<=') | Literal('<') | Literal('>') | Literal('.') | Literal('&&'))
f1 = open('guards.hs', 'r')
f2 = open('guardTrace2.hs', 'w')
results = ""
newLine=""


prev_conditions = []
variableName=''


for line in f1:
	if ("=" in line and "|" not in line and "main" not in line and "instrxx3567" not in line and "let" not in line):
			print line
			results = case1.parseString( line )
			print results

			newLine = line[0:line.find("=")+1] + ' trace ('
			print newLine

			templine = ""

			for i in prev_conditions:
				templine = templine + "NOT"+ i + ','
				print templine

			templine2 = ""
			item  = results[1:]
			print item
			item = ''.join(item)
			print "------------------------ ", item

			if item.isalpha():
				templine2 = '(' + 'x1' + "==" + "VAR" + ')' 
			else:
				templine2 = '(' + 'x1' +"=="+ item + ')'


			print type(templine2)

			prev_conditions.append(templine2)

			newLine  = newLine + '"'+templine + templine2 + '"'

			#newLine = newLine + ' val: "'
			#for item in results[1:]:
			#	newLine = newLine + " ++ show " + item + ' ++ " "'

			newLine = newLine + ") "
			newLine = newLine + line[line.find("=")+2:]
			print newLine
			f2.write(line.replace(line, newLine))


	elif ("|" in line):


			print "found guard"
			let_try=line[line.find('|')+1:]
			results = case2.parseString(let_try)
			print "                      "
			print "                      "
			print results
			print "                      "
			print "                      "


			newLine = line[0:line.rfind('=')+1] + ' trace ('
			templine = ""
			for i in prev_conditions:
				templine = templine + 'NOT' + i + ','
			if 'otherwise' not in results:
				if variableName == '':
					variableName = results[0]

			multiCond = []

			flag = 0;
			lastIDX = 0;
			for idx, val in enumerate(results):
				print idx
				if( val == "&&" or idx == len(results)):
					multiCond.append(''.join(results[lastIDX:idx]));
					lastIDX = idx+1
					print "here here ================="
					flag = 1;
			if(flag == 1):
				multiCond.append(''.join(results[lastIDX:]));





			print multiCond;
			firstTime = 1
			anotherTemp = ''
			if(len(multiCond) != 0):
				for i in multiCond:

					prev_conditions.append('('+ i +')')

					if(firstTime == 1):
						anotherTemp = anotherTemp+'('+ i +')'
						firstTime = 0
					else:
						anotherTemp = anotherTemp+',('+ i +')'
				newLine = newLine + '"' + templine + anotherTemp + '"' + ')'
				newLine = newLine + " " + line[line.rfind('=')+2:]
				print newLine
				f2.write(newLine);

			
			else:
				results = ''.join(results);
				if 'otherwise' not in results:
					results = '('+results+')'
				else:
					results = '('+variableName+'==VAR)'
				print 'results',results
				prev_conditions.append(results)
				newLine = newLine + '"' + templine + results + '"' + ')'
				newLine = newLine + " " + line[line.rfind('=')+2:]
				print newLine
				f2.write(newLine);
	else:
		f2.write(line.replace(line, line))


f1.close()
f2.close()
