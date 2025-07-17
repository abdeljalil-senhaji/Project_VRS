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

```mermaid
graph TD
    A[Raw Paired-End FASTQ Reads] --> B{1. QC & Adapter Trimming};
    B --> C{2. Alignment to Reference};
    C --> D{3. BAM Processing (Sort, Index)};
    D --> E{4. Mark PCR Duplicates};
    E --> F{5. Variant Calling};
    F --> G[Variant Call File (VCF)];
    F --> H[Consensus Genome (FASTA)];
    I[Reference Genome (FASTA)] --> C;