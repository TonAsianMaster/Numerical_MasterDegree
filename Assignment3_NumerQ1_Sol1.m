format long g
Cpi = 0 ;
k = 0 ;
while abs((4*Cpi)-pi) > 1e-7
    Cpi = Cpi + ( ((-1)^k)/(2*k+1) ) ;
    k = k+1 ;
end
MyPi = 4*Cpi
MatlabPi = pi
Time = k