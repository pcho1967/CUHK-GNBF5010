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

 	
