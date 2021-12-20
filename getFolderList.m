% Get all ducuments and files at a folder
% folder path
% -> documents and files list in a cell
% 
% Input:
% path = the path of a document folder;
% 
% Output:
% list = documents and files list in a cell;
% 
% e.g.
% path = 'D:\Wen\Research\MAS\PEER\FEMA_p695\Far-Field_Record\Original';
% list = getFolderList(path)
% 
% a cell of the list

function list = getFolderList(path)
    file = dir(path); % all ducuments and files informations
    list = {file.name}'; % all ducuments and files names
    list = list(3:end);
end