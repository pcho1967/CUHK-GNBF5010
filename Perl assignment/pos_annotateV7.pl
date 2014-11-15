use warnings;
use strict;

open snpFile, "pos.txt" or die $!;
my @snp = <snpFile>;
close snpFile;

open annoDB, "hg19_refGene.txt" or die $!;
my %anno;
while(<annoDB>){
  my @fields = split "\t";
#add this to skip next if false boolen return if not satisfy regular expression  
  if(($fields[2] =~ m/chr(\d)+/)==0){next;}
  my ($refChr) = ($fields[2] =~ m/chr(\d+)/);
  my $start = $fields[4];
  my $end = $fields[5]; 
#build a hash on hash from chromosome to start+end the value as gene   
  $anno{$refChr}{$start."\t".$end}=$fields[12];  
  }
close annoDB;

for my $snp (@snp){
  chomp($snp);
  my ($chr, $pos) = split "\t", $snp;
#directly use pos.txt chromosome to lookup key in hg19_refGene hashes  
  my $chromosome = $chr;
    for my $reflocation (keys %{$anno{$chromosome}}) {
         my ($start, $end) = split "\t", $reflocation;
         my $gene =$anno{$chromosome}{$reflocation};
             if($pos >= $start && $pos <= $end){
              print $chr, "\t", $pos, "\t", $gene,"\n";           
          }
        }
      }
    
  
  
  
  
 
