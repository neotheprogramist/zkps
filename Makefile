ROOT := $(dir $(firstword $(MAKEFILE_LIST)))
CAIRO_ROOT := $(ROOT)cairo/
ZKLLVM_ROOT := $(ROOT)zkllvm/

REC=records.txt

N := 3

all: cairo

cairo: $(CAIRO_ROOT)src/lib.cairo
	echo '["[$N]"]' > $(CAIRO_ROOT)input.json
	echo cairo-stone for n=$(N) >> $(REC)
	(cd $(CAIRO_ROOT) && ./run.sh 2>> ../$(REC))


zkllvm:
	echo "zkllvm for n=$(N)" >> $(REC)
	(cd $(ZKLLVM_ROOT) && ./run.sh 2>> ../$(REC))


clean:
	rm -f $(CAIRO_ROOT)compiled.json $(CAIRO_ROOT)program_input.json