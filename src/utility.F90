#ifndef CONFIG
#define CONFIG
#define SAMPLES 1024
#define PI 4.D0*DATAN(1.D0)
#endif

module utils
    implicit none

    public :: make_sample_vector, make_signal

contains

subroutine make_sample_vector(t)
    real(kind = 8), intent(inout):: t(SAMPLES)
    integer :: i

    do i = 1, SAMPLES
        t(i) = i/real(SAMPLES)
    end do

end subroutine

elemental subroutine make_signal(x, t)
    real(kind = 8), intent(inout) :: x
    real(kind = 8), intent(in) :: t

    x = sin(2 * PI * t * 200) + 2 * sin(2 * PI * t * 400)
end subroutine
end module