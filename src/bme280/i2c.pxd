from libcpp cimport bool

cdef extern from "bme280_i2c.hpp":

    cdef cppclass I2C_Dev:
        bool open(const char *)