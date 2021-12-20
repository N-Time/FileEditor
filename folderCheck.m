% Check the existence of the direction
% folder path
% -> pass (existed) or created new one (not existed)

% Input:
% folder = the path of the folder

% Output:
% if the folder has been exisited, pass
% if the folder has not been existied, it will be created

% e.g.
% folder = 'E:\ANSYS\MAS_IDA\RSN1111_KOBE_NIS000\0.1';
% folderCheck(folder)
% 
% pass or a new folder: '0.1'

function folderCheck(folder)
    if exist(folder) == 0 % 判断文件夹是否存在
        mkdir(folder);  % 不存在时候，创建文件夹
    end
end