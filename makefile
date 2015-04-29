CC=/usr/local/cuda/bin/nvcc
# For .c files -lmpi must be used (.cpp requires -lmpi_cxx)
LIB=-lgomp -lcuda -lcudart -lmpi_cxx
CFLAGS=-Xcompiler -fopenmp
CUSOURCES=kernel3.cu
SOURCES=
APPNAME=helloall2
CUOBJ=$(CUSOURCES:.cu=.o)

all:
	$(CC) -c $(CUSOURCES)
	$(CC) $(CFLAGS) -o $(APPNAME) $(CUOBJ) $(SOURCES) $(LIB)
clean:
	rm *.o


