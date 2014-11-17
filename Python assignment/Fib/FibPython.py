import Fib

#----------------------------------------------------------------------
if __name__ == "__main__":
    import sys
    print sys.argv
    algorithim = sys.argv[1].lower()
    valFib = int(sys.argv[2])
    if algorithim == "si":
        Fib.SimpleIteration(valFib)
    elif algorithim == "sr":
        print SimpleRecursive(valFib)
    elif algorithim == "mr":
        print MemorizedRecursive(valFib)
    else:
        pass
		