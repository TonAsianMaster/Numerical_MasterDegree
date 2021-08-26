clc
format long 
n = input("Enter number of term  ") ;
Fibo = [0 1 1 ];
r = [0 0 1] ;
for i = 4:n ;
    Fibo(i) = Fibo(i-1) + Fibo(i-2) ;
    r(i) = Fibo(i)/Fibo(i-1) ;
end
double(Fibo(n))
r
% r = fn/f(n-1) is converges to 1.61803