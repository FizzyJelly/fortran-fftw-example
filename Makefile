C = ifort -std08
OPTS = -module src/ -implicitnone -fpp -O3 -funroll-all-loops -lfftw3

all:
	${C} -o main.out src/fftw.F90 src/utility.F90 src/main.F90 ${OPTS}

clean:
	rm -rf src/*.o src/*.mod *.out *.o 

clean-res:
	rm -f res/*