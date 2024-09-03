import numpy as np

from numpy_cython_example import dfd

P = np.array([[0, 0], [2, 2], [4, 2], [4, 4], [2, 1], [5, 1], [7, 2]], dtype=np.float64)
Q = np.array([[2, 0], [1, 3], [5, 3], [5, 2], [7, 3]], dtype=np.float64)


def test_dfd():
    assert dfd(P, Q)
