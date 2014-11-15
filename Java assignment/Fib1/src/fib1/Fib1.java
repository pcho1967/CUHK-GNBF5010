/* Simple For loop */

package fib1;

import java.math.BigInteger;

public class Fib1 {

   public static void main(String[] args) {      
      int N = Integer.parseInt(args[0]);
      BigInteger f = BigInteger.ZERO;
      BigInteger g = BigInteger.ONE;

      for (int i = 1; i <= N; i++) {
         f = f.add(g);
         g = f.subtract(g);
         System.out.println(f);}  
   }
  
}

