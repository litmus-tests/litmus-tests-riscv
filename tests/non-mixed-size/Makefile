
RELAXS=DpCtrldR DpCtrlsR\
Fence.idRR Fence.idRW Fence.idWR Fence.idWW\
Fence.isRR Fence.isWR\
Fence.r.rwdWR Fence.r.rwdWW\
Fence.r.rwsWR\
Fence.rw.wdRR Fence.rw.wdWR\
Fence.rw.wsRR Fence.rw.wsWR\
Fence.w.wdRR Fence.w.wdRW\
Fence.w.wdWR\
Fence.w.wsRR Fence.w.wsWR\
Rfi\
PodRR PodRW PodWR PodWW PosRR PosWR\
PodRRPAq PodWRPAq PosRRPAq PosWRPAq\
PodWRRlP PodWWRlP PosWRRlP\
PodWRRlAq PosWRRlAq


RELAX/%:
	mkdir -p $@
	cp safe.conf $@/X.conf
	echo "-relax $*" >> $@/X.conf
	echo "-size 8" >> $@/X.conf
	echo "-nprocs 2" >> $@/X.conf
	cd $@ && diy7 -conf X.conf
	echo "$*/@all" >> RELAX/@all

.PHONY: relaxs
relaxs: $(foreach r,$(RELAXS),RELAX/$r)

# DpCtrlsR/
# Fence.isRR/
# Fence.isWR/
# Fence.r.rwsWR/
# Fence.rw.wsRR/
# Fence.rw.wsWR/
# Fence.w.wsRR/
# Fence.w.wsWR/
# PosRR/
# PosRRPAq/
