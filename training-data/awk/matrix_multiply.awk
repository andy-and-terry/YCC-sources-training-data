#!/usr/bin/awk -f
# Multiplies a 2x3 matrix A by a 3x2 matrix B using SUBSEP-keyed 2D arrays.
BEGIN {
    ra = 2; ca = 3; cb = 2
    A[0,0]=1; A[0,1]=2; A[0,2]=3
    A[1,0]=4; A[1,1]=5; A[1,2]=6

    B[0,0]=7;  B[0,1]=8
    B[1,0]=9;  B[1,1]=10
    B[2,0]=11; B[2,1]=12

    for (i = 0; i < ra; i++) {
        for (j = 0; j < cb; j++) {
            sum = 0
            for (k = 0; k < ca; k++) {
                sum += A[i,k] * B[k,j]
            }
            C[i,j] = sum
        }
    }

    for (i = 0; i < ra; i++) {
        for (j = 0; j < cb; j++) {
            printf "%d ", C[i,j]
        }
        print ""
    }
}
