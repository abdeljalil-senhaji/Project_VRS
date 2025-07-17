# Project_VRS: A Snakemake Pipeline for Viral SNP Analysis and Consensus Genome Generation
[![Documentation](https://img.shields.io/badge/Documentation-github-brightgreen.svg?style=for-the-badge)](https://github.com/abdeljalil-senhaji/Project_VRS)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

**Project_VRS** is an automated and scalable bioinformatics pipeline for the analysis of viral sequencing data. Built using the [Snakemake](https://snakemake.readthedocs.io/) workflow management system, this project streamlines the process from raw sequencing reads to final variant calls (SNPs) and a polished consensus genome.

The primary goals of this pipeline are:
- To identify Single Nucleotide Polymorphisms (SNPs) relative to a reference genome.
- To generate a high-quality consensus genome for each sample.
- To provide a reproducible and easy-to-use workflow for viral genomics.

This pipeline is designed to be portable and can be executed on a local machine, a server, or a high-performance computing (HPC) cluster.

## Workflow Diagram

The pipeline executes the following steps, orchestrated by Snakemake:

## Prerequisites

The pipeline is deployed on an HPC (High Performance Computing) server based on GoDocker. We use Docker images for each script and tool.
Before you begin, ensure you have the following software installed:

- Snakemake: The workflow manager that runs the pipeline.
- All other bioinformatic tools (e.g., FastQC, Cutadapt, Bowtie2, Samtools, iVar) will be installed by Snakemake.

## Installation and Setup
* 1- Clone the repository: 
```bash
git clone https://github.com/abdeljalil-senhaji/Project_VRS.git
cd Project_VRS
```
* 2- Configure the pipeline:
Modify the config.json file to specify the paths to your input files and adjust parameters.
```bash
{
{
    "description": "This config file is designed to run pipeline.",
    "author": "",
    "general_path": {
        "INPUT_PATH": "path/to/your/data",
        "OUTPUT_PATH": "path/to/your/output",
        "RULE_PATH": "path/to/your/snakemake_rules",
        "REF_DATA": "path/to/your/VRS_REF"
    },
    ... 
}
```

* 3- Prepare the reference genome:
Ensure your reference genome file (e.g., VRS_REF/reference.fasta) is indexed by the alignment tool you are using (e.g., bowtie2-build). The pipeline can be configured to do this automatically.

## Usage

Snakemake makes running the pipeline simple and robust.

* 1- Clean cache:
Script to delete the cache file in output to avoid the bug.
```bash
bash clean.sh
```
* 2- Execution:
Run the pipeline on your machine, using a specified script with commandline.
```bash
bash commandline.sh
```
* 3- HPC Cluster execution:
This pipeline is configured to run on an HPC cluster with a scheduler like Godocker. The cluster.json file contains default resource allocations.
```bash
bash commandline_return.sh
```

## Output Directory Structure
All results will be generated in the directory specified in config.json (e.g., output/). The structure will be as follows:


```bash
output/
├── trimmed/                # Trimmed FASTQ files
│   ├── sample1_R1.trimmed.fastq.gz
│   └── sample1_R2.trimmed.fastq.gz
├── aligned/                # Sorted, deduplicated BAM files and indices
│   ├── sample1.dedup.bam
│   └── sample1.dedup.bam.bai
├── variants/               # VCF files from variant calling
│   └── sample1.vcf
├── consensus/              # Final consensus genomes
│   └── sample1.consensus.fasta
└── qc/                     # Quality control reports (e.g., from FastQC)
    ├── sample1_fastqc.html
    └── ...
```

## Contributing
Contributions are welcome! If you have suggestions for improvements, please open an issue or submit a pull request.

## Contact

👤 Abdeljalil Senhaji Rachik
📧 senhajirachikabdeljalil@gmail.com
🐙 GitHub