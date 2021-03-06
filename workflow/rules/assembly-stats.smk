rule run_assembly_stats:
    input:
        #Input assembly
        assembly=config['output_dir']+"/shovill/{sample}.{assembler}.contigs.fa",
    output:
        #Assembly statistics
        assembly_stats=config['output_dir']+"/assembly-stats/{assembler}/{sample}.txt"
    params:
        # Tab delimited output, with a header, is set as the default. Other options are available:
        #   -l <int>
        #       Minimum length cutoff for each sequence.
        #       Sequences shorter than the cutoff will be ignored [1]
        #   -s
        #       Print 'grep friendly' output
        #   -t
        #       Print tab-delimited output
        #   -u
        #       Print tab-delimited output with no header line
        # If you want to add multiple options just delimit them with a space.
        # Note that you can only pick one output format
        # Check https://github.com/sanger-pathogens/assembly-stats for more details
        extra="-t",
    log:
        "logs/{assembler}/{sample}.assembly-stats.log",
    threads: 1
    wrapper:
        #"0.2.0/bio/assembly-stats"
        "https://raw.githubusercontent.com/maxlcummins/snakemake-wrappers/assembly-stats/bio/assembly-stats/wrapper.py"
