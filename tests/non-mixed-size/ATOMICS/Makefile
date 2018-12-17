
RELAXS=PodRWXX PodRWXP PodRWPX

RELAX/%:
	mkdir -p $@
	cp safe.conf $@/X.conf
	echo "-relax $*" >> $@/X.conf
	echo "-size 8" >> $@/X.conf
	echo "-nprocs 2" >> $@/X.conf
	echo "-ua 0" >> $@/X.conf
	cd $@ && diy7 -conf X.conf
	echo "$*/@all" >> RELAX/@all

.PHONY: relaxs
relaxs: $(foreach r,$(RELAXS),RELAX/$r)
