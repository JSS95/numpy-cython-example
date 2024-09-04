import sys

import numpy
from Cython.Build import cythonize
from setuptools import Extension, setup

if sys.platform.startswith("win"):
    compile_args = ["/openmp"]
else:
    compile_args = ["-fopenmp"]

extensions = [
    Extension(
        "numpy_cython_example.sum",
        ["src/numpy_cython_example/sum.pyx"],
        extra_compile_args=compile_args,
        extra_link_args=compile_args,
    ),
    Extension(
        "numpy_cython_example.dfd",
        ["src/numpy_cython_example/dfd.pyx"],
        extra_compile_args=compile_args,
        extra_link_args=compile_args,
    ),
]

setup(
    ext_modules=cythonize(extensions),
    include_dirs=[numpy.get_include()],
)
