%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calibration file for Matlab applications.
% DD uses version 1.1 of the bas file.
% Created     2021/3/4 
% Calibrations Values for project 
% Calibrations for full application.
%%%%%%%%% DONT CHANGE ANYTHING ABOVE THIS LINE %%%%%%%%%%%%%%%%%%%

SetDescription = 'Initial Value';
disp(['Description: ', SetDescription]);

%  COMPONENT:  \CA
k_axle_torque_limit_offst_max_x = [0 1 3 6 12 60]; % [0:1:60]  Input = (ACC_Target_Speed_mps - Host_Speed_mps) [mps] 
k_axle_torque_limit_offst_max_z = [0 250 600 750 900 1000]; % [-1000:1:1000]  Offset added to DrvIntndAxlTrqMax.  More positive offsets might allow the transmission to shift down, less positive offsets might suppress a downshift. [Nm] 
k_axle_torque_limit_offst_min_x = [-60 -12 -6 -3 -1.5 0]; % [-60:0.5:0]  Input = (ACC_Target_Speed_mps - Host_Speed_mps) [mps] 
k_axle_torque_limit_offst_min_z = [-200 -100 -75 -50 -25 -5]; % [-1000:1:1000]  Offset added to DrvIntndAxlTrqMax.  More negative offsets might allow the transmission to shift down, less negative offsets might suppress a downshift. [Nm] 
disp('End Calibrations for \Version Control');
