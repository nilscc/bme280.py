import bme280.i2c

def test_open():
    dev = bme280.i2c.i2c()
    assert dev.open()