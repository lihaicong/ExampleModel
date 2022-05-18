clc
%% romove library path
% rmpath('.\ACC_Controller\ACTRL\010_Autocode_Lib\Core\060_DAS_Control_core_lib')

%% REPLACE T_A
% b_name10 = find_system('regexp','off','CaseSensitive','on',...
%     'IncludeCommented','on','LookUnderMasks','on','FollowLinks','on','type','block','SampleTime','T_A');
gcs
% b_name10 = find_system(gcs,'regexp','off','CaseSensitive','on','IncludeCommented','on','LookUnderMasks','on','FollowLinks','on','type','block','Sample Time','T_A');
b_name10 = find_system(gcs,'regexp','off','CaseSensitive','on','IncludeCommented','on','LookUnderMasks','on','FollowLinks','on','BlockType','FromWorkspace');
for i = 1:length(b_name10)
    set_param(b_name10{i},'VariableName','[0 0]')
end
% b_name11 = find_system('regexp','off','CaseSensitive','on',...
%     'IncludeCommented','on','LookUnderMasks','on','FollowLinks','on','type','block','SampleTime','T_LAT')

% Set simulation start/stop time
StartTime=0;StopTime=10;
%% add library path
% addpath('.\ACC_Controller\ACTRL\010_Autocode_Lib\Core\060_DAS_Control_core_lib')
