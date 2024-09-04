"""Multidimensional C-array example using discrete Frechet distance."""
import numpy as np
cimport cython
from libc.math cimport sqrt


@cython.boundscheck(False)
@cython.wraparound(False)
cdef double norm(double[:] p, double[:] q):
    cdef Py_ssize_t i
    cdef double sum = 0.0

    for i in range(p.shape[0]):
        elem_diff = p[i] - q[i]
        sum += elem_diff * elem_diff
    return sqrt(sum)


@cython.boundscheck(False)
@cython.wraparound(False)
cpdef double dfd(double[:, :] P, double[:, :] Q):
    cdef Py_ssize_t i, j
    cdef int p = P.shape[0], q = Q.shape[0]
    cdef double[:, :] ca = np.empty((p, q), dtype=np.float64)

    ca[0, 0] = norm(P[0], Q[0])

    for i in range(1, p):
        ca[i, 0] = norm(P[i], Q[0])

    for j in range(1, q):
        ca[0, j] = norm(P[0], Q[j])

    for i in range(1, p):
        for j in range(1, q):
            ca[i, j] = max(
                min(ca[i - 1, j - 1], ca[i - 1, j], ca[i, j - 1]), norm(P[i], Q[j])
            )

    return ca[p - 1, q - 1]
