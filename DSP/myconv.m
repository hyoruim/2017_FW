function y=myconv(x,h)
m=size(x,2)
n=size(h,2)
length=m+n+1

h1=fliplr(h)
y=zeros(length)
temp=zeros(1,length)
h_temp=zeros(1,length)
x_temp=zeros(1,length)

i=1

while i < m
    h_temp(i:n)=h1
    x_temp(n+1:m+n)=x
    


