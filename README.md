# pipelord3

## Installation
```
git clone https://github.com/maxlcummins/pipelord3.git
cd pipelord3
snakemake --use-conda
```

## Usage

1. Duplicate the yaml file at `config/default.yaml` and edit variables to your liking
2. Edit `workflow/Snakefile` at line 7, changing `configfile: "config/default.yaml"` to instead include your new yaml file
3. Run snakemake with the --use-conda flag

`snakemake --use-conda`

