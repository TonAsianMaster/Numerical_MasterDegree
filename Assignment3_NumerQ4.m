clc
format long g
e = 0 ;
n = 1 ;
while abs( e-exp(1) ) > 1e-9 
    e = (1 + (1/n) )^n ;
    n = n + 1 ;
end
My_e = e          % 2.718281827465
Matlab_e = exp(1) % 2.71828182845905
Loop_n = n-1      % 65486699 Loops
abs( e-exp(1) )

