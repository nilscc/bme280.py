#include "bme280_i2c.h"

#include <stdio.h>
#include <stdlib.h>

int main() {
    struct bme280_dev dev = i2c_dev("/dev/i2c-1");

    int res = bme280_init(&dev);
    if (res != 0) {
        printf("init failed: %d\n", res);
        exit(1);
    }

    return 0;
}