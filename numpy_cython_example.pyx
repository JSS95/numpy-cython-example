import numpy as np

cimport numpy as cnp
cnp.import_array()


def sum_array(cnp.ndarray[cnp.double_t, ndim=1] arr):
    cdef Py_ssize_t i
    cdef double total = 0.0

    for i in range(arr.shape[0]):
        total += arr[i]
    
    return total