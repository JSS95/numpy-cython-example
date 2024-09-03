"""C-array example using discrete Frechet distance."""
cimport cython
from libc.math cimport sqrt
from libc.stdlib cimport free, malloc


@cython.boundscheck(False)
@cython.wraparound(False)
cdef double norm(double[:] p, double[:] q):
    cdef int i
    cdef double elem_diff, sum = 0.0
    for i in range(p.shape[0]):
        elem_diff = p[i] - q[i]
        sum += elem_diff * elem_diff
    return sqrt(sum)


@cython.boundscheck(False)
@cython.wraparound(False)
cpdef double dfd(double[:, :] P, double[:, :] Q):
    cdef Py_ssize_t i, j
    cdef int p = P.shape[0], q = Q.shape[0]
    cdef double* ca = <double*>malloc(q * sizeof(double))
    cdef double ret

    ca[0] = norm(P[0], Q[0])

    for j in range(1, q):
        ca[j] = max(ca[j - 1], norm(P[0], Q[j]))

    for i in range(1, p):
        left = ca[0]
        ca[0] = max(left, norm(P[0], Q[0]))
        for j in range(1, q):
            diag = left
            left = ca[j]
            ca[j] = max(min(diag, left, ca[j - 1]), norm(P[i], Q[j]))

    ret = ca[q - 1]
    free(ca)
    return ret
