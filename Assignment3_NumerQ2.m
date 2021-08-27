clc
format long g
Cpi = 0 ;
k = 2 ;
loop = 1 ;
while abs((3+4*Cpi)-pi) > 1e-7
    Cpi = Cpi + ( ((-1)^(loop+1))/((k)*(k+1)*(k+2)) ) ;
    k = k+2 ;
    loop = loop + 1; 
end
MyPi = 3+4*Cpi
MatlabPi = pi
Time = loop-1
