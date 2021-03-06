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



open OUT, ">", $out_file;

my $count = 0;
for(my $j = 0; $j < scalar(@geneorder); ++$j){
open IN, $in_file;
	while (<IN>) {
	my @data = split /[\t\n]+/;
	if ($geneorder[$j] eq $data[12]){

		#read refgene,txt record
		$mRNAcounter = $mRNAcounter + 1;
		$name = $data[1];
		$chrom = $data[2];
		$strand = $data[3];
		$txStart = $data[4] + 1;
		$txEnd = $data[5];
		$cdsStart = $data[6] + 1;
		$cdsEnd = $data[7];
		$exonCount = $data[8];
		$exonStarts = $data[9];
		$exonEnds = $data[10];
		$score = $data[11];
		$name2 = $data[12];
		$cdsStartStat = $data[13];
		$cdsEndStat = $data[14];
		$exonFrames = $data[15];

		#Gene
		if ($mRNAcounter == 1){print OUT (join "\t",$chrom,'.','gene',$txStart,$txEnd,'.',$strand,'.','ID=gene'.($j+1).';Name='.$name2."\n");}

		#mRNA
		print OUT (join "\t",$name2,'.',"mRNA",$txStart,$txEnd,'.',$strand,'.','ID=mRNA'.$mRNAcounter.';Parent=gene'.($j+1).';Name='.$name."\n");

		#Exon & CDS
		my @exon_beg = split /,/, $exonStarts;
 		my @exon_end = split /,/, $exonEnds;
 		my @exon_frames = split /,/, $exonFrames;
		my $cdsStartUpdate = $cdsStart;
		my $cdsEndUpdate = $cdsEnd;
 		for(my $i = 0; $i < $exonCount; ++$i){
 		print OUT (join "\t", $name2, '.', 'exon', $exon_beg[$i] + 1, $exon_end[$i], '.', $strand,'.','ID=exon'.($i+1).';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");

		if ($exon_beg[$i] < $cdsStart
		and $exon_end[$i] > $cdsEnd) {
			$start = $cdsStart;
			$stop  = $cdsEnd;
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}

		if ($exon_beg[$i] < $cdsStart
		and $exon_end[$i] < $cdsEnd) {
			$start = $cdsStart;
			$stop  = $exon_end[$i];
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}
		
		if ($exon_beg[$i] > $cdsStart
		and $exon_end[$i] < $cdsEnd) {
			$start = $exon_beg[$i];
			$stop  = $exon_end[$i];
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}

		if ($exon_beg[$i] > $cdsStart
		and $exon_end[$i] > $cdsEnd) {
			$start = $exon_beg[$i];
			$stop  = $cdsEnd;
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}
		

		if ($exon_beg[$i] < $cdsStart
		and $exon_end[$i] >= $cdsEnd) {
			$start = $exon_beg[$i];
			$stop  = $cdsEnd - 1;
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}

		if ($exon_beg[$i] <= $cdsStart
		and $exon_end[$i] > $cdsEnd) {
			$start = $exon_beg[$i];
			$stop  = $cdsEnds-1;
		print OUT (join "\t", $name2, '.', 'CDS', $start, $stop, '.', $strand,'.','ID=CDS'.$mRNAcounter.';Parent=mRNA'.$mRNAcounter.';Name='.$name."\n");}
		}

	}
}

close IN;
$mRNAcounter = 0;

}
close OUT;


