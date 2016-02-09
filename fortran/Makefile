# Note: The expectation is that this makefile will be copied to 
# the parent directory before building.
include ../common.mk

all: openmp.x

openmp.x: laplace2d.f90
	$(OPENMP_FC) $(OPENMP_FCFLAGS) -o $@ $^ $(OPENMP_LDFLAGS)

.PHONY:clean

clean:
	rm -f *.o *.a openmp.x core
