% Rename the suffix of all files at a folder
% folder
% -> rename the suffix of all files at this folder
% 
% Input:
% folder = paht of the folder, without the end '\';
% newExt = new suffix;
% 
% Output:
% files with new suffix
% 
% e.g.
% folder = 'D:\Wen\Research\MAS\PEER\FEMA_p695\Far-Field_Record\Normalized';
% newExt = '.txt';
% renameFolderFile(folder, new_ext)


function renameFolderFile(folder, newExt)
    file_list = getFolderList(folder);
    for i = 1: size(file_list,1)
        file_path = [folder, '\', file_list{i}];
        [~, name, ext] = fileparts(file_path);
        if ~strcmp(ext, newExt)
            new_name = [name, newExt];
            movefile(file_path,[folder, '\', new_name]);
        end
    end
end