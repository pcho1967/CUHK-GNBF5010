/* Matrix exponentiation: */

package fib5;

import java.math.BigInteger;

public class Fib5 {
    
    private static BigInteger fib(int n) {
		BigInteger[] matrix = {BigInteger.ONE, BigInteger.ONE, BigInteger.ONE, BigInteger.ZERO};
		return pow(matrix, n)[1];
	}
	
	// Computes the power of a matrix
	private static BigInteger[] pow(BigInteger[] matrix, int n) {
		if (n < 0)
			throw new IllegalArgumentException();
		BigInteger[] result = {BigInteger.ONE, BigInteger.ZERO, BigInteger.ZERO, BigInteger.ONE};
		while (n != 0) {  // Exponentiation by squaring
			if (n % 2 != 0)
				result = multiply(result, matrix);
			n /= 2;
			matrix = multiply(matrix, matrix);
		}
		return result;
	}
	
	// Multiplies two matrices
	private static BigInteger[] multiply(BigInteger[] x, BigInteger[] y) {
		return new BigInteger[] {
			multiply(x[0], y[0]).add(multiply(x[1], y[2])),
			multiply(x[0], y[1]).add(multiply(x[1], y[3])),
			multiply(x[2], y[0]).add(multiply(x[3], y[2])),
			multiply(x[2], y[1]).add(multiply(x[3], y[3]))
		};
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
