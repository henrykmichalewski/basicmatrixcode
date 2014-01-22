""" Part of an exam in information theory, Jan/Feb 2014, University of Warsaw
    Damian Niwinski, Henryk Michalewski """
    
""" Encode a given source.txt file into encode.txt using a precomputed publick.key matrix """

import numpy as np
import pickle
    
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

    # we need the publickey in order to derive a matrix K
    # the file public.key is a part of repository
    publickey = open("public.key","r")
    K = pickle.load(publickey)
    
    # we expect that the source.txt is properly formatted, that is consists 
    # of binary numbers of length 163 in separate lines
    source = open("source.txt","r")
    sourcelines = source.readlines()
    
    # here we store the encoded lines - each line will be of length 256
    encoded = open("encoded.txt","w")
    
    for line in sourcelines:
        print "Line of length "+str(len(line))
        # we parse it to a binary vector
        numbers = vector([int(line[i:i+1]) for i in range(0, len(line)-1)])

        # generate a modifier
        mod = modVector(256,7)
        
        # encode the input line
        penc = numbers*K
        
        # and finally add errors and write the result to encoded.txt
        enc = toString(modularize(penc+mod))
        encoded.write(enc+"\n")
