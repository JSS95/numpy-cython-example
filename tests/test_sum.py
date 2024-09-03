import numpy as np

from numpy_cython_example import sum_array, sum_array_parallel


def test_sum():
    assert sum_array(np.array([1, 2, 3], dtype=np.float64)) == 6
    assert sum_array_parallel(np.array([1, 2, 3], dtype=np.float64)) == 6
