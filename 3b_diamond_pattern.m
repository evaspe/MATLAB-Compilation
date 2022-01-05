%2 DIAMOND
diamondsize=31;
squares=ones(diamondsize);
ah=(diamondsize+1)/2; %approx half (slightly larger) storing for easier later calulation

%create top part of diamond 
for i=1:(diamondsize-1)/2
    squares(i,[1:ah-i])=0;%first half of row
    squares(i,[ah+i:diamondsize])=0; %second half of row
end

%create bottom part of diamond 
for i=ah+1:diamondsize
    squares(i,[1:i-ah])=0;%first half of row
    squares(i,[(1.5.*diamondsize+1.5)-i:diamondsize])=0; %second half of row
end

%create diamond from squares
diamond31=squares;


