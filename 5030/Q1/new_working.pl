my ($bin, $name, $chrom, $strand, $txStart, $txEnd, $cdsStart, $cdsEnd, $exonCount, $exonStarts, $exonEnds, $score, $name2, $cdsStartStat, $cdsEndStat, $exonFrames);

my $in_file = $ARGV[0]; # input file
my $out_file = $ARGV[1]; # output file

open IN, $in_file;
while (<IN>){
	my @gene2list = split /[\t\n]+/;
	push (@genelist, $gene2list[12]);
}
close IN;
my @geneorder = sort(uniq(@genelist));


sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}


open IN, $in_file;
open OUT, ">", $out_file;

my $count = 0;
for(my $j = 0; $j < scalar(@geneorder); ++$j){

	while (<IN>) {
	my @data = split /[\t\n]+/;
	if (@geneorder[$j] eq @data[12]){print "match";}
}
}
close OUT;
close IN;