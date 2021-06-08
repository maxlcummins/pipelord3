rule shovill:
  input:
    r1=config['output_dir']+"/fastp/trimmed/pe/{sample}.R1.fastq.gz",
    r2=config['output_dir']+"/fastp/trimmed/pe/{sample}.R2.fastq.gz"
  output:
    raw_assembly=config['output_dir']+"/shovill/{sample}.{assembler}.assembly.fa",
    contigs=config['output_dir']+"/shovill/{sample}.{assembler}.contigs.fa"
  params:
    extra="--minlen 200"
  log:
    "logs/shovill/{sample}.{assembler}.log"
  threads: 4
  wrapper:
    "v0.75.0/bio/shovill"