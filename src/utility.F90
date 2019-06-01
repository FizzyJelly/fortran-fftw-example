#include "config.ff90"

module utils
    implicit none


    public :: make_sample_vector, make_signal, make_noisy_signal, write_plot_data_to_file, filter_transform

    private :: write_plot_data_to_file_int, write_plot_data_to_file_real
    interface write_plot_data_to_file
        procedure write_plot_data_to_file_int, write_plot_data_to_file_real
    end interface

contains

subroutine make_sample_vector(t, f)
    real(kind = 8), intent(inout):: t(SAMPLES)
    integer, intent(inout) :: f(SAMPLES/2 +1)
    integer :: i

    do i = 1, SAMPLES
        t(i) = i/real(SAMPLES)
        if(mod(i,2) == 1) then
            f(i/2 + 1) = i/2 ! appropriate frequencies for given sampling
        end if 
    end do
    f(size(f)) = SAMPLES/2

end subroutine


elemental subroutine make_signal(x, t)
    real(kind = 8), intent(inout) :: x
    real(kind = 8), intent(in) :: t

    x = sin(2 * PI * t * 200) + 2 * sin(2 * PI * t * 400)
end subroutine

subroutine make_noisy_signal(x, t)
    real(kind = 8), intent(inout) :: x(SAMPLES)
    real(kind = 8), intent(in) :: t(SAMPLES)
    real :: r
    integer :: i 
    call random_seed()

    do i=1, SAMPLES
        call random_number(r) ! in range(0,1)
        r = r - 1
        x(i) = cos(2 * PI * t(i) * 100) + r
    end do
end subroutine

subroutine write_plot_data_to_file_int(path, x, y)
    character(len = *), intent(in) :: path
    integer, intent(in) :: x(:)
    real(kind = 8), intent(in) :: y(:)
    integer :: i
    integer :: fd = 10

    open(unit=fd, file=path,action="write", form="formatted", status="replace", access="stream")

    if(size(x) /= size(y)) then
        stop "Vectors' sizes don't match"
    end if

    do i=1, size(x)
        write(fd, *) x(i), y(i)
    end do

    close(fd)
end subroutine

subroutine write_plot_data_to_file_real(path, x, y)
    character(len = *), intent(in) :: path
    real(kind = 8), intent(in) :: x(:), y(:)
    integer :: i
    integer :: fd = 10

    open(unit=fd, file=path,action="write", form="formatted", status="replace", access="stream")

    if(size(x) /= size(y)) then
        stop "Vectors' sizes don't match"
    end if

    do i=1, size(x)
        write(fd, *) x(i), y(i)
    end do

    close(fd)
end subroutine

subroutine filter_transform(transform)
    complex(kind = 8), intent(inout) :: transform(SAMPLES/2 + 1)
    integer :: i

    do i=1, size(transform)
        if(abs(transform(i)) < 80) then
            transform(i) = 0
        end if
    end do
end subroutine

end module