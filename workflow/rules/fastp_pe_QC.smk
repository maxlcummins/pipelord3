rule fastp_pe_wo_trimming:
    input:
        sample=[config['input_dir']+"/{sample}.R1.fastq.gz", config['input_dir']+"/{sample}.R2.fastq.gz"]
    output:
        html=config['output_dir']+"/fastp/report/pe/{sample}.html",
        json=config['output_dir']+"/fastp/report/pe/{sample}.json"
    log:
        "logs/fastp/pe_wo_trimming/{sample}.log"
    params:
        extra=""
    threads: 2
    wrapper:
        "v0.75.0/bio/fastp"