rule fastp_pe:
    input:
        sample=[config['input_dir']+"/{sample}.R1.fastq.gz", config['input_dir']+"/{sample}.R2.fastq.gz"]
    output:
        trimmed=[config['output_dir']+"/fastp/trimmed/pe/{sample}.R1.fastq.gz", config['output_dir']+"/fastp/trimmed/pe/{sample}.R2.fastq.gz"],
        # Unpaired reads separately
        unpaired1=config['output_dir']+"/fastp/trimmed/pe/{sample}.u1.fastq.gz",
        unpaired2=config['output_dir']+"/fastp/trimmed/pe/{sample}.u2.fastq.gz",
        # or in a single file
#        unpaired=config['output_dir']+"fastp/rimmed/pe/{sample}.singletons.fastq",
        merged=config['output_dir']+"/fastp/trimmed/pe/{sample}.merged.fastq.gz",
        failed=config['output_dir']+"/fastp/trimmed/pe/{sample}.failed.fastq.gz",
        html=config['output_dir']+"/fastp/report/pe/{sample}.html",
        json=config['output_dir']+"/fastp/report/pe/{sample}.json"
    log:
        "logs/fastp/pe/{sample}.log"
    params:
        adapters="--adapter_sequence ACGGCTAGCTA --adapter_sequence_r2 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC",
        extra="--merge"
    threads: 2
    wrapper:
        "v0.75.0/bio/fastp"