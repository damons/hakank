#!/usr/bin/python -u
# -*- coding: latin-1 -*-
# 
# Candies problem in Z3
#
# From HackerRank
# https://www.hackerrank.com/challenges/candies
# """
# Alice is a kindergarden teacher. She wants to give some candies to the 
# children in her class.  All the children sit in a line and each  of 
# them  has a rating score according to his or her usual performance.  
# Alice wants to give at least 1 candy for each child.Children get 
# jealous of their immediate neighbors, so if two children sit next 
# to each other then the one with the higher rating must get more 
# candies. Alice wants to save money, so she wants to minimize the 
# total number of candies.
#
# Input
#
# The first line of the input is an integer N, the number of children 
# in Alice's class. Each of the following N lines contains an integer 
# indicates the rating of each child.
#
# Ouput
#
# Output a single line containing the minimum number of candies Alice must give.
#
# Sample Input
#
# 3
# 1
# 2
# 2
#
# Sample Ouput
#
# 4
#
# Explanation
#
# The number of candies Alice must give are 1, 2 and 1.
#
# Constraints:
#
# N and the rating of each child are no larger than 10^5.
# """


# 
# This Z3 model was written by Hakan Kjellerstrand (hakank@gmail.com)
# See also my Z3 page: http://hakank.org/z3/
#
import random
from z3_utils_hakank import *


def candies(input=[1,2,2]):
    
    sol = SolverFor("QF_LIA")

    n = len(input)
    if n < 100:
        print input

    # variables
    x = makeIntVector(sol,"x",n,1,1000)
    z = Int("z")

    # constraints
    sol.add(z == sum(x))
    sol.add(z >= n)

    for i in range(1,n):
        if input[i-1] > input[i]:
            sol.add(x[i-1] > x[i])
        elif input[i-1] < input[i]:
            sol.add(x[i-1] < x[i])

    while sol.check() == sat:
        mod = sol.model()
        if n < 100:
            print "x:", [mod[x[i]] for i in range(n)]
        print "z:", mod[z]
        getLessSolution(sol,mod,z)
    print



candies([1,2,2])
candies([2,3,4,4,4,2,1,3,4])
for i in range(1,5+1):
    n = 10**i
    print "n:", n
    candies([random.randint(1,n) for i in range(n)])

                  
                   
    
