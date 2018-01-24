#!/bin/sh

#SBATCH -s
#SBATCH --partition=nextflow
#SBATCH --mem-per-cpu=400


#Path to user job dir
echo $1
#File location
echo $2
#Project id
echo $3
#Pipeline id
echo $4
#Post URL
echo $5
#Sample Name
echo $6
#File 1
echo $7
#File 2
echo $8
#Reports HTTP route
echo $9
#user_name
echo $10
#user_id
echo $11
#species_name
echo $12
#genome size
echo $13
#nextflow profile
echo $14
#nextflow chewbbaca schema path
echo $15
#nextflow chewbbaca list genes
echo $16
#nextflow chewbbaca list core genes
echo $17
#nextflow chewbbaca species
echo $18
#nextflow seq_typing file 1
echo $19
#nextflow seq_typing file 2
echo $20
#netflow pathotyping file 1
echo $21
#mlst species
echo $22

cd $1

if [ ! -d "data" ]; then
	mkdir data
fi

ln -s $7 ${1}/data/sample_1.fastq.gz
ln -s $8 ${1}/data/sample_2.fastq.gz

echo "\nincludeConfig 'platform.config'" >> nextflow.config

srun nextflow run $2 --projectId=$3  --pipelineId=$4 --platformHTTP=$5 --sampleName=$6 --reportHTTP=$9 --currentUserName=$10 --currentUserId=$11 --species=$12 -profile $14 --genomeSize=$13 --schemaPath=$15 --schemaSelectedLoci=$16 --schemaCore=$17 --chewbbacaSpecies="$18" --referenceFileO=$19 --referenceFileH=$20 --pathoSpecies="$21" --mlstSpecies=$22 -resume > nextflow_log.txt 2>&1
