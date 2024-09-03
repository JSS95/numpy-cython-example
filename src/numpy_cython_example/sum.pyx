cimport cython
cimport numpy as cnp
from cython.parallel cimport prange

cnp.import_array()

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef double sum_array(cnp.ndarray[cnp.double_t, ndim=1] arr):
    cdef Py_ssize_t i
    cdef double total = 0.0

    for i in range(arr.shape[0]):
        total += arr[i]
    
    return total


@cython.boundscheck(False)
@cython.wraparound(False)
cpdef double sum_array_parallel(double[:] arr):
    cdef Py_ssize_t i
    cdef double total = 0.0

    for i in prange(arr.shape[0], nogil=True):
        total += arr[i]
    
    return total
