% This main is to test the performance of different settings of dictionary

%% Initialization
clear
clc

Ts = 0.1; % Sampling rate
index_d = 2; % index of dictionary
nx = 3; % # of states
nu = 2; % # of inputs

tic

%% Estimation the Koopman operator  
load('INPUTS.mat'); % load the input data
K = initialization(index_d, Ts, nx, nu, INPUTS); % ACD-EDMD
% K = init_comp(index_d, Ts, nx, nu, INPUTS); % Hermite polynomial and SINDy
% [K, W_out,b_out,W0,W1,W2,b0,b1,b2,e] = init_EDMDDL(Ts, nx, nu, INPUTS);

t0 = toc % print the training time
F = doubleV(K,nx,nu,index_d);% calculate the F matrix from K

%% check the performance of prediction
performance(F,Ts,nx,nu,index_d);
% check_sindy(K,Ts,nx,nu);
% check_DL(F,Ts,nx, W_out,b_out,W0,W1,W2,b0,b1,b2)
