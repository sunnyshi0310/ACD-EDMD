% This main is to test the performance of different settings of dictionary
% in a manipulator model

%% Initialization
clear
clc

Ts = 0.01; % Sampling rate
index_j = 2; % Number of joints
index_d = 1; % index of dictionary our method: 3; DMD: 5

nx = 4; % # of states
nu = 2; % # of inputs

tic


%% Estimation the Koopman operator and check the performance of prediction
load('INPUTS.mat')
K = initialization(index_d, Ts, index_j,nx,nu,INPUTS);
% [K,Wout,bout,W0,W1,W2,b0,b1,b2,delta_phi] = init_EDMDDL(Ts, nx, nu, INPUTS,index_j);

to = toc

F = doubleV(K,nx,nu,index_d);


