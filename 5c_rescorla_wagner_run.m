

%{
Eva Speiser
2021
This code contains rwAB function which runs the rescorla wagner updating
model for compound conditioned stimuli
@param, number of trials, strength of a, strength of b, alpha a, alpha b,
and lambda
@return vectors A and B contianing the results of the 10 trials (+intial
condition)
%}

function [VVectA,VVectB]=rwAB(nTrials,VA,VB,alphaA,alphaB,lambda)
%make empty vectors of size nTrials+1
VVectA=zeros(1,nTrials+1);
VVectB=zeros(1,nTrials+1);

for i=1:nTrials+1 %do trials continuaously updating V values

VAtemp=VA;%temp value so trials update at same time 
VA=VA+ alphaA.*(lambda-(VA+VB)); %calculate new VA
VB=VB+ alphaB.*(lambda-(VAtemp+VB)); %calculate new VB

VVectA(i)=VA; %put updated value in VA vector
VVectB(i)=VB; %put updated value in VB vector
    
end
end