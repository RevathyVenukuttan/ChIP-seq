## ChIP-seq project for E. coli to identify enriched regions through peak calling

Project undertaken for the course BIOE 582 to understand ChIP-seq data analysis and the steps for obtaining Transcription Factor (TF) binding sites from E. coli ChIP-Seq data. 

### Data

The data for this project comes from a e.coli ChIP-seq project including two samples. The case sample, SRR576933, is the FNR IP ChIP-seq Anaerobic A The ChIP-seq data for both samples are single-end.

### Reference Genome and Indexing

The reference genome of e.coli is _~/bioinfo/bioe582/2_chipseq/ref/NC000913.fa_ , the Escherichia coli K-12 strain, a circular DNA with 4641652 base pairs, which can be downloaded from: https://www.ncbi.nlm.nih.gov/nuccore/NC_000913.3 
**samtools** is used to index the reference genome which generates an index file **NC_000913.fa.fai**. BWA is then used to efficiently map the reads to the refernce genome NC_000913.fa. This process generates 5 files:
```bash
NC_000913.amb
NC_000913.ann
NC_000913.bwt
NC_000913.pac
NC_000913.sa
```

QC reports are then generated to check the quality for each of the case and control fastq files. 

### Alignment of Reads

Short reads are mapped to the reference genome to create the .sam alignment files, which are then sorted by genomic coordinates and converted to .bam files. The bam files upon indexing generates two more files **SRR576933_case.bam.bai** and **SRR576938_control.bam.bai**. 

### Peak Calling

Here, ‘nomodel’ ensures that a shifting model is not build. Script is available in **align_peak.sh**. 3 output files are generated and gets stored in the working directory. These files are:
```bash
ecoli_peaks.narrowPeak
ecoli_peaks.xls
ecoli_summits.bed
```
The .xls file contains the absolute summit location or all of the absolute co-ordinates. 







