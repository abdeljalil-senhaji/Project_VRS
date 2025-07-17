# Project_VRS: A Snakemake Pipeline for Viral SNP Analysis and Consensus Genome Generation

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
