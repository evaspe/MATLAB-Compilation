clear 
clc

%{
Eva Speiser
2021
This code extracts experimental data about context dependant memory from an outside file
and creates a cell array and a table containing relevant statistics (mean, standard deviation, totals)
Using data from godden_baddeley.xls 
%}
    

readtable godden_baddeley.xls; %get data from excel file
temp=ans; %make temporary table in matlab


table1a=cell(4,6);%new cell array

%add labels to columns
table1a(1,:)={'Learning environment' 'Mean recall score (dry)' ...
'S.D. (dry)' 'Mean recall score (wet)' 'S.D. (wet' 'Total'};
%add labels to rows
table1a(:,1)={'Learning environment' 'Dry' 'Wet' 'Total'}; 

%need to make column into array to access categorical data/use logical operators
conditionsStudyAll=categorical(temp.conditionsStudyAll);

%Column 2: mean recall dry

%split dry learners from wet learners into table
dryLearn=temp(conditionsStudyAll=='Dry',:);

%split the dry learners into test conditions of dry and wet 
G=findgroups(dryLearn.conditionsTestAll);

%find means for dry learners with wet tests and with dry tests
x=splitapply(@mean, dryLearn.dataAll, G);
table1a{2,2}=x(1);%put results into cell array
table1a{3,2}=x(2);%pit resilts into cell array

%add totals
tot= x(1)+x(2); %sum
table1a{4,2}= tot;%add to cell array

%Column 3: sd dry, we already have the dry learn table and the g from the last
%operation
x=splitapply(@std, dryLearn.dataAll, G);
table1a{2,3}=x(1);%put results into cell array
table1a{3,3}=x(2);%pit resilts into cell array

%add nan b/c no data there
table1a{4,3}= NaN;


%Column 4:mean recall wet
%split wet learners from dry learners
wetLearn=temp(conditionsStudyAll=='Wet',:);

%split the wet learners into test conditions of dry and wet 
G=findgroups(wetLearn.conditionsTestAll);

%find means for wet learners with wet tests and with dry tests
x=splitapply(@mean, wetLearn.dataAll, G);
table1a{2,4}=x(1);%put results into cell array
table1a{3,4}=x(2);%put results into cell array

%add totals
tot= x(1)+x(2); %sum 
table1a{4,4}= tot; %add to cell array

%Column 5:sd wet, we already have the wet learn and the g from the last
%operation
x=splitapply(@std, wetLearn.dataAll, G);
table1a{2,5}=x(1);%put results into cell array
table1a{3,5}=x(2);%pit resilts into cell array

%add nan for no data 
table1a{4,5}= NaN;
table1a{4,6}=NaN;

%Column 6:grand totals (adding means from cols 2 and 4)
table1a{2,6}= table1a{2,2} + table1a{2,4};
table1a{3,6}= table1a{3,2} + table1a{3,4};


%PART TWO: TABLE 1B

%make a temporary cell array removing the categories from the  data
temp=table1a(2:end,:);

%make the temp array into a table
table1b=cell2table(temp);

%add variable names
table1b.Properties.VariableNames={'Learning environment', 'Mean recall score (dry)','S.D. (dry)','Mean recall score (wet)','S.D. (wet', 'Total' };



