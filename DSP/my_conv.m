function y=my_conv(x,h)
m=size(x,2);
n=size(h,2);

h1=fliplr(h);

y=zeros(1, m+n-1);

h0=zeros(1,m+n);
x0=zeros(1,m+n);

h0(1:n)=h1;
x0(n+1:m+n)=x;

i=1;

while i<m+n
    h0=circshift(h0,1);
    y(i)=sum(h0.*x0);
    i=i+1;
end