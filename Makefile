#
# Top-level Makefile
#
.PHONY: libs tests check
all: libs tests check

libs:
	make -C build-with-make -j
	make -C test -j 1
	make -C example/all-sky -j
	make -C example/rfmip-clear-sky -j

tests:
	make -C example/rfmip-clear-sky tests
	make -C example/all-sky         tests
	make -C test                    tests

check:
	make -C example/rfmip-clear-sky check
	make -C example/all-sky         check
	make -C test                    check

clean:
	make -C build-with-make clean
	make -C example/rfmip-clear-sky clean
	make -C example/all-sky         clean
	make -C test                    clean
