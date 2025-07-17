import re
import glob
import os



rulePath=config["general_path"]["RULE_PATH"]


include: rulePath+"/iget_samples_rule"
include: rulePath+"/cutadapt_rule"
include: rulePath+"/iget_reference_bowtie2_rule"
include: rulePath+"/iget_location_rule"
include: rulePath+"/bowtie2_rule"
include: rulePath+"/samtools_process_rule"
include: rulePath+"/ivar_rule"




workdir: config["general_path"]["OUTPUT_PATH"]
input_path = config["general_path"]["INPUT_PATH"]
output_path = config["general_path"]["OUTPUT_PATH"]


sample_ids = []

ref_ids = ["RSVA", "RSVB"]

sampleName=glob.glob("/scratch/recherche/asenhaji/v2_IllumiConsensusSNP_pipeline/data/*.fastq.gz")
for name in sampleName:
    path = input_path + "/"
    name = name.replace(path, '')
    a = re.split('/', name)
    name = a[0]
    name = name.replace('_R1_001.fastq.gz', '')
    name = name.replace('_R2_001.fastq.gz', '')
    sample_ids.append(name)


mate_ids = ["R1","R2"]




#cutadapt = expand((output_path+"/{sample_id}/{sample_id}_R1_paired.fq.gz", output_path+"/{sample_id}/{sample_id}_R2_paired.fq.gz", output_path+"/{sample_id}/{sample_id}_R _unpaired_trim.fq.gz", output_path+"/{sample_id}/{sample_id}_R2_unpaired_trim.fq.gz"), sample_id = sample_ids),
#bowtie2 = expand((output_path+"/{sample_id}/{ref_id}/{sample_id}.sam"), sample_id =sample_ids, ref_id = ref_ids),

#samtools_process = expand((output_path+"/{sample_id}/{ref_id}/{sample_id}_ordered.bam"), sample_id = sample_ids, ref_id = ref_ids)

ivar = expand((output_path+"/{sample_id}/{ref_id}/{sample_id}_{ref_id}_consensus.fa"), sample_id = sample_ids, ref_id = ref_ids)


		
rule all:
        input:
               ivar
#               samtools_process
        shell:
                "touch "+output_path+"/done"
