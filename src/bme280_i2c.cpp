#include "bme280_i2c.hpp"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/ioctl.h>

#include <unistd.h>
#include <fcntl.h>
#include <linux/i2c-dev.h>

int fd;

void user_delay_ms(uint32_t period)
{
  usleep(period * 1000);
}

int8_t user_i2c_read(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
  write(fd, &reg_addr, 1);
  read(fd, data, len);
  return 0;
}

int8_t user_i2c_write(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
  int8_t *buf;
  buf = (int8_t *)malloc(len + 1);
  buf[0] = reg_addr;
  memcpy(buf + 1, data, len);
  write(fd, buf, len + 1);
  free(buf);
  return 0;
}

bool I2C_Dev::open(const char *IIC_Dev)
{
  int8_t rslt = BME280_OK;

  if ((fd = ::open(IIC_Dev, O_RDWR)) < 0)
  {
    printf("Failed to open the i2c bus %s", IIC_Dev);
    return false;
  }

  //dev.dev_id = BME280_I2C_ADDR_PRIM;//0x76
  device.dev_id = BME280_I2C_ADDR_SEC; //0x77

  if (ioctl(fd, I2C_SLAVE, device.dev_id) < 0)
  {
    printf("Failed to acquire bus access and/or talk to slave.\n");
    return false;
  }

  device.intf = BME280_I2C_INTF;
  device.read = user_i2c_read;
  device.write = user_i2c_write;
  device.delay_ms = user_delay_ms;

  return 0 == bme280_init(&device);
}