%bc = load('breast_cancer_wisconsin_data.mat','-ascii');
%X = bc(:,1:end-1);
%Y = bc(:,end);
%testX = [];
%testY = [];

%% load stuff
shuttle = load('/home/moritz/uni/svm/exercise3/matlab/shuttle.dat');
X = shuttle(1:43500,1:9);
Y = shuttle(1:43500,10);

testX = shuttle(43501:58000,1:9);
testY = shuttle(43501:58000,10);

%Parameter for input space selection
%Please type >> help fsoperations; to get more information  


%% execute 
k = 6;
function_type = 'c'; %'c' - classification, 'f' - regression  
kernel_type = 'RBF_kernel'; % or 'lin_kernel', 'poly_kernel'
global_opt = 'csa'; % 'csa' or 'ds'

%Process to be performed
user_process={'FS-LSSVM', 'SV_L0_norm'};
window = [15,20,25];


         % fslssvm(X,Y,k,function_type,kernel_type,global_opt,user_process,window,testX,testY)
[e,s,t] = fslssvm(X,Y,k,function_type,kernel_type,global_opt,user_process,window,testX,testY);
