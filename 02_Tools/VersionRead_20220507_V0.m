clear VerCtrl_Model VerCtrl_DD
%Generate Version Control Information
%% DD Version
DDVerCtrlWord='k_KopilotCal_';
VarList=whos('-regexp','k_KopilotCal_*');
for i=1:length(VarList)
    Name=VarList(i).name;
    NameSplited=strsplit(Name,'_');
    Componet=NameSplited{3};
    Property=strjoin(NameSplited(4:end),'_');
    eval(['VerCtrl_DD.',Componet,'.',Property,'=',Name,';']);
end
%% Platform Version
ModelVerCtrlWord='k_Platform';
VerCtrl_Blk=find_system(bdroot(gcs),'RegExp','on','LookUnderMasks','on','FollowLinks','on','Name',ModelVerCtrlWord);
for i=1:length(VerCtrl_Blk)
    BlockPath=strsplit(VerCtrl_Blk{i},'/');
    BlockName=BlockPath{end};
    BlockNameSplited=strsplit(BlockName,'_');
    if strcmpi(BlockNameSplited{end},'version')%Valid
        Componet=BlockNameSplited{2};
        Property=strjoin(BlockNameSplited(end-1:end),'_');
        Value=get_param(VerCtrl_Blk{i},'Value');
        eval(['VerCtrl_Model.',Componet,'.',Property,'=',num2str(Value),';']);        
    end
end
%% Model Version
ModelVerCtrlWord='k_[Kk]opilot';
VerCtrl_Blk=find_system(bdroot(gcs),'RegExp','on','LookUnderMasks','on','FollowLinks','on','Name',ModelVerCtrlWord);
for i=1:length(VerCtrl_Blk)
    BlockPath=strsplit(VerCtrl_Blk{i},'/');
    BlockName=BlockPath{end};
    BlockNameSplited=strsplit(BlockName,'_');
    if strcmpi(BlockNameSplited{end},'version')%Valid
        ComponetTmp=BlockNameSplited{2};
        Componet=ComponetTmp(6:end);%Skip Kopilot and get the component Name
        if strcmp(Componet,'Lat')
           Componet= BlockNameSplited{3};%Speical Case for Lat Feature
        end
        if strcmp(Componet,'Cal')
            Componet='Tranlate_In_Out';%Translate Out H9 Model
            continue
        end
        Property=strjoin(BlockNameSplited(end-1:end),'_');
        Value=get_param(VerCtrl_Blk{i},'Value');
        eval(['VerCtrl_Model.',Componet,'.',Property,'=',num2str(Value),';']);        
    end
end

%% Output to Excel:
Fields=fields(VerCtrl_DD);
Content={'No','SWC','DD_Version'};%Header
for i=1:length(Fields)
    Content{end+1,1}=i;%No
    Content{end,2}=Fields{i};%SWC
    MajorVersion=eval(['VerCtrl_DD.',Fields{i},'.major_version']);
    MinorVersion=eval(['VerCtrl_DD.',Fields{i},'.minor_version']); 
    try
        field_version=eval(['VerCtrl_DD.',Fields{i},'.field_version']);
    catch
        field_version=0;   
    end
    Content{end,3}=[num2str(MajorVersion),'.',num2str(MinorVersion),'.',num2str(field_version)];
end
xlswrite('VersionInfo.xlsx',Content,'DD_Version');

Fields=fields(VerCtrl_Model);
Content={'No','SWC','Model_Version'};%Header
for i=1:length(Fields)
    Content{end+1,1}=i;%No
    Content{end,2}=Fields{i};%SWC
    try
        MajorVersion=eval(['VerCtrl_Model.',Fields{i},'.Major_Version']);
    catch
        MajorVersion=eval(['VerCtrl_Model.',Fields{i},'.major_version']);
    end
    try
        MinorVersion=eval(['VerCtrl_Model.',Fields{i},'.Minor_Version']);
    catch
        try
            MinorVersion=eval(['VerCtrl_Model.',Fields{i},'.minor_version']);
        catch
			try
				MinorVersion=eval(['VerCtrl_Model.',Fields{i},'.Minor_Version']);
			catch
				MinorVersion=eval(['VerCtrl_Model.',Fields{i},'.Mino_Version']);
			end
        end
    end
    try
       field_version=eval(['VerCtrl_Model.',Fields{i},'.Field_Version']);
    catch
        try
            field_version=eval(['VerCtrl_Model.',Fields{i},'.field_version']);
        catch
             field_version = 0;
        end
    end
    Content{end,3}=[num2str(MajorVersion),'.',num2str(MinorVersion),'.',num2str(field_version)];
end
xlswrite('VersionInfo.xlsx',Content,'Model_Version');