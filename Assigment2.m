clc
format long g
dat = load("kl_tg_93_08.txt") ;

%% 1 How many months having no data (NaN)? And in which year does this happen?
Nandata = sum(isnan(dat(:,2)))  %find which row contain Nan value. % Ans = 7 Nan data
dat(:,3) = dat(:,1) - mod(dat(:,1),1) ;  %year
dat(:,4) = ( mod(dat(:,1),1)*12+1 ) - ( mod(( mod(dat(:,1),1)*12+1 ),1) ) ; %Month
dat(:,5) = isnan(dat(:,2)) ;%for detect Nan year.
j = 0 ;
for i = 1:size(dat,1) ;
    if dat(i,5) == 1 ;
       j = j+1 ;
       Nanyear(j) = dat(i,3) ;
    end
end
Nanyear % 1994        2000        2000        2002        2005        2006        2008
disp("######################")

%% Remove Nan row
dat(any(isnan(dat),2),:) = [];
dat(:,5) = [] ;

%% 2. How many months are there in the data set that sea level is a.below MSL   b. above MSL
bel = 0 ; 
abo = 0 ;
for i = 1:size(dat,1) ;
    if dat(i,2) < 0 ;
        bel = bel + 1 ;
        BelowMonth(bel) = dat(i,4) ;
    end
    if dat(i,2) > 0 ;
        abo = abo + 1 ;
        AboveMonth(abo) = dat(i,4) ;
    end
end
BelowMSL_month = bel
AboveMSL_month = abo
disp("######################")

%% In which year that the annual average sea level is lowest and highest? 
MaxYear = max(dat(:,3)) ;
MinYear = min(dat(:,3)) ;
k = MinYear:MaxYear ;  % List contained year from start to last year.
for i = 1:size(k,2) ;
    msl = 0;
    n = 0 ;
    
    for j = 1:size(dat,1) ;
        
        if dat(j,3) == k(i) ;
            n = n+1 ;
            msl(n) = dat(j,2) ; 
        end
        
    end
    
    MeanListYear(i) = mean(msl) ; 
end
MeanListYear ; %List contained average msl of every year sort by year.
lowest = min(MeanListYear) ;
highest = max(MeanListYear) ;
for i = 1:size(MeanListYear,2) ;
    if MeanListYear(i) == highest ;
        highestMSL_Year = k(i)
        disp("by  "+MeanListYear(i))
    end
    if MeanListYear(i) == lowest ;
        lowestMSL_Year = k(i)
        disp("by  " +MeanListYear(i))
    end
end
disp("######################")

%% Taking all data into consideration, in which month of the year that the sea levelis highest? 
MaxMonth = max(dat(:,4)) ;
MinMonth = min(dat(:,4)) ;
Month = MinMonth:MaxMonth ;  % List contained Month from 1 to 12 .
for i = 1:size(Month,2) ;
    Mmsl = 0;
    n = 0 ;
    
    for j = 1:size(dat,1) ;
        
        if dat(j,4) == Month(i) ;
            n = n+1 ;
            Mmsl(n) = dat(j,2) ; 
        end
        
    end
    
    MeanListMonth(i) = mean(Mmsl) ; 
end
MeanListMonth ; %List contained average msl of every month.
lowestMonth = min(MeanListMonth) ;
highestMonth = max(MeanListMonth) ;
for i = 1:size(MeanListMonth,2) ;
    if MeanListMonth(i) == highestMonth ;
        highestMSL_Month = Month(i)
        disp("by  "+MeanListMonth(i))
    end
    if MeanListMonth(i) == lowestMonth ;
        lowestMSL_Month = Month(i)
        disp("by  " +MeanListMonth(i))
    end
end
disp("######################")
%%
% Find the mean of sea level of 4 4-year periods:
% a. 1993-1996,
% b. 1997-2000,
% c. 2001-2004 and
% d. 2005-2008.
% What are the patterns that you can notice?
for i = 1:4:size(k,2) ;
    msl = 0;
    n = 0 ;
    
    for j = 1:size(dat,1) ;
        
        if dat(j,3) == k(i)  || dat(j,3) == k(i+1)  || dat(j,3) == k(i+2) || dat(j,3) ==k(i+3) ;
            n = n+1 ;
            msl(n) = dat(j,2) ; 
        end
        
    end
    
    MeanList4Year(i) = mean(msl) ; 
end
MeanList4Year = MeanList4Year(MeanList4Year~=0) ; % remove 0 data.
a1993to1996 = MeanList4Year(1)
b1997to2000 = MeanList4Year(2)
c2001to2004 = MeanList4Year(3)
d2005to2008 = MeanList4Year(4)
disp("######################")

%%
plot( dat(:,1) , dat(:,2), 'Color',[0.8500 0.3250 0.0980])
title("monthly-averaged sea level of the year 1993-2008 at Ko Lak tidal station ")
xlabel("Month-Year")
ylabel("MSL")


