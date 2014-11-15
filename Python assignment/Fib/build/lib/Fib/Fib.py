# http://www.pythontutor.com/visualize.html#mode=display

#----------------------------------------------------------------------
def SimpleIteration(n):
 a,b = 1,1
 print a
 for i in range(n-1):
  a,b = b,a+b
  print a
 return a
 
	 
#----------------------------------------------------------------------
def SimpleRecursive(n):
 if n==1 or n==2:
  return 1
 return SimpleRecursive(n-1)+SimpleRecursive(n-2)

 
#----------------------------------------------------------------------
def memoize(obj):
    cache = {}

    def memoizer(*args, **kwargs):
        if args not in cache:
            cache[args] = obj(*args, **kwargs)
        return cache[args]
    return memoizer

@memoize
def MemorizedRecursive(n):
    if n < 2:
        return n
    else:
        return MemorizedRecursive(n-1) + MemorizedRecursive(n-2)
 
#----------------------------------------------------------------------
def MatrixExponentiation(x):
    """"""
    return x


#----------------------------------------------------------------------
def FastDoubling(x):

	return x
 	
#----------------------------------------------------------------------
if __name__ == "__main__":
    import sys
    print sys.argv
    algorithim = sys.argv[1].lower()
    valFib = int(sys.argv[2])
    if algorithim == "si":
        SimpleIteration(valFib)
    elif algorithim == "sr":
        print SimpleRecursive(valFib)
    elif algorithim == "mr":
        print MemorizedRecursive(valFib)
    elif algorithim == "me":
        print MatrixExponentiation(valFib)
    elif algorithim == "fd":
        print FastDoubling(valFib)		
    else:
        pass