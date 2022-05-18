% Initialize KoPilot Model at model preload
%
%   This file is executed at model preload (specify in simulink project)
%   Activates appropriate platform folder to point to for model to load
%       appropriate platform specific library models and use platform
%       specific data dictionary
%   Library/Simulation/CodeGen Paths are managed in simulink project path
%   options.
%                                                  YZ 2022-05-17

current_dir = pwd;

%% Set DD Paths and load Core DD

DataDictionary_dir = [current_dir,'\04_DataDictionary\'];
% % *************************************************************************
% addpath(genpath(DataDictionary_dir));
% % addpath(genpath(Customer_Lib_dir));
% % addpath(genpath(Platform_dir));
% addpath(genpath(Sfunc_dir));
% % addpath(genpath(Mudp_Decoding_dir));
% addpath(genpath(MUDP_Decoding_SourceFile_dir));
% addpath(genpath(ASDMTOOL_dir));
disp('******************************************************************')
disp('Loading calibrations from')
disp(DataDictionary_dir)
disp('******************************************************************')
disp(' ')

%FSRA
FSRA_cal;
FSRA_const;
FSRA_macros;

%% Customer Calibration
% Customer_cal;
% Customer_macros;

% disp(' ')
% disp('Customer specific cal has been loaded.')
% disp(' ')
%% Open Model
uiopen('KoPilot_Demo',1)
StartTime=0;StopTime=10;