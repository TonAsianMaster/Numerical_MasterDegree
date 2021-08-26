format long g
a = 0 ;
b = 1 ;
n = input("Enter number of term  ") ;
x = n-1 ;

for i = 1:n %loop 1 to n
    c = a + b; 
    a = b; 
    b = c; 
end
fprintf("Fibonacci")
b-a
