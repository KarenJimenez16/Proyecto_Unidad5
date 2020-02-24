#Script to convert plink .ped archive to .bed
#Karen Jiménez,2020

#This script convert the plink .ped archive to .bed to generate .bim, .fam y 
#.bed archive.

#Move to the data directory
cd ../data

#We have the 64-bit Linux version of plink in the data directory. but if
#you have another operation system you can search in the plink website
#(https://www.cog-genomics.org/plink/1.9) the adecuate version for your computer.
#You need to use the commmand `wget` and add the link to the plink archive
#necessary. The link to the plink archive is found in the download section,
#press rigth click in the archive to download and select the option
#"Copy Link Address". Example:
#wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20200121.zip.
#Once you donwload the plink archive, its necessary unzip it with the commmad
#`unzip`. Example: unzip plink_linux_x86_64_20200121.zip

#Convert the archive wolves.ped to a .bed format. For use plink, is necessary
#to use the commmand "./plink". With this command, we are telling that plink
#executable is in the working directory (data directory).Plink was designed to
#analyse human data, is necessary add the flag --chr-set for add the number of
#pair of chromosomes different. In this case, we need to put the number or pair
#of chromosome for de wolf, 39 pairs.
./plink --file wolves_maf0.5 --make-bed --chr-set 39 --out wolves_maf0.5

