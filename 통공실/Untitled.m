% 2017 Fall - Communications Lab. Project
% Prepared by Prof. Hyunggon Park
% Dept. of Electronin and Electrical Engineering
% Ewha Womans University

clear all; close all; clc;
load('encoded_data.mat'); %variable name: mod_data

result_without_noise=demod(mod_data); %result without noise using function

mod_data_n=zeros(1,1000000);
mod_data_n = mod_data+normrnd(0, 10, 1,length(mod_data)); % AWGN noise when sigma is 4
result_with_noise4=demod(mod_data_n);
%for BER gragh

Pb=zeros(1,10);
for k=1:10
mod_data_n = mod_data+normrnd(0, nthroot(k,2), 1,length(mod_data)); % AWGN noise (sigma = nthroot(k,2), sigma^2 = k)
demod_n=demod(mod_data_n); %result with noise using function
Pb(k)=sum(sum(xor(result_without_noise,demod_n)))/10000;
end
l=(1:10);
semilogy(log10(1./l),Pb,'r*-'); title('BER Gragh');
xlabel('log(1/\sigma)'); ylabel('Pb');

figure;
subplot(1,2,1);imshow(result_without_noise);
title('Decoded Output');
subplot(1,2,2);imshow(result_with_noise4);
title('Decoded Output with Noise');

%% Demodulation
function result=demod(mod_data)
% correlator - passband to baseband 
% Encoding parameters
f = 10;                      % sampling frequency
time_step=0.01;              % duration between samples (unit time)
num_sample = 1/time_step;    % number of samples in 1 time unit; 100
t = 0:time_step:1-time_step; 
row = 100;  % row size of image matrix
col = 100;  % column size of image matrix 
data_size=size(mod_data);
result_cos=zeros(1,1000000);
    for i=1:1000000
            result_cos(i)=(cos(2*pi*f*i*time_step)*mod_data(i));
    end

% correlator - integrate 0 to T
result_cos_reshape=transpose(reshape(result_cos,[100,10000])); %reshape to sum easily(transpose : row->col, col->row)
result_sum=sum(result_cos_reshape,2);

% Decision Threshold
result_base=zeros(1,10000); %for zeros and ones
    for j=1:10000
        if(result_sum(j)<0) %decision making (skipped >=0 cuz others are already zero)
            result_base(j)=1;
        end
    end
 result=transpose(reshape(result_base,[100,100])); %reshaped in given 100*100 form
end