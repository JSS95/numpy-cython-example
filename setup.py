from setuptools import Extension, setup

setup(
    ext_modules = [Extension("hello", ["hello.c"])]
)
