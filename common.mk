ifneq (,$(findstring gcc,$(OPENMP_CC)))
OPENMP_CFLAGS=-O3 -fopenmp
else
OPENMP_CC=clang
OPENMP_CFLAGS=-O3 -fopenmp=libomp -omptargets=nvptx64sm_35-nvidia-linux -Wno-unknown-pragmas
endif
ifneq (,$(findstring g++,$(OPENMP_CXX)))
OPENMP_CXXFLAGS=-O3 -fopenmp
else
OPENMP_CXX=clang++
OPENMP_CXXFLAGS=-O3 -I/usr/include/c++/4.8 -I/usr/include/x86_64-linux-gnu/c++/4.8 -I$(CLANG_HOME)/include -fopenmp=libomp -omptargets=nvptx64sm_35-nvidia-linux -Wno-unknown-pragmas
endif
ifneq (,$(findstring gfortran,$(OPENMP_FC)))
OPENMP_FCFLAGS=-O3 -fopenmp
else
# CLANG currently does not support Fortran
OPENMP_FC=clang++
OPENMP_FCFLAGS=-O3 -I/usr/include/c++/4.8 -I/usr/include/x86_64-linux-gnu/c++/4.8 -I$(CLANG_HOME)/include -fopenmp=libomp -omptargets=nvptx64sm_35-nvidia-linux -Wno-unknown-pragmas
endif

OPENMP_LDFLAGS += -lm -L/usr/local/cuda/nvvm/libdevice

