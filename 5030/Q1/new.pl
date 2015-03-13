my ($bin, $name, $chrom, $strand, $txStart, $txEnd, $cdsStart, $cdsEnd, $exonCount, $exonStarts, $exonEnds, $score, $name2, $cdsStartStat, $cdsEndStat, $exonFrames);

my $in_file = $ARGV[0]; # input file
my $out_file = $ARGV[1]; # output file

open IN, $in_file;
while (<IN>){
	my @gene2list = split /[\t\n]+/;
	push (@genelist, $genelist[12]);
}
close IN;
my @geneorder = uniq(@genelist);


sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

print @geneorder;
print @ scalar(@geneorder);

open IN, $in_file;
open OUT, ">", $out_file;
while (<IN>) {
	my @data = split /[\t\n]+/;
	$name = $data[1];
	$chrom = $data[2];
	$strand = $data[3];
	$txStart = $data[4];
	$txEnd = $data[5];
	$cdsStart = $data[6];
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
	print OUT (join "\t",$name2,'.','gene',$txStart,$txEnd,'.',$strand,'.','ID=gene'.$bin.';Name='.$name2."\n");
	#mRNA
	print OUT (join "\t",$name2,'.',"mRNA",$txStart,$txEnd,'.',$strand,'.','ID=mRNA'.$name.';Parent=gene'.$bin.';Name='.$name."\n");
	#Exon & CDS
	my @exon_beg = split /,/, $exonStarts;
 	my @exon_end = split /,/, $exonEnds;
 	my @exon_frames = split /,/, $exonFrames;
	my $cdsStartUpdate = $cdsStart;
	my $cdsEndUpdate = $cdsEnd;
 	for(my $i = 0; $i < $exonCount; ++$i){
 	print OUT (join "\t", $name2, '.', 'exon', $exon_beg[$i] + 1, $exon_end[$i], '.', $strand,'.','ID=exon'.$i.';Parent=mRNA'.$bin.';Name='.$name."\n");}

	}

close OUT;
close IN;

