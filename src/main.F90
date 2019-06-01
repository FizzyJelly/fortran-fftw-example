#include "config.ff90"

program main
    use fftw
    use utils
implicit none

    type(C_PTR) :: plan1, plan2
    integer :: f1(SAMPLES/2 + 1), f2(SAMPLES/2 + 1) ! vectors for frequencies 
    real(C_DOUBLE) :: x1(SAMPLES), t1(SAMPLES), x2(SAMPLES), t2(SAMPLES) ! vectors for signal and time points
    complex(C_DOUBLE_COMPLEX) :: transform1(SAMPLES/2 +1), transform2(SAMPLES/2 +1)

    plan1 = fftw_plan_dft_r2c_1d(SAMPLES, x1, transform1, FFTW_PRESERVE_INPUT)
    plan2 = fftw_plan_dft_r2c_1d(SAMPLES, x2, transform2, FFTW_PRESERVE_INPUT)

    ! assign time points, frequencies, and signal values
    call make_sample_vector(t1, f1)
    call make_sample_noisy_vector(t2, f2)
    call make_signal(x1, t1)

    ! execute fft on given data
    call fftw_execute_dft_r2c(plan1, x1, transform1)
    call fftw_execute_dft_r2c(plan2, x2, transform2)

    ! write results to files
    call write_plot_data_to_file("res/signal_sin_sum.txt", t1, x1)
    call write_plot_data_to_file("res/signal_cos_noisy.txt", t2, x2)
    call write_plot_data_to_file("res/signal_sin_sum_fft.txt", f1, abs(transform1))

contains

end program main