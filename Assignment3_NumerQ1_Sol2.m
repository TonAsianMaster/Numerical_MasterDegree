format long g
Cpi = 0 ;
%k = 0
for k = 0:24000000000
    if abs(4*Cpi-pi) > 1e-7
        Cpi = Cpi + ( ((-1)^k)/(2*k+1) ) ;
    else  
        k
        break
    end
end
MyPi = 4*Cpi
pi
