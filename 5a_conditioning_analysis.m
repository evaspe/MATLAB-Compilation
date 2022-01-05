clear 
clc

%{
Eva Speiser
2021
This code makes and plots vectors representing 10 trials of each of the 6 predictions of
Rescorla-Wagner model for classical conditioning
Uses additional files rw.m and rwAB.m
%}

%1. Acquisition(V=0; α=.5; λ=1)
VVect1=rw(10, 0, .5,1);

%2. Extinction(V=1; α=.5;λ=0)
VVect2=rw(10, 1, .5,0);

%3. Compound Contioning (VA=VB=0; αA=αB=.3; λ=1)
[VVectA3,VVectB3] = rwAB(10, 0, 0, .3, .3, 1);

%4. Overshadowing(VA=VB=0; αA=.3; αB=.1; λ=1)
[VVectA4,VVectB4]=rwAB(10, 0, 0, .3, .1, 1); 

%5. Blocking (VA=1; VB=0; αA=αB=.3; λ=1)
[VVectA5,VVectB5]=rwAB(10, 1, 0, .3, .3, 1); 

%6. Overexpectation(VA=VB=1; αA=αB=.3; λ=1)
[VVectA6,VVectB6]=rwAB(10,1, 1, .3, .3, 1); 


%making plots in individual figure windows
plot(VVect1); %acquisition plot

figure;%new figure
plot(VVect2); %extinction plot

figure; %new figure
plot(VVectA3)%compound conditioning plot A
hold on; %add another line
plot(VVectB3); %compound conditioning plot B
hold on;%add another line
plot((VVectB4+VVectA4));%compound conditioning plot A+B

figure; %new figure
plot(VVectA4);%overshadowing plot A
hold on;%add another line
plot(VVectB4);%overshadowing plot B
hold on;%add another line
plot((VVectB4+VVectA4));%overshadowing plot A+B

figure; %new figure
plot(VVectA5);%blocking plot A
hold on;%add another line
plot(VVectB5);%blocking plot B
hold on;%add another line
plot((VVectB5+VVectA5));%blocking plot A+B

figure %new figure
plot(VVectA6);%overexpectation plot A
hold on;%add another line
plot(VVectB6);%overexpectation plot B
hold on;%add another line
plot((VVectB6+VVectA6));%overexpectation plot A+B


