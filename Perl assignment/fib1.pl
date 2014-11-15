use warnings;
#use strict; forces to declare variables before using them
use strict;

#declare variables $number,$sum,$val0 and $val1 
#Perl automatically provides an array called @ARGV,
#that holds all the values from the command line thus don't have to declare it 
#define first command line parameter to $number;

my $number = $ARGV[0];
my ($sum, $val0, $val1) = 0;


#initialized zero and first value in fib() and print
{fib(0,1)};
print "Fibonacci series of $number number is: \n"; 
print "0 \n";
print "1 \n";


#recursive fib(), the first call is a second fibonacci number result 
for (1...($number -1)){
fib ($sum ,$val0) ;
print "$sum \n";
}
print "\n\nThe $number Fibonacci number value is $sum \n";

#fnsum = fn-2 + fn-1
sub fib{
($val0, $val1) =@_;
$sum= $val0 + $val1;
}
