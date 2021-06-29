cimport bme280.i2c as c

cdef class i2c:
    cdef c.I2C_Dev _dev

    def open(self):
        return self._dev.open('/dev/i2c-1')