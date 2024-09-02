import numpy
from Cython.Build import cythonize
from setuptools import Extension, setup

extensions = [
    Extension("numpy_cython_example.sum", ["src/numpy_cython_example/sum.pyx"]),
]

setup(
    ext_modules=cythonize(extensions),
    include_dirs=[numpy.get_include()],
)
