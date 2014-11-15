use warnings;
use strict;

open snpFile, "pos.txt" or die $!;
my @snp = <snpFile>;
close snpFile;

#convert pos.txt file to hash
my %poshash;
for my $snp1 (@snp){
  chomp($snp1);
  my ($chr1, $pos1) = split "\t", $snp1;
  $poshash{$chr1} = $pos1;}
#extact pos.txt hash key and store in a list
my @list = keys %poshash;

open annoDB, "hg19_refGene.txt" or die $!;
my %anno;
while(<annoDB>){
  my @fields = split "\t";
#add this to skip next if false boolen return if not satisfy regular expression  
  if(($fields[2] =~ m/chr(\d)+/)==0){next;}
  my ($refChr) = ($fields[2] =~ m/chr(\d+)/);
#reduce hash size with append record with same chromosome number as in pos.txt
#check if extact number is in the key list of pos.txt 
  if(grep {$_ eq $refChr}@list){ 
  my $start = $fields[4];
  my $end = $fields[5]; 
  $anno{$refChr."\t".$start."\t".$end} = $fields[12];}
  }
close annoDB;


for my $snp (@snp){
  chomp($snp);
  my ($chr, $pos) = split "\t", $snp;
  for my $refPos (keys %anno){
    my($refChr, $start, $end) = split "\t",$refPos;
    if($chr eq $refChr){
      if($pos >= $start && $pos <= $end){
        print $chr, "\t", $pos, "\t", $anno{$refPos},"\n";
      }
    }
  }
}
