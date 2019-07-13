function Epoching(pathname)

% Args are your pathname for the data you want to extract. In this task
% there where two conditions so the function asks for a condition you want
% to epoch for. The event markers are specific to this task and so need to
% be changed. It creates a subfolder in the dir to stor all the epoched
% data whilst keeping the original files.

file_list = dir([pathname filesep() '*.set']);
numsubjects = length(file_list);
file_name_list = {file_list.name};

% Need to change conditions to your tasks eg input('Onset of stimulus or
% noise')

Task = input('Epoch from Investment or Attribute: ', 's');

% Need to change strcmpi answers out of the options you have

if strcmpi(Task,'Investment')
    
    namenewpath = '/Extracted Epochs Investment';
    newpath = [pathname namenewpath];
    mkdir(pathname, namenewpath)
    
    OnSet = input('Epoch from response or reading: ', 's');
    
    if strcmpi(OnSet,'response')
        
        
        for s=1:numsubjects
            
            
            subject = file_name_list{s};
            
            subjectfolderRaw = [pathname '/' subject];
            
            namenewpath2 = '/Extracted Response 61564';
            newpath2 = [newpath namenewpath2];
            mkdir(newpath, 'Extracted Response 61564')
            
            
            fprintf('\n\n\n*** Epoching subject %d (%s) ***\n\n\n', s, subject);
            
            % Change the name to desired eg [ subject 'Onset of Stimulus]
            
            %             SubjectName = ['Subject ' s ' Epochs Investment Response'];
            SubjectName = ['Subject ' s ' Epochs Investment Response'];
            SubjectNameBase = [SubjectName 'BaseRem'];
            [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
            EEG = pop_loadset('filename', subject,'filepath', pathname);
            
            % Need to change {} values to your event markers and desired
            % start time here eg [-1 3]
            
            EEG = pop_epoch( EEG, {  '61564'  }, [-30   2], 'newname', ...
                [subject ' epochs'] , 'epochinfo', 'yes');
            %             EEG = pop_saveset( EEG, 'filename', [SubjectName],'filepath', ...
            %                 newpath2);
            
            % Need to change baseline to desire here eg [-1 0]
            
            EEG = pop_rmbase( EEG, [-30000 0] ,[]);
            EEG = pop_saveset( EEG, 'filename', [subject],'filepath', ...
                newpath2);
            EEG = eeg_checkset( EEG );
        end
        
    elseif strcmpi(OnSet,'reading')
        
        for s=1:numsubjects
            
            
            subject = file_name_list{s};
            
            subjectfolderRaw = [pathname '/' subject];
            
            namenewpath2 = '/Extracted Reading 61563';
            newpath2 = [newpath namenewpath2];
            mkdir(newpath, 'Extracted Reading 61563')
            
            
            fprintf('\n\n\n*** Epoching subject %d (%s) ***\n\n\n', s, subject);
            
            % Change the name to desired eg [ subject 'Onset of Stimulus]
            
            %             SubjectName = ['Subject ' s ' Epochs Investment Reading'];
            %             SubjectNameBase = [SubjectName 'BaseRem'];;
            
            [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
            EEG = pop_loadset('filename', subject,'filepath', pathname);
            
            % Need to change {} values to your event markers and desired
            % start time here eg [-1 2]
            
            EEG = pop_epoch( EEG, {  '61563'  }, [-30   2], 'newname', ...
                [subject ' epochs'], 'epochinfo', 'yes');
            %             EEG = pop_saveset( EEG, 'filename', [SubjectName],'filepath', ...
            %                 newpath2);
            
            % Need to change baseline to desire here eg [-1 0]
            
            EEG = pop_rmbase( EEG, [-30000 0] ,[]);
            EEG = pop_saveset( EEG, 'filename', [subject],'filepath', ...
                newpath2);
            EEG = eeg_checkset( EEG );
            
        end
    end
elseif strcmpi(Task,'Attribute')
    
    namenewpath = '/Extracted Epochs Attribute';
    newpath = [pathname namenewpath];
    mkdir(pathname, namenewpath)
    
    
    
    for s=1:numsubjects
        
        
        subject = file_name_list{s};
        
        subjectfolderRaw = [pathname '/' subject];
        
        
        fprintf('\n\n\n*** Epoching subject %d (%s) ***\n\n\n', s, subject);
        
        % Change the name to desired eg [ subject 'Onset of Stimulus]
        
        %             SubjectName = ['Subject ' s ' Epochs Attributes'];
        %             SubjectNameBase = [SubjectName 'BaseRem'];
        
        [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
        EEG = pop_loadset('filename', subject,'filepath', pathname);
        
        % Need to change {} values to your event markers and desired
        % start time here
        
        
        EEG = pop_epoch( EEG, {  '61568'  '61570'  '61572'  '61574'  }, ...
            [-2  1], 'newname', [subject ' epochs'], 'epochinfo', 'yes');
        
        %             EEG = pop_saveset( EEG, 'filename', [SubjectName],'filepath', ...
        %                 newpath);
        
        % Need to change baseline to desire here eg [-1 0]
        
        EEG = pop_rmbase( EEG, [-2000 0] ,[]);
        EEG = pop_saveset( EEG, 'filename', [subject],'filepath', ...
            newpath);
        EEG = eeg_checkset( EEG );
    end
end



end