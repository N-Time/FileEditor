% Read a .txt and edit its a specific line
% Input:
% filename = the entire path of the file
% line_label = the beginning labelled strings of the line
% edit_string = the string that will be edited at the line
% desire_string = the desire string that will be changed to at the line
% 
% e.g.
path = 'E:\ANSYS\MAS_IDA\RSN1111_KOBE_NIS000'; % without '\' at the end.
filename = 'main.mac';
line_label = 'wavename=';
edit_string = 'RSN1063_NORTHR_RRS';
desire_string = 'RSN1111_KOBE_NIS000';


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
    fid = fopen(filepath,'r+');
    
    i = 0;
    content = {};
    line_lable_length = length(line_label);
    while ~feof(fid) % loop from the beginning to the end of the .txt
        tline = fgetl(fid); % read each line
        i = i+1;
        content{end+1} = tline;  % store each line to the content
    end

    frewind(fid); % Set the pointer to the beginning
    for j = 1: 1: size(content,2)
        % change the target line
        if strcmp(content{j}(1:line_lable_length), line_label)
            content{j} = strrep(content{j}, edit_string, desire_string);
        end
    end

    frewind(fid); % Set the pointer to the beginning
    for k = 1: 1: size(content,2)
        fprintf(fid,'%s\r\n',content{k}); % Write the content line-by-line
    end
    
    fclose(fid);
    
%     % Reduction the file name
%     if ~strcmp(ext, '.txt')
%         old_name =  [name, ext];
%         movefile(filepath,[path, '\', old_name]);
%     end
    
    disp('The file has been edited.')
