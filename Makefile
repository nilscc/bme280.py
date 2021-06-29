INCLUDE_DIR=inc/

.PHONY: all clean

all: lib/libbme280.so build/bme280

clean:
	-rm lib/*.o lib/*.a lib/*.so build/bme280

lib/libbme280.so: lib/bme280.o lib/bme280_i2c.o
	gcc -shared $^ -o $@

lib/libbme280.a: lib/bme280.o lib/bme280_i2c.o
	ar rcs $@ $^

lib/bme280.o: src/bme280.c inc/bme280.h inc/bme280_defs.h
	gcc -c $< -o $@ -I ${INCLUDE_DIR} -std=c99

lib/bme280_i2c.o : src/bme280_i2c.c inc/bme280_i2c.h inc/bme280.h inc/bme280_defs.h
	gcc -c $< -o $@ -I ${INCLUDE_DIR} -std=c99 -lwiringPi

build/bme280: src/main.c lib/bme280.o lib/bme280_i2c.o
	gcc -o $@ $^ -I ${INCLUDE_DIR} -std=c99
