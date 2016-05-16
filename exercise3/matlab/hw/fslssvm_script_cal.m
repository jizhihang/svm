%% load toolboxes
addpath(genpath('../../../LSSVMlabv1_8_R2009b_R2011a'))
addpath(genpath('../../../svmCourseScripts/fixed-size'))

%% load data
cal = load('../california.dat');

%windowize
delay = 1032;
Xw = windowize(cal,1:delay+1);
testX = [];
testY = [];

%Parameter for input space selection
%Please type >> help fsoperations; to get more information  


%% execute 
k = 6;
function_type = 'f'; %'c' - classification, 'f' - regression  
kernel_type = 'RBF_kernel'; % or 'lin_kernel', 'poly_kernel'
global_opt = 'csa'; % 'csa' or 'ds'

%Process to be performed
user_process={'FS-LSSVM', 'SV_L0_norm'};
window = [15,20,25];


         % fslssvm(X,Y,k,function_type,kernel_type,global_opt,user_process,window,testX,testY)
[process_matrix_err,process_matrix_sv,process_matrix_time] = ...
    fslssvm(Xw(:,1:delay),Xw(:,end),k,function_type,kernel_type,global_opt,user_process,window,testX,testY);


%% save
save('shuttleData.mat','process_matrix_err','process_matrix_sv','process_matrix_time')

if 0
    label_process = user_process(1:length(user_process)-1);
    
    figure;
    boxplot(process_matrix_err);
    ylabel('Error estimate');
    title('Error Comparison for different approaches (user processes)');
    figure;
    boxplot(process_matrix_sv);
    ylabel('SV estimate');
    title('Number of SV for different approaches (user processes)');
    figure;
    boxplot(process_matrix_time);
    ylabel('Time estimate');
    title('Comparison for time taken by different approaches (user processes)');
end