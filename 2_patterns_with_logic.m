% HW 2 Eva Speiser 205336713

%1 FOR LOOP
clear

x=2:2:2222;
for i=1:1111
    
    if  x(i)<10
            x(i)=828;
        
    elseif x(i)==44
          x(i)=NaN;
     
    elseif x(i)== 22 | x(i)==222 | x(i)==2222
          x(i)=3;
            
    elseif mod(x(i),4)==0 & x(i)>828 %check to see if divisible by 4 by checking remainder
               x(i)=999;      
    end
end


%2 DIAMOND

squares=ones(7);

%create top part of diamond  (rows 1-3)
for i=1:3
    squares(i,[1:4-i])=0;%first half of row
    squares(i,[4+i:7])=0; %second half of row
end

%create bottom part of diamond (rows 5-7)
for i=5:7
    squares(i,[1:i-4])=0;%first half of row
    squares(i,[12-i:7])=0; %second half of row
end

%create diamond from squares
diamond=squares;


%3 CHECKERBOARD

   check=repmat(eye(2),4);
   % removing the top row of check, placing it on the bottom of new matrix
   t=check([2:8],[1:8]); %new top piece
   b=check(1:8); %new bottom piece
   kcehc=[t; b]; %combine
   
   
%4 FIBONACCI
   

current=[1 NaN]; %starting block

for i=2:18 % i is counter to determine which side to put new square 
    
    fib=length(current); %keeps track of the next fibonacci number
    %which is conveniently the longest dimension/ "length"
    
    new=ones(fib).*fib; %newest square block to add
    
    if mod(i+2,4)==0
    %add to top (2, 6, 10, 14) +2 are divisible by 4
    current= [new; current];
    
    elseif mod(i+1,4)==0
    %add to left (3,7,11) +1 are divisible by four
    current= [new, current];
    
    elseif mod(i,4)==0
    %add to bottom (4, 8, 12) are divisible by four
    current= [current; new];
    
    elseif mod(i-1,4)==0
    %add to right (5, 9, 13) -1 are divisible by 4
    current= [current,new];
    
    end
end

%6765 by 4181 matrix
fib4181=current;

%{
%EXTRA CREDIT
%so this does not work and im not sure why
%it doesnt register that the ideal total ever appears in temp
%i feel like it may be an issue with precision so i
%tried ismembertol but that didnt work either, but I feel like this is
%generally the way to do this problem so im going to include it because
%i did try 

rng(420);
moneys=round(rand(1,100)*40000000,1)+234.97;

for i=1:5 %check each num of elements to combine to get total
    temp=nchoosek(moneys(1:100),i);

    %check if goal is in temp array of combinations
    if ismember(152375242.18,temp)

        %get index of goal 
        [row,col]=find(temp==152375242.18);
        
        %put all cols (transactions) but last (total) into gotcha matrix
        gotcha=[row, 1:i-1];
    end

end
    %}
   


   
       