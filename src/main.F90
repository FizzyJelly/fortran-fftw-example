#ifndef CONFIG
#define CONFIG
#define SAMPLES 1024
#define PI 4.D0*DATAN(1.D0)
#endif

program main
    use fftw
    use utils
implicit none

    real(kind = 8) :: x(SAMPLES), t(SAMPLES) ! vector for signal and time points
    call make_sample_vector(t)
    call make_signal(x, t)

    

contains

end program main