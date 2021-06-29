INCLUDE_DIR=inc/

.PHONY: all clean

all: lib/libbme280.a
	python3 setup.py install --user
	pytest

clean:
	-rm lib/*.o lib/*.a
	-rm -r build/

# static library
lib/libbme280.a: lib/bme280.o lib/bme280_i2c.o
	ar rcs $@ $^

# main sensortec lib
lib/bme280.o: src/bme280.c inc/bme280.h inc/bme280_defs.h
	gcc -c $< -o $@ -I ${INCLUDE_DIR} -std=c99

# i2c library
lib/bme280_i2c.o : src/bme280_i2c.cpp inc/bme280_i2c.hpp inc/bme280.h inc/bme280_defs.h
	g++ -c $< -o $@ -I ${INCLUDE_DIR} -std=c++17 -lwiringPi