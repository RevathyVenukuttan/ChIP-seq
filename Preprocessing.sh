# Obtain the raw data files

cd ~/bioinfo/bioe582/2_chipseq
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR576/SRR576933/SRR576933.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR576/SRR576938/SRR576938.fastq.gz
mv SRR576933.fastq.gz SRR576933_case.fastq.gz
mv SRR576938.fastq.gz SRR576938_control.fastq.gz

# index the reference genome using samtools

cd ~/bioinfo/bioe582/2_chipseq/ref
samtools faidx NC_000913.fa

# index the reference with BWA

bwa index NC_000913.fa

#generate the QC reports

cd ~/bioinfo/bioe582/2_chipseq
fastqc SRR576933_case.fastq.gz
fastqc SRR576938_control.fastq.gz
