package fib3;

import java.math.BigInteger;
import java.util.ArrayList;

public class Fib3 {
        
       private static ArrayList<BigInteger> fibCache = new ArrayList<BigInteger>();
            static {
                       fibCache.add(BigInteger.ZERO);
                       fibCache.add(BigInteger.ONE);
                        }


       public static BigInteger fib(int n) {
              if (n >= fibCache.size()) {
                  fibCache.add(n, fib(n-1).add(fib(n-2)));
              }
              return fibCache.get(n);
       }

            public static void main(String[] args) {
                 int N = Integer.parseInt(args[0]);
                      for (int i = 1; i <= N; i++)
                        System.out.println(fib(i));

          }

}

