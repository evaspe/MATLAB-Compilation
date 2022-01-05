
%{
Eva Speiser
2021
This code contains rw function which models the rescorla wagner updating
model for one conditioned stimulus
@param, number of trials, strength, alpha, and lambda
@return vector contianing the results of the 10 trials (+intial
condition)
%}


function VVect=rw(nTrials, V, alpha, lambda) 
VVect=zeros(1,nTrials+1); %make empty vector of size nTrials+1

for i=1:nTrials+1 %loop for the trials
    V = V + alpha.*(lambda-V); %update v to be v + strength changes 
    VVect(i)=V; %put value in vector
    
end
end