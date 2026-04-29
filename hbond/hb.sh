#!/bin/sh
module load  openmpi/4.1.1   cuda/11.1   gcc/9.3 
source /HOME/scz0btc/run/amber20_src/amber.sh

mpirun -np 6 cpptraj.MPI  /data/run01/scz0btc/lfx/7a/01/com_sol.prmtop /data/run01/scz0btc/lfx/7a/01/hbond/trajhbond