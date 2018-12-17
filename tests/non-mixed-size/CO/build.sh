mkdir -p TMP
diy7 -conf X.conf -cond observe -o TMP
# herd7 -model uniproc.cat TMP/@all > U
for test in $(ls -1 TMP/*.litmus); do
  rmem -q -model flat  -eager true -hash_prune true -interactive false "$test" >> U
  rm -f random_seed.dat
done
mlog2cond7 -forall true -optcond true < U > conds.txt
recond7 -toexists true -conds conds.txt -o . TMP/@all
rm -rf TMP U conds.txt
diyone7 -arch RISCV Rfi PosRR Fre Rfi PosRR Fre -cond unicond -name CO-SBI
echo CO-SBI.litmus >> @all
