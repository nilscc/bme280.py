cimport bme280.i2c as c

cdef class i2c:
    cdef c.I2C_Dev _dev

    def open(self):
        return self._dev.open('/dev/i2c-1')

    def lastResult(self):
        return self._dev.lastResult()

    def runForcedMode(self):
        return self._dev.runForcedMode()

    @property
    def temperature(self):
        return self._dev.temperature()
        
    @property
    def humidity(self):
        return self._dev.humidity()
        
    @property
    def pressure(self):
        return self._dev.pressure()
        