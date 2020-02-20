#Script for the use of functions and filters in vcftools
#Karen Jiménez, 2020

#This script containt the use of some commands and how to make filters in
#vcftools. The script use the data of the work of Schweizer et al. 2015 used
#in the script "Download_data" in this directory.

#Change the actual directory to data directory
cd ../data

#Create a variable name "vcftools", where inside have a docker container that
#have vcftools. We need to use a absolute path for use this docker container,
#you need to change the path "/home/your_user_name/Proyecto_Unidad5/data:". Once we do this,
#we can call the docker container using $vcftools
vcftools="sudo docker run --rm -v /home/karenjimenez/Proyecto_Unidad5/data:/data biocontainers/vcftools:0.1.15 vcftools"

#Command to know information of the vcf archive (Number of individuals and SNPs)
echo "Information of the vcf archive (Number of individuals and SNPs)"
$vcftools --vcf wolves

echo " "

#Command to calculate the frequency of each allele fo every individual in the
#data and save the result in other archive call "my_frequencies"
echo "Frequency of each allele fo every individual in the data. Results in the archive "my_frequencies""
$vcftools --vcf wolves --freq --out my_frequencies

echo " "

#Command to calculate the sites in the data that don't have missing data
echo "Calculate the sites in the data that don't have missing data"
$vcftools --vcf wolves --max-missing 1

echo " "

#Command to calculate the frequency of each allele in all individuals but only
#sites without missing data and save the results in the archive
#"frequencies_out_NA"
echo "Calculate the frequency of each allele in all individuals but only sites without missing data. Results in the archive "frequencies_out_NA""
$vcftools --vcf wolves --freq --max-missing 1 --out frequencies_out_NA

echo " "

#Command to call the number of sites with a frequency fo the minor allele <0.05
echo "Number of sites with a frequency fo the minor allele <0.05"
$vcftools --vcf wolves --freq --max-maf 0.05

echo " "

#Command to calculate the heterozygosity of each individual
echo "Calculate the heterozygosity of each individual"
$vcftools --vcf wolves --het

#Commmand to calcute the nucleotide diversity for each site
echo "Calcute the nucleotide diversity for site"
$vcftools --vcf wolves --site-pi

echo " "

#Command to calculate the nucleotide diversite for site but in only one chromosome.
#In this case, the chromosome 3
echo "Calculate the nucleotide diversite for site but in only in chromosome 3"
$vcftools --vcf wolves --chr chr03 --site-pi

echo " "

#Command to filter the sites with a frequency of the minor allele >0.05 and
#create a new archive call "wolves_maf05.vcf" with the alleles filtered
echo "Filter the sites with a frequency of the minor allele >0.05. Alleles filtered are in the archive call "wolves_maf05.vcf""
$vcftools --vcf wolves --max-maf 0.05 --recode --out wolves_maf0.5

echo " "

#Command to convert "wolves_maf05.vcf" in plink formant
echo "Convert "wolves_maf05.vcf" in plink formant"
$vcftools --vcf wolves_maf0.5.recode.vcf --plink --out wolves_maf0.5
