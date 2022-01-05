%Eva Speiser HW 1
clear

%1.
a=134+135;
b=11-12;
c=11/134;
d=11.^11;

%2.
v=[134 135 11 12];
a2=v(1)+v(2);
b2=v(3)-v(4);
c2=v(3)./v(1);
d2=v(3).^v(3);

%3.
v2=v';
v3=v([4 3 2 1]);
v4=v([1 1 2 2 3 3 4 4]);

%4.
vv3=[v;v3];
vNaNv3=[v;nan(1,4);v3];
v62=[v2,v2,v2,v2,v2,v2];


%5.
m=[];
m1=[m,[1 1]];
m2=[ones(2).*2; m1];
m3=[ones(3).*3, m2];
m4=[m3; ones(5).*5];



%6
nums=flip(1:1:109);
num2=prod(1:4:109);
num3=(1:1:111).^2;


%7
mag=magic(5);

summag=sum(sum(mag));
maxmag=max(max(mag));
minmag=min(min(mag));







