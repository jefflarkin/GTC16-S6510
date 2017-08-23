# Note: The expectation is that this makefile will be copied to 
# the parent directory before building.
include ../../common.mk

all: openmp.$(OPENMP_CC).x

openmp.$(OPENMP_CC).x: laplace2d.c
	$(OPENMP_CC) $(OPENMP_CFLAGS) -o $@ $^ $(OPENMP_LDFLAGS)

.PHONY:clean

clean:
	rm -f *.o *.a openmp.$(OPENMP_CC).x core
