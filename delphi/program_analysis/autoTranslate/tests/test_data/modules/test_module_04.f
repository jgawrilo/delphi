C File: test_module_04.f
C Purpose: Illustrates the use of multiple Fortran modules to define values 
C    for several variables that are used in the program.  This program 
C    differs from test_module_03.f in having modules that have "USE MODULE"s
C    inside them -- this illustrates that the program nevertheless can access
C    all the variables and subroutines in all of the modules USEd in this way.
C
C Compile and run this program as follows:
C
C    gfortran -c test_module_04.f     # << this will create files "mymod3.mod"
C                                                                 "mymod4.mod"
C                                                                 "mymod5.mod"
C    gfortran test_module_04.f        # << this will create a file "a.out"
C
C When executed this will generate the output
C
C        1234           2   3.14159989       7753.46875

      MODULE MYMOD3A
      IMPLICIT NONE

      INTEGER :: X = 1234
      END MODULE mymod3a

      MODULE MYMOD4A
      USE MYMOD3A    ! << Note that "use mymod3a" is now inside mymod4

      INTEGER :: Y = 2
      END MODULE mymod4A

      MODULE MYMOD5A
      USE mymod4A    ! << Note that "use mymod4a" is now inside mymod5

      REAL :: PI = 3.1416
      END MODULE mymod5A

      PROGRAM PGM
      USE mymod5A

      write (*,*) X, Y, PI, X*Y*PI

      stop
      end program PGM
