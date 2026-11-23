FLAGS = -g -fno-omit-frame-pointer

all:
	gcc -O0 $(FLAGS) prog.c -o prog_O0
	gcc -O3 -march=native $(FLAGS) prog.c -o prog_O3
	gcc -O3 -march=native -DIKJ $(FLAGS) prog.c -o prog_ikj
	gcc -O0 -S -masm=intel prog.c -o prog_O0.s
	gcc -O3 -march=native -S -masm=intel prog.c -o prog_O3.s

clean:
	rm -f prog_O0 prog_O3 prog_ikj *.s perf.data*
