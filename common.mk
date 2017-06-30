ifneq (,$(findstring pgcc,$(OPENMP_CC)))
OPENMP_CFLAGS=-fast -mp -Minfo
else
ifneq (,$(findstring xlc,$(OPENMP_CC)))
OPENMP_CFLAGS=-O3 -qsmp -qoffload
else
ifneq (,$(findstring gcc,$(OPENMP_CC)))
OPENMP_CFLAGS=-O3 -fopenmp
else
OPENMP_CC=clang
#OPENMP_CFLAGS=-O3 -fopenmp=libomp -fopenmp-targets=nvptx64sm_60-nvidia-linux -Wno-unknown-pragmas
OPENMP_CFLAGS=-O2 -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda --cuda-path=$(OLCF_CUDA_ROOT) 
OPENMP_LDFLAGS=-lm
endif
endif
endif
ifneq (,$(findstring g++,$(OPENMP_CXX)))
OPENMP_CXXFLAGS=-O3 -fopenmp
else
ifneq (,$(findstring xlc++,$(OPENMP_CXX)))
OPENMP_CXXFLAGS=-O3 -qsmp -qoffload
else
OPENMP_CXX=clang++
OPENMP_CXXFLAGS=-O3 -I/usr/include/c++/4.8 -I/usr/include/x86_64-linux-gnu/c++/4.8 -I$(CLANG_HOME)/include -fopenmp=libomp -fopenmp-targets=nvptx64sm_60-nvidia-linux -Wno-unknown-pragmas
OPENMP_LDFLAGS=-lm
endif
endif
ifneq (,$(findstring gfortran,$(OPENMP_FC)))
OPENMP_FCFLAGS=-O3 -fopenmp
else
ifneq (,$(findstring xlf,$(OPENMP_FC)))
OPENMP_FCFLAGS=-O3 -qsmp -qoffload
else
# CLANG currently does not support Fortran
OPENMP_FC=clang++
OPENMP_FCFLAGS=-O3 -I/usr/include/c++/4.8 -I/usr/include/x86_64-linux-gnu/c++/4.8 -I$(CLANG_HOME)/include -fopenmp=libomp -fopenmp-targets=nvptx64sm_60-nvidia-linux -Wno-unknown-pragmas
OPENMP_LDFLAGS=-lm
endif
endif

#OPENMP_LDFLAGS += -lm -L/usr/local/cuda/nvvm/libdevice

