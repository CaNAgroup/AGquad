function guiprint(str, calledbyapp, textarea)
%GUIPRINT auxiliary output routine
%   guiprint(str, calledbyapp, textarea)
%   where
%      str         - message to be displayed
%      calledbyapp - used by app flag
%      textarea    - window area for displaing information (used by app)

%   P. Diaz de Alba, L. Fermo, and G. Rodriguez
%   University of Cagliari, Italy
%
%   Last revised April 16, 2025

if calledbyapp
	textarea.Value{end+1} = str;
else
	fprintf(str)
	fprintf('\n')
end

