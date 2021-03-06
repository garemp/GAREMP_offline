function [  ] = add_brackets( filename )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Add brackets to JSON file
% Here is a snippet of a sample JSON file
%        {
%            "type": "Feature",
%            "id": 0,
%            "geometry": {
%                "type": "MultiPolygon",
%                "coordinates": [[[
%                                ^^ <-'[[' is added by this function
%                    [-862.1882935,-272.5610352],
%                    [-921.7738037,-107.7567368],
%                    [-813.0441284,-447.0093079],
%                    [-862.1882935,-272.5610352]
%                ]]]
%                 ^^ <-']]' is added by this function
%                },
%                "properties": {
%                "cartogram_id": "1"
%            }
%        },
% The resulting JSON would be used by cartogram algorithm

fid = fopen(filename);
fidout = fopen([filename, '+b', '.json'], 'w');

lcount = 0;

tline = fgetl(fid);
while ischar(tline)
    if lcount == 8
        fwrite(fidout, [tline, '[[', sprintf('\n')], 'char');
    elseif lcount == 13
        fwrite(fidout, [tline, ']]', sprintf('\n')], 'char');
    else
        fwrite(fidout, [tline, sprintf('\n')], 'char');
    end
    tline = fgetl(fid);
    lcount = lcount + 1;
    if lcount == 16
        lcount = 0;
    end
end

fclose(fid);
fclose(fidout);

delete(filename);
movefile([filename, '+b', '.json'], filename);

end

