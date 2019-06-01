unset grid
set terminal png size 1200,800
set style data lines
set key off

set xtics font "Arial, 14”
set ytics font "Arial, 14”
set termoption dashed

set output 'res/signal_sin.png'
set xlabel "t" font "Arial, 14”
set ylabel "x(t)" font "Arial, 14”
set title "Signal - sum of 2 sins"
plot [0:0.04] "res/signal_sin_sum.txt"

set output 'res/signal_cos_noisy.png'
set xlabel "t" font "Arial, 14”
set ylabel "x(t)" font "Arial, 14”
set title "Signal - noisy cos"
plot [0:0.1] "res/signal_cos_noisy.txt"

set output 'res/filtered_cos_signal.png'
set xlabel "t" font "Arial, 14”
set ylabel "x(t)" font "Arial, 14”
set title "Signal - filtered noisy cos"
plot [0:0.05] "res/filtered_cos_signal.txt"

set output 'res/signal_sin_fft.png'
set xlabel "f" font "Arial, 14”
set ylabel "Magnitude" font "Arial, 14”
set title "DFT of sin sum signal"
set logscale y
set yrange [0.001:]
plot [0:512] "res/signal_sin_sum_fft.txt"

set output 'res/signal_cos_fft.png'
set xlabel "f" font "Arial, 14”
set ylabel "Magnitude" font "Arial, 14”
set title "DFT of noisy cos signal"
set logscale y
set yrange [1:]
plot [0:512] "res/signal_cos_noisy_fft.txt"


