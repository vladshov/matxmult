#!/bin/bash
#PBS -l nodes=1
#PBS -N Shovin
#PBS -M flashmailomsk@pochta.ru
#PBS -o "${out_path_o}"
#PBS -e "${out_path_e}"
sleep 10
mpirun "${dir}/helloall2" ${in_path} ${out_path}










