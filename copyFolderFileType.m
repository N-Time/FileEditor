% Copy the output results to the corresponding folder for specifc file type
% copy file with designated type
% -> another folder
% 
% Input:
% copyFromPath = the path the file with an input suffix copied from;
% copyToPath = the path the file with an input suffix copied to;
% copyFileExt = a specific suffix want to copy;
% 
% Output:
% files of the designated type in another folder;
% 
% e.g.
% copyFromPath = 'E:\ANSYS\MAS_IDA\RSN1111_KOBE_NIS000\0.1';
% copyToPath = 'E:\ANSYS\MAS_IDA\RSN1111_KOBE_NIS000\Results\0.1';
% copyFileExt = '.err';   % '.out'; '.err'; '.log'; '.txt'; '.mac'


function copyFolderFileType(copyFromPath,copyToPath,copyFileExt)
    result_file_list = getFolderList(copyFromPath);    % get the file list at the result folder
    folderCheck(copyToPath);   % Check the fold, if it does not exist, built it.

    for i = 1: 1: size(result_file_list,1)
        [~, ~, ext] = fileparts(result_file_list{i});
        if strcmp(ext, copyFileExt)
            copy_file = [copyFromPath, '\', result_file_list{i}];
            copyfile(copy_file,copyToPath);
        end
    end
end