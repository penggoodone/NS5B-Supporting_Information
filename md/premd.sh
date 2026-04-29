#!/bin/sh
module load  openmpi/4.1.1   cuda/11.1   gcc/9.3 
source /HOME/scz0btc/run/amber20_src/amber.sh

md_path=/data/run01/scz0btc/lfx/7a/01/MD/
in_path=/data/run01/scz0btc/lfx/7a/01/MD/in/
top_path=/data/run01/scz0btc/lfx/7a/01/
out_path=/data/run01/scz0btc/lfx/7a/01/MD/out/

srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/min1.in -o $out_path/min1.log -c $top_path/com_sol.inpcrd -p $top_path/com_sol.prmtop -r $out_path/min1.rst -ref $top_path/com_sol.inpcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/min2.in -o $out_path/min2.log -c $out_path/min1.rst -p $top_path/com_sol.prmtop -r $out_path/min2.rst -ref $out_path/min1.rst
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/heat.in -o $out_path/heat.log -c $out_path/min2.rst -p $top_path/com_sol.prmtop -r $out_path/heat.rst -ref $out_path/min2.rst -x $out_path/heat.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/density.in -o $out_path/density.log -c $out_path/heat.rst -p $top_path/com_sol.prmtop -r $out_path/density.rst -ref $out_path/heat.rst -x $out_path/density.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/equi.in -o $out_path/equi.log -c $out_path/density.rst -p $top_path/com_sol.prmtop -r $out_path/equi.rst -ref $out_path/density.rst -x $out_path/equi.mdcrd


srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md.log -c $out_path/equi.rst -p $top_path/com_sol.prmtop -r $out_path/md.rst -ref $out_path/equi.rst -x $out_path/md.mdcrd

srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md1.log -c $out_path/md.rst -p $top_path/com_sol.prmtop -r $out_path/md1.rst -ref $out_path/md.rst -x $out_path/md1.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md2.log -c $out_path/md1.rst -p $top_path/com_sol.prmtop -r $out_path/md2.rst -ref $out_path/md1.rst -x $out_path/md2.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md3.log -c $out_path/md2.rst -p $top_path/com_sol.prmtop -r $out_path/md3.rst -ref $out_path/md2.rst -x $out_path/md3.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md4.log -c $out_path/md3.rst -p $top_path/com_sol.prmtop -r $out_path/md4.rst -ref $out_path/md3.rst -x $out_path/md4.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md5.log -c $out_path/md4.rst -p $top_path/com_sol.prmtop -r $out_path/md5.rst -ref $out_path/md4.rst -x $out_path/md5.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md6.log -c $out_path/md5.rst -p $top_path/com_sol.prmtop -r $out_path/md6.rst -ref $out_path/md5.rst -x $out_path/md6.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md7.log -c $out_path/md6.rst -p $top_path/com_sol.prmtop -r $out_path/md7.rst -ref $out_path/md6.rst -x $out_path/md7.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md8.log -c $out_path/md7.rst -p $top_path/com_sol.prmtop -r $out_path/md8.rst -ref $out_path/md7.rst -x $out_path/md8.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md9.log -c $out_path/md8.rst -p $top_path/com_sol.prmtop -r $out_path/md9.rst -ref $out_path/md8.rst -x $out_path/md9.mdcrd
#200ns
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md10.log -c $out_path/md9.rst -p $top_path/com_sol.prmtop -r $out_path/md10.rst -ref $out_path/md9.rst -x $out_path/md10.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md11.log -c $out_path/md10.rst -p $top_path/com_sol.prmtop -r $out_path/md11.rst -ref $out_path/md10.rst -x $out_path/md11.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md12.log -c $out_path/md11.rst -p $top_path/com_sol.prmtop -r $out_path/md12.rst -ref $out_path/md11.rst -x $out_path/md12.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md13.log -c $out_path/md12.rst -p $top_path/com_sol.prmtop -r $out_path/md13.rst -ref $out_path/md12.rst -x $out_path/md13.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md14.log -c $out_path/md13.rst -p $top_path/com_sol.prmtop -r $out_path/md14.rst -ref $out_path/md13.rst -x $out_path/md14.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md15.log -c $out_path/md14.rst -p $top_path/com_sol.prmtop -r $out_path/md15.rst -ref $out_path/md14.rst -x $out_path/md15.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md16.log -c $out_path/md15.rst -p $top_path/com_sol.prmtop -r $out_path/md16.rst -ref $out_path/md15.rst -x $out_path/md16.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md17.log -c $out_path/md16.rst -p $top_path/com_sol.prmtop -r $out_path/md17.rst -ref $out_path/md16.rst -x $out_path/md17.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md18.log -c $out_path/md17.rst -p $top_path/com_sol.prmtop -r $out_path/md18.rst -ref $out_path/md17.rst -x $out_path/md18.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md19.log -c $out_path/md18.rst -p $top_path/com_sol.prmtop -r $out_path/md19.rst -ref $out_path/md18.rst -x $out_path/md19.mdcrd
#300ns
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md20.log -c $out_path/md19.rst -p $top_path/com_sol.prmtop -r $out_path/md20.rst -ref $out_path/md19.rst -x $out_path/md20.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md21.log -c $out_path/md20.rst -p $top_path/com_sol.prmtop -r $out_path/md21.rst -ref $out_path/md20.rst -x $out_path/md21.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md22.log -c $out_path/md21.rst -p $top_path/com_sol.prmtop -r $out_path/md22.rst -ref $out_path/md21.rst -x $out_path/md22.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md23.log -c $out_path/md22.rst -p $top_path/com_sol.prmtop -r $out_path/md23.rst -ref $out_path/md22.rst -x $out_path/md23.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md24.log -c $out_path/md23.rst -p $top_path/com_sol.prmtop -r $out_path/md24.rst -ref $out_path/md23.rst -x $out_path/md24.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md25.log -c $out_path/md24.rst -p $top_path/com_sol.prmtop -r $out_path/md25.rst -ref $out_path/md24.rst -x $out_path/md25.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md26.log -c $out_path/md25.rst -p $top_path/com_sol.prmtop -r $out_path/md26.rst -ref $out_path/md25.rst -x $out_path/md26.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md27.log -c $out_path/md26.rst -p $top_path/com_sol.prmtop -r $out_path/md27.rst -ref $out_path/md26.rst -x $out_path/md27.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md28.log -c $out_path/md27.rst -p $top_path/com_sol.prmtop -r $out_path/md28.rst -ref $out_path/md27.rst -x $out_path/md28.mdcrd
srun $AMBERHOME/bin/pmemd.cuda -O -i $in_path/md.in -o $out_path/md29.log -c $out_path/md28.rst -p $top_path/com_sol.prmtop -r $out_path/md29.rst -ref $out_path/md28.rst -x $out_path/md29.mdcrd