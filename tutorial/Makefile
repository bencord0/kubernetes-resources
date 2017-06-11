SUBDIRS=\
	10-hello \
	20-deploy \
	21-upgrade \
	30-flask

destroy: $(SUBDIRS)
$(SUBDIRS): force
	-make -C $@ destroy

.PHONY: destroy force 
