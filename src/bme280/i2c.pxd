from libcpp cimport bool
from libc.stdint cimport uint8_t

cdef extern from "bme280_i2c.hpp":

    cdef cppclass I2C_Dev:
        bool open(const char *)
        bool runForcedMode()
        uint8_t lastResult()
        double temperature()
        double humidity()
        double pressure()