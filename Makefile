ROOT := $(dir $(firstword $(MAKEFILE_LIST)))
CAIRO_ROOT := $(ROOT)cairo/
ZKLLVM_ROOT := $(ROOT)zkllvm/
NOIR_ROOT := $(ROOT)noir/
SP1_ROOT := $(ROOT)sp1/

REC=records.txt
PREFIX="\\n---"

N := 20# Automatic only for cairo for now

all: cairo zkllvm noir sp1

cairo: $(CAIRO_ROOT)src/lib.cairo
	printf '["[$N]"]' > $(CAIRO_ROOT)input.json
	printf "$(PREFIX) cairo-stone for n=$(N)" >> $(REC)
	(cd $(CAIRO_ROOT) && ./run.sh 2>> ../$(REC))


zkllvm:
	printf "$(PREFIX) zkllvm for n=$(N)" >> $(REC)
	(cd $(ZKLLVM_ROOT) && ./run.sh 1>> ../$(REC))


noir:
	printf "$(PREFIX) noir for n=$(N)" >> $(REC)
	(cd $(NOIR_ROOT) && ./run.sh 2>> ../$(REC))


sp1: 
	printf "$(PREFIX) sp1 for n=$(N)" >> $(REC)
	(cd $(SP1_ROOT) && ./run.sh 2>> ../$(REC))


clean:
	rm -f $(CAIRO_ROOT)compiled.json $(CAIRO_ROOT)program_input.json