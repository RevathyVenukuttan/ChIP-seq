#Alignment of short reads
#map short reads to the reference genome

cd ~/bioinfo/bioe582/2_chipseq
bwa mem ./ref/NC_000913.fa SRR576933_case.fastq.gz > SRR576933_case.sam
bwa mem ./ref/NC_000913.fa SRR576938_control.fastq.gz > SRR576938_control.sam

#sort alignment results by genomic co-ordinates and convert to .bam files

samtools view -bS SRR576933_case.sam | samtools sort - -o SRR576933_case.bam
samtools view -bS SRR576938_control.sam | samtools sort - -o SRR576938_control.bam
rm *.sam

#index .bam files

samtools index SRR576933_case.bam 
samtools index SRR576938_control.bam

#Peak Calling

macs2 callpeak -t SRR576933_case.bam -c SRR576938_control.bam -g 4641652 --outdir ./out -n ecoli --nomodel --extsize 147
