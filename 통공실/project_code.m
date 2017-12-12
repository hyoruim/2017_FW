% 2017 Fall - Communications Lab. Project
% Prepared by Prof. Hyunggon Park
% Dept. of Electronin and Electrical Engineering
% Ewha Womans University

clear all
close all

load('encoded_data.mat'); %variable name: mod_data

% Encoding parameters
f = 10;                      % sampling frequency
time_step=0.01;              % duration between samples
num_sample = 1/time_step;    % number of samples in 1 time unit; 100
t = 0:time_step:1-time_step; 
row = 100;  % row size of image matrix
col = 100;  % column size of image matrix 


% Decoding - You should write your codes for decoding 








% if you want to see your decoded outcome named by variable 'result' in an
% image form, use the following commands: 

% figure
% imshow(result)
% title('Decoded Output')

