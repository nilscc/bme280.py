#include "bme280.h"

class I2C_Dev
{
    struct bme280_dev device;
    struct bme280_data data;

    int8_t result;

public:

    bool open(const char *IIC_Dev);
    bool runForcedMode();

    /*
     * Results & Sensor Data
     *
     */

    int8_t lastResult() const { return result; }

    double temperature() const { return data.temperature; }
    double humidity() const { return data.humidity; }
    double pressure() const { return data.pressure; }
    
};
