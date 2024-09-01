from numpy_cython_sum import sum_array
import numpy as np


def test_sum():
    assert sum_array(np.array([1, 2, 3], dtype=np.float64)) == 6
