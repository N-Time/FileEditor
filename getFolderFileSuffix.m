% Get the file list from a folder according a input suffix
% folder
% -> the list in a cell of the files with the input suffix
% 
% Input:
% mainPath = path of the folder;
% folderName = folder name;
% suffix = suffix in string;
% 
% Output:
% output = a cell of the list of files with specific type;
% 
% e.g.
% mainPath = 'D:\Wen\Research\MAS\PEER\FEMA_p695\Far-Field_Record\Original';
% folderName = '68';
% suffix = '.AT2';
% output = get_record_folder_file_list(mainPath,folderName,suffix);

function output = getFolderFileSuffix(mainPath,folderName,suffix)
    op_path = [mainPath, '\', folderName]; % Full document name of a GMA list
    file = dir(op_path); % all ducuments and files informations
    all_record = {file.name}'; % all ducuments and files names
    all_record = all_record(3:end);
    num_record = size(all_record,1);
    
%     % Decide the label
%     suffix = getWaveFileTypePEER(label);
    
    % Collect the record name into a cell according the label
    selected_records = {};
    for i = 1: 1: num_record
        sfx = all_record{i}(end-3:end);
        if sfx == suffix
            selected_records{end+1} = all_record{i};
        end
    end

    output = selected_records';
end