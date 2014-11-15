/* Fast doubling */

package fib4;

import java.math.BigInteger;

public class Fib4  {

	public static BigInteger fib(int n) {
		BigInteger a = BigInteger.ZERO;
		BigInteger b = BigInteger.ONE;
		int m = 0;
		for (int i = 31 - Integer.numberOfLeadingZeros(n); i >= 0; i--) {
			// Loop invariant: a = F(m), b = F(m+1)
			assert a.equals(slowFibonacci(m));
			assert b.equals(slowFibonacci(m+1));
			
			// Double it
			BigInteger d = multiply(a, b.shiftLeft(1).subtract(a));
			BigInteger e = multiply(a, a).add(multiply(b, b));
			a = d;
			b = e;
			m *= 2;
			assert a.equals(slowFibonacci(m));
			assert b.equals(slowFibonacci(m+1));
			
			// Advance by one conditionally
			if (((n >>> i) & 1) != 0) {
				BigInteger c = a.add(b);
				a = b;
				b = c;
				m++;
				assert a.equals(slowFibonacci(m));
				assert b.equals(slowFibonacci(m+1));
			}
		}
		return a;
	}
        
        	private static BigInteger slowFibonacci(int n) {
		BigInteger a = BigInteger.ZERO;
		BigInteger b = BigInteger.ONE;
		for (int i = 0; i < n; i++) {
			BigInteger c = a.add(b);
			a = b;
			b = c;
		}
		return a;
	}

                	private static BigInteger multiply(BigInteger x, BigInteger y) {
		return x.multiply(y);  // Replace this line with Karatsuba multiplication, etc. if available
	}
	

                    public static void main(String[] args) {
                         int N = Integer.parseInt(args[0]);
                            for (int i = 1; i <= N; i++)
                            System.out.println(fib(i));

          }
        
}
