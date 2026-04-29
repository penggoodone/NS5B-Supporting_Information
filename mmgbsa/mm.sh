#!/bin/sh
module load  openmpi/4.1.1   cuda/11.1   gcc/9.3 
source /HOME/scz0btc/run/amber20_src/amber.sh
#source /HOME/scz0btc/run/amber20_src/bin/MMPBSA.py
#antechamber -fi pdb -fo mol2 -i LIG.pdb -o LIG.mol2 -c bcc -pf y -nc -1
#antechamber -fi pdb -fo mol2 -i LIG.pdb -o LIG.mol2 -at bcc -pf y -nc -1
#parmchk2 -i LIG.mol2 -o LIG.frcmod -f mol2
#ante-MMPBSA.py -p com_sol.prmtop -c com.prmtop -s ":572-16136" --radii=mbondi2
#ante-MMPBSA.py -p com.prmtop -r rec.prmtop -l lig.prmtop -m ":1-570" --radii=mbondi2
#./mmpbsa.py
#conda install -c conda-forge mpi4py 
mpirun -np 6 MMPBSA.py.MPI -O -i /data/run01/scz0btc/lfx/7a/01/mmpbsa/mmpbsa.in -o /data/run01/scz0btc/lfx/7a/01/mmpbsa/FINAL_RESULTS_MMPBSA.dat -sp /data/run01/scz0btc/lfx/7a/01/mmpbsa/com_sol.prmtop -cp /data/run01/scz0btc/lfx/7a/01/mmpbsa/com.prmtop -rp /data/run01/scz0btc/lfx/7a/01/mmpbsa/rec.prmtop -lp /data/run01/scz0btc/lfx/7a/01/mmpbsa/lig.prmtop -y /data/run01/scz0btc/lfx/7a/01/image_50.mdcrd
