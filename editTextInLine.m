% Read a text file (e.g., .txt) and edit a specific string in a specific line
% line number and string
% -> edite the string in the line

% Input:
% path = the path of the file;
% filename = the entire path of the file;
% lineNum = the beginning labelled strings of the line;
% editString = the string that will be edited at the line;
% desireString = the desire string that will be changed to at the line;
% 
% Output
% the file edited;
% 
% e.g.
% path = 'D:\Wen\Matlab'; % without '\' at the end.
% filename = 'test.txt';
% lineNum = 2;
% editString = 'edit';
% desireString = 'r';
% editTextInLine(path,filename,lineNum,editString,desireString)

function editTextInLine(path,filename,lineNum,editString,desireString)
    filepath = [path, '\', filename];
    
    % Change the file to .txt
%     [~, name, ext] = fileparts(filepath);
%     if ~strcmp(ext, '.txt')
%         new_name = [name, '.txt'];
%         movefile(filepath,[path, '\', new_name]);
%         filename = new_name;
%         filepath = [path, '\', filename];
%     end
%     
    fid = fopen(filepath,'r');
%     content = textscan(fid,'%s');
    i = 0;
    content = {};
    while ~feof(fid) % loop from the beginning to the end of the .txt
        tline = fgetl(fid); % read each line
        i = i+1;
        content{end+1} = tline;  % store each line to the content
    end
    fclose(fid);
    
    % change the target line
%     content{1}{lineNum} = strrep(content{1}{lineNum}, editString, desireString);
    content{lineNum} = strrep(content{lineNum}, editString, desireString);
    
    fid = fopen(filepath,'w');
%     frewind(fid); % Set the pointer to the beginning
    for k = 1: 1: size(content,2)
        fprintf(fid,'%s\n',content{k});% Write the content line-by-line
    end
    
    fclose(fid);
    
%     % Reduction the file name
%     if ~strcmp(ext, '.txt')
%         old_name =  [name, ext];
%         movefile(filepath,[path, '\', old_name]);
%     end
    
end