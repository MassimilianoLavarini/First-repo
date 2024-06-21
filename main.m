% -------------------------------------------------------------------------
%                  _ __ ___   __ _(_)_ __    _ __ ___  
%                 | '_ ` _ \ / _` | | '_ \  | '_ ` _ \ 
%                 | | | | | | (_| | | | | |_| | | | | |
%                 |_| |_| |_|\__,_|_|_| |_(_)_| |_| |_|
%  ------------------------------------------------------------------------
                             initialization;

                             %% simu_flag

% flag to select if load simulated data
simu_flag = false;

% select which version of the data loading you want to select
% - 'new' (for log after 6/04/24)
% - 'old' (for log before 6/04/24)
loading_version = 'new';

%% MOD SELECTION
list_mod = {'1) Import and Filter',...
            '2) Data Analysis',...
            '3) Noise Estimation',...
            '4) Fourier Transform',...
            '5) Handling Diagrams',...
            '6) Data comparison'};

[indx_mod,~] = listdlg('PromptString',{'           SELECT A MODE!'},...
    'SelectionMode','single','ListSize',[300,150],'ListString',list_mod);

if    (indx_mod == 1), csv_to_mat;       % CONVERSION CSV TO MAT FILE 
                                         % WITH FILTERING AND CUTTING 
                                         % (select the folder Parsed!!!!!!)

elseif(indx_mod == 2), Data_Analysis;          % DATA ANALYSIS

elseif(indx_mod == 3), NoiseMain;              % NOISE TESTS (DON'T WORK)

elseif(indx_mod == 4), Frequency_analysis;     % FREQUENCY ANALYSIS

elseif(indx_mod == 5), HandlingLoading;        % HANDLING DIAGRAMS (DON'T WORK)

elseif(indx_mod == 6), Performance_Comparison; % DATA COMPARISON

else, fprintf('Wrong mod selection!\n'); return;
end