import setuptools
import Cython.Build
import os.path

class BinaryDistribution(setuptools.Distribution):
    def is_pure(self):
        return False

setuptools.setup(
    name='bme280',
    version='0.1.0',
    distclass=BinaryDistribution,

    ext_modules=Cython.Build.cythonize([
        setuptools.Extension(
            name='bme280.i2c',
            language='c++',
            sources=[os.path.join('src', 'bme280', 'i2c.pyx')],
            include_dirs=['inc'],
            library_dirs=['lib'],
            libraries=['wiringPi', 'bme280'],
            #define_macros=[],
            #extra_compile_args=[],
        ),
    ], language_level=3),
)
