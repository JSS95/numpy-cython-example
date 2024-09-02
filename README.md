# NumPy + Cython + PyPI Example

An ultimate guide for writing a Numpy-oriented Cython package and pubilshing to PyPI.

This example covers:

* Using Cython to write functions operating on Numpy.
* Setting up CI to automate unit testing.
* Using `setup.py` as a build script with `setuptools`, while keeping package metadata in `pyproject.toml`.
* Using `setuptools` to generate source distribution.
* Using `cibuildwheel` to generate pre-built distributions for different platforms.
* Publishing the distribution to PyPI using `twine` in Github Action.
* Installing or building the distributed package.

... and many more details!

> (Note) This example uses TestPyPI for distribution. If you create a real project based on this and publish to PyPI, modify the scripts accordingly.

## Installation

You can either download the pre-built binaries for your platform from PyPI, or get the source and build the binaries yourself.

Building binaries from `.pyx` files requires Cython to be installable in your machine.
Once it is satisfied, building can be automated thanks to `setuptools`.

### Installing from PyPI

The simplest option. Your platform is detected and binary wheel is installed from PyPI. Just run this and forget about the rest.

```
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ numpy-cython-example
```

### Building from PyPI

You can get source from PyPI by disabling binary installation.
This will download the source and automatically build the binary.

```
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ --no-binary=numpy-cython-example numpy-cython-example
```

### Building from Source

If you have already acquired the souce code (e.g., from Github), running this in your local project root directory will do the same job.

```
pip install .
```

> Instead of running the build script, you can also directly run Cython and C compiler to build the binaries with additional options. That approach is not covered in this project.
