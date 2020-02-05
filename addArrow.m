function [  ] = addArrows( filename, outfile )

close all

addpath('jsonlab');

global nodes;
global edges;
data = loadjson(filename);

nodes = data.nodes;
edges = data.edges;

disp('nodes count:');
disp(size(nodes, 2));
disp('edges count:');
disp(size(edges, 2));
disp('processing...');

global arrow_count;

arrow_count = 0;

addArrow_inside('Collignon', 'HEALPix');
addArrow_inside('Lambert cylindrical', 'HEALPix');

addArrow_inside('Plate Carrée', 'Eckert 5');
addArrow_inside('Sinusoidal', 'Eckert 5');
addArrow_inside('Equirectangular', 'Kavrayskiy 1');
addArrow_inside('Mercator', 'Kavrayskiy 1');
addArrow_inside('Lambert cylindrical', 'Arden-Close');
addArrow_inside('Mercator', 'Arden-Close');

addArrow_inside('Equirectangular', 'Winkel 1');
addArrow_inside('Sinusoidal', 'Winkel 1');
addArrow_inside('Equirectangular', 'Winkel 2');
addArrow_inside('Apian II', 'Winkel 2');
addArrow_inside('Aitoff', 'Winkel 3');
addArrow_inside('Equirectangular', 'Winkel 3');

addArrow_inside('Mollweide', 'Winkel-Snyder');
addArrow_inside('Equirectangular', 'Winkel-Snyder');

addArrow_inside('Stereographic', 'Breusing');
addArrow_inside('Azimuthal equal-area', 'Breusing');
addArrow_inside('Bonne', 'Strebe 2016');
addArrow_inside('Albers', 'Strebe 2016');
addArrow_inside('Albers', 'Strebe 2018');
addArrow_inside('Azimuthal equal-area', 'Strebe 2018');
addArrow_inside('Azimuthal equal-area', 'Jenny 2018');
addArrow_inside('Trans. Cylindrical', 'Jenny 2018');
addArrow_inside('Azimuthal equal-area', 'USG 2011');
addArrow_inside('Azimuthal equal-area', 'APP 2012');
addArrow_inside('Azimuthal equal-area', 'NUG 2010');
addArrow_inside('Azimuthal equal-area', 'SEA');
addArrow_inside('Azimuthal equal-area', 'White 1992');
addArrow_inside('Azimuthal equal-area', 'SAND 2000');
addArrow_inside('Azimuthal equal-area', 'Hammer');
addArrow_inside('Azimuthal equidistant', 'Aitoff');
addArrow_inside('Eckert 4', 'Strebe 1995');
addArrow_inside('Mollweide', 'Strebe 1995');
addArrow_inside('Hammer', 'Strebe 1995');

addArrow_inside('Plate Carrée', 'Wagner 6');
addArrow_inside('Putniņš P1', 'Wagner 6');

addArrow_inside('Putniņš P3', 'Putniņš P3\u0027');
addArrow_inside('Plate Carrée', 'Putniņš P3\u0027');
addArrow_inside('Craster\u0027s parabolic', 'McBryde P3');
addArrow_inside('McBT FPP', 'McBryde P3');
addArrow_inside('Quartic authalic', 'McBryde Q3');
addArrow_inside('McBT FPQ', 'McBryde Q3');
addArrow_inside('Sinusoidal', 'McBryde S2');
addArrow_inside('Eckert 6', 'McBryde S2');
addArrow_inside('Sinusoidal', 'McBryde S3');
addArrow_inside('McBT FPS', 'McBryde S3');
addArrow_inside('A4', 'Dedistort');
addArrow_inside('Ciric I', 'Dedistort');
addArrow_inside('Quartic authalic', 'Siemon IV');

disp(['arrow_count ', num2str(arrow_count)]);

data.nodes = nodes;
data.edges = edges;

savejson([], data, outfile);

end

function [  ] = addArrow_inside( filename )

global arrow_count;

global nodes;
global edges;

found = false;

for i = 1:size(edges, 2)
    edge = edges{i};
    s = str2num(edge.source);
    t = str2num(edge.target);
    for k = 1:size(nodes, 2)
        n = nodes{k};
        if str2num(n.id) == s
            s = n.label;
            break;
        end
    end
    for k = 1:size(nodes, 2)
        n = nodes{k};
        if str2num(n.id) == t
            t = n.label;
            break;
        end
    end
    if strcmp(s, name1) && strcmp(t, name2)
        edges{i}.attributes{end + 1} = 'curved';
        found = true;
        arrow_count = arrow_count + 1;
        break;
    end
end

if ~found
    disp([name1, ' -> ', name2, ' not found']);
end

end
