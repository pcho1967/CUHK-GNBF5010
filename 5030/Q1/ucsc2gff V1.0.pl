my ($bin, $name, $chrom, $strand, $txStart, $txEnd, $cdsStart, $cdsEnd, $exonCount, $exonStarts, $exonEnds, $score, $name2, $cdsStartStat, $cdsEndStat, $exonFrames);

my $in_file = $ARGV[0]; # input file
my $out_file = $ARGV[1]; # output file


open IN, $in_file;
	my %ucsc;
	while (<IN>) {
	my @field = split /[\t\n]+/;
		$bin = $field[0];
		$name = $field[1];
		$chrom = $field[2];
		$strand = $field[3];
		$txStart = $field[4] + 1;
		$txEnd = $field[5];
		$cdsStart = $field[6] + 1;
		$cdsEnd = $field[7];
		$exonCount = $field[8];
		$exonStarts = $field[9];
		$exonEnds = $field[10];
		$score = $field[11];
		$name2 = $field[12];
		$cdsStartStat = $field[13];
		$cdsEndStat = $field[14];
		$exonFrames = $field[15];
		$ucsc{$name2} = $bin."\t".$name."\t".$chrom."\t".$strand."\t".$txStart."\t".txEnd."\t".cdsStart."\t".cdsEnd."\t".exonCount."\t".exonStarts."\t".exonEnds;
		}
close IN	

For my $ucsc(@ucsc){
	push (my @genelist, $ucsc{$name2}};
}
my @geneorder = sort(uniq(@genelist));

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

print @geneorder;

