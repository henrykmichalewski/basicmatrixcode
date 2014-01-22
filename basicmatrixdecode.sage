""" If you like, you can run sum experiments with this code,
    but you have to provide permutation and scramble matrices """

""" Part of an exam in information theory, Jan/Feb 2014, University of Warsaw
    Damian Niwinski, Henryk Michalewski """

import numpy as np
import pickle
from reedmuller import ReedMuller
    
def modularize(v):
    vnew = [0]*len(v)
    for i in range(len(v)):
        vnew[i] = v[i] % 2
    return vnew
    
def toString(l):
    snew = ""
    for i in range(len(l)):
        snew += str(l[i])
    return snew
    
def modVector(l,r):
    arr = np.array([0] * (l-r) + [1] * r)
    np.random.shuffle(arr)
    return arr

if __name__ == '__main__':
    
    # you may uncomment the following two lines only if you
    # provide your own scramble.key and permutation.key files 
    # scramble = open("scramble.key","r")    
    # permutation = open("permutation.key","r")
    
    # this file is full Reed-Muller 4,8 code correcting 7 errors
    # the matrix is a part of the ReedMuller class and is of the size 163 x 256 
    rm = open("fullcode48","r")

    # this is the file we are planning to decode
    encoded = open("encoded.txt","r")
    
    # this is the file we are planning to write into
    decoded = open("decoded.txt","w")
    
    # we unpickle the scramble and permuation matrices
    # S = pickle.load(scramble)
    # P = pickle.load(permutation)

    # read the input lines
    encodedlines = encoded.readlines()

    # here comes the input we plan to encode
 
    for line in encodedlines:
        print "Line of length "+str(len(line))
        # parse the input into a binary vector
        
        # here is a bit of code missing 
        result = ""
        decoded.write(result+"\n")
