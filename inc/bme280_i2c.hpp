#include "bme280.h"

class I2C_Dev
{
public:
    using bme280_dev = struct bme280_dev;
    bme280_dev device;

    bool open(const char *IIC_Dev);
};
