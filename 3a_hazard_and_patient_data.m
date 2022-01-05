%HW3
%Eva Speiser

%Problem 1-Hazard

wincount=0;

rng(11)
for x=1:100000
% randomly generate number 5-9
%win=false; 

main=0;
while main>9 | main<5
    main=randi(6)+randi(6);
end

roll1=randi(6)+randi(6);

%if first roll = main, win
if roll1==main
    win=true;


%if first roll=2 or 3, lose
elseif roll1==2 | roll1==3
   win=false;


%else if
%rnum=5 or 9, first roll=11 or 12, lose
elseif main==5|main==9 & roll1==11|roll1==12
   win=false;


%rnum=6 or 8, first roll=11, lose
elseif main==6|main==8 & roll1==11
    win=false;

%rnum=6 or 8 first roll=12, win 
elseif main==6|main==8 & roll1==12
        win=true;
   

%rnum=7, first roll=11, win
elseif main==7 & roll1==11
        win=true;
   
%rnum=7, first roll=12, lose
elseif main==7 & roll1==12
        win=false;


%else- means we passed rand main and roll 1 w no win or loss,
%while continuing roll not equal to rnum or roll1, roll again
else
    roll2=0;
    while roll2~=roll1 & roll2~=main
        roll2=randi(6)+randi(6);
       %if roll2=roll 1, win
             if roll2==roll1
                 win=true;
             end
    %if roll2=rnum, lose
            if roll2==main
                 win=false;
            end
   
    end

end

if win==true
    wincount=wincount+1;
end

end
pWinHazard=wincount/100000;



%Problem 2-DIAMOND
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


%Problem 3
%Part 1- Pig Latin Names
load patients.mat
temp=table(LastName);
AstNameLay=LastName;

for j=1:100
    %take out individual names to work with
   Lastname=char(temp.LastName(j));
 
%check if name starts with a vowel, if not, immediately make first letter lower case
if Lastname(1)~= 'A' & Lastname(1)~= 'E'& Lastname(1)~= 'I'& Lastname(1)~= 'O' & Lastname(1)~= 'U'
    Lastname(1)=Lastname(1)+32;
    
%look for first vowel
    index=1;
while  Lastname(index)~= 'a' & Lastname(index)~= 'e'& Lastname(index)~= 'i'& Lastname(index)~= 'o' & Lastname(index)~= 'u'
    index=index+1;
end

%build new end of the name from the part after the vowel, then add ay
newEnd=Lastname(1:index-1);
newEnd(index)='a';
newEnd(index+1)='y';

%combine parts to form new name and capitalize
newName=horzcat(Lastname(index:end),newEnd);
newName(1)=newName(1)-32;


%else condition is if the name starts with a vowel
else
   
%extract whole name, then add ay
newName=char(LastName(j));
newName(length(newName)+1)='a';
newName(length(newName)+1)='y';

end

%add new name to a cell in the table
AstNameLay(j)={newName};
end

%Part 2- big alphebetized variables table
patients=table(Age, AstNameLay, Diastolic, Gender, Height, Location, SelfAssessedHealthStatus, Smoker, Systolic, Weight);

%Part 3
%new tables for patients  30 and under/31 and over
youngPatients=patients(patients.Age<31,:);
oldPatients=patients(patients.Age>=31,:)


%Part 4- small group systolic means

%non-splitapply
G=findgroups(youngPatients.Gender);
msum=0;
mnum=0;
for k=1:18
    if G(k)==2
        msum=msum + youngPatients.Systolic(k);
        mnum=mnum+1;
    end
end
meanYoungMen=msum/mnum;

fsum=0;
fnum=0;
for k=1:18
    if G(k)==1
        fsum=fsum + youngPatients.Systolic(k);
        fnum=fnum+1;
    end
end
meanYoungWomen=fsum/fnum;


%splitapply
G=findgroups(oldPatients.Gender);
meanOld=splitapply(@mean, oldPatients.Systolic, G);
meanOldMen=meanOld(2);
meanOldWomen=meanOld(1);

    
    


