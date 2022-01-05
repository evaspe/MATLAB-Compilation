
load patients.mat
patients=table(LastName,Age,Gender,Height)
%patients.LastName(1)
 LastName1=char(patients.LastName(1))
%make new variable astnamelay, modify each element of last name, make new
%table only using astnamelay 

%maybe label the rows by number and the 

%patCell={Age; Diastolic; Gender}

%patStruct=struct('Age', num2cell(Age), 'Diastolicccc', num2cell(Diastolic))