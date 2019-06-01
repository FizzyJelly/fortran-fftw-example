all:
	ifort -o main.out src/fftw.F90 src/utility.F90 src/main.F90 -std08 -module src/ -implicitnone -fpp -O3 -funroll-all-loops -lfftw3

clean:
	rm -rf src/*.o src/*.mod *.out *.o 