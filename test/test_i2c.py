import bme280.i2c

def test_open():
    dev = bme280.i2c.i2c()
    assert dev.open()

def test_forcedMode():
    dev = bme280.i2c.i2c()
    assert dev.open()
    assert dev.runForcedMode()
    assert 0 == dev.lastResult()

    print(dev.temperature)
    print(dev.humidity)
    print(dev.pressure)

if __name__ == '__main__':
    test_forcedMode()