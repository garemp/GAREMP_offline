function [  ] = addInfo( filename, outfile )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/

addpath('jsonlab');


global nodes;
global edges;
data = loadjson(filename);

nodes = data.nodes;
edges = data.edges;

data.version = '2020-Feb-6';
data.comments.line1 = 'Author';
data.comments.line2 = 'Jin Yan, from School of Management and Engineering';
data.comments.line3 = 'Capital University of Economics and Business, Beijing, China';
data.comments.line4 = 'Copyright @ 2019-2020';
data.comments.line5 = 'All Right Reserved';
data.comments.line6 = 'This JSON file (including any form or variant of this file)';
data.comments.line7 = 'is forbidden to utilize or reuse without permission.';
data.comments.line8 = 'GAREMP: Graphical Attribute and Relationship Explorer for Map Projections';
data.comments.line9 = 'http://garemp.github.io/';

C = {'version','comments','nodes','edges'};
data = orderfields(data, C);

disp('nodes count:');
disp(size(nodes, 2));
disp('edges count:');
disp(size(edges, 2));
disp('processing...');

global ncnt;
global ecnt;

ncnt = 0;
ecnt = 0;

%       NAME        TYPE    PROP YEAR    IMG         AUTHOR
%       FULLNAME    ALIAS
addInfos('HEALPix', 'PCY', 'A', '1997', 'healpix', 'Krzysztof M. Górski');
addInfos('Bonne', 'PCO', 'A', '1511', 'bonne-45n', 'Bernardus Sylvanus');
addInfos('Hammer', 'LENPAZ', 'A', '1892', 'hammer', 'Ernst Hammer', ...
    '', 'Hammer-Aitoff');
addInfos('Wagner 6', 'PCY', 'M', '1932', 'wagner-6', 'Karlheinz Wagner', ...
    '', 'Putniņš P1''');
addInfos('USG 2011', 'POLYCUBE', 'A', '2011', '', 'Daniela Roşca and Gerlind Plonka');
addInfos('Kavrayskiy 7', 'PCY', 'M', '1939', 'kavraisky-7', 'Vladimir V. Kavrayskiy');
addInfos('McBT FPQ', 'PCY', 'A', '1949', ...
    'mcbryde-thomas-flat-polar-quartic', ...
    'Felix W. McBryde and Paul Thomas', ...
    'McBryde–Thomas flat-pole quartic', 'McBryde-Thomas No. 4');
addInfos('Azimuthal equidistant', 'AZ', 'D', 'c.a. 1000', 'azimuthal-equidistant-hemi', 'Abū Rayḥān al-Bīrūnī');
addInfos('Aitoff', 'LENPAZ', 'M', '1889', 'aitoff', 'David A. Aitoff');
addInfos('Mollweide', 'PCY', 'A', '1805', 'mollweide', ...
    'Karl Brandan Mollweide', ...
    '', 'Babinet, Elliptical or Homolographic');
addInfos('Behrmann', 'CYL', 'A', '1910', 'behrmann', 'Walter Behrmann');
addInfos('Equirectangular', 'CYL', 'D', 'c.a. 120', 'rectang-0', 'Marinus of Tyre');
addInfos('Wagner 9', 'LENPAZ', 'M', '1949', 'wagner-9', 'Karlheinz Wagner', ...
    '', 'Aitoff-Wagner');
addInfos('Azimuthal equal-area', 'AZ', 'A', '1772', 'azimutal-equal-area-equator', 'Johann Heinrich Lambert', ...
    'Lambert azimuthal equal-area', '');
addInfos('Cassini', 'CYL', 'D', '1745', 'cassini-landscape', 'César-François Cassini de Thury', ...
    '', 'Cassini–Soldner');
addInfos('Eckert 6', 'PCY', 'A', '1906', 'eckert-6', 'Max Eckert-Greifendorff');
addInfos('McBT FPS', 'PCY', 'A', '1949', 'mcbryde-thomas-flat-polar-sinusoidal', 'Felix W. McBryde and Paul Thomas', ...
    'McBryde–Thomas flat-pole sinussoidal', 'McBryde-Thomas No. 3');
addInfos('Craster\u0027s parabolic', 'PCY', 'A', '1929', 'crasters-parabolic', 'John E. E. Craster', ...
    '', 'Putniņš P4 or Parabolic');
addInfos('Lambert cylindrical', 'CYL', 'A', '1772', 'lambert', 'Johann Heinrich Lambert');
addInfos('Goode homolosire', 'PCY', 'A', '1923', 'goode', 'John Paul Goode');
addInfos('Strebe 2016', 'PCO', 'A', '2016', '', 'Daniel "daan" Strebe');
addInfos('Gall-Peters', 'CYL', 'A', '1855 and 1967', 'gall-peters', 'James Gall and Arno Peters');
addInfos('APP 2012', 'POLYOCT', 'A', '2012', '', 'Daniela Roşca and Gerlind Plonka', ...
    'An Area Preserving Projection from the Regular Octahedron to the Sphere', '');
addInfos('Quartic authalic', 'PCY', 'A', '1937 and 1944', 'quartic-authalic', 'Karl Siemon and Oscar Adams', ...
    '', 'Adams Orthembadic or Siemon III');
addInfos('Winkel 1', 'PCY', 'M', '1921', 'winkel-1', 'Oswald Winkel');
addInfos('Boggs eumorphic', 'PCY', 'A', '1929', 'boggs-eumorphic-interrupted', 'Samuel Whittemore Boggs');
addInfos('Strebe 2018', 'MIS', 'A', '2018', '', 'Daniel "daan" Strebe');
addInfos('Sinusoidal', 'PCY', 'AD', 'c.a. 1600', 'sinusoidal', 'several authors', ...
    '', 'Sanson-Flamsteed or Mercator equal-area');
addInfos('Albers', 'CON', 'A', '1805', 'albers-equal-area-conic', 'Heinrich C. Albers', ...
    'Albers equal-area conic projection', '');
addInfos('Bottomley', 'PCO', 'A', '2003', 'bottomley', 'Henry Bottomley');
addInfos('Collignon', 'PCY', 'A', 'c.a. 1865', 'collignon', 'Édouard Collignon');
addInfos('Winkel 3', 'LENPAZ', 'M', '1921', 'winkel-tripel', 'Oswald Winkel', ...
    '', 'Winkel tripel');
addInfos('Werner', 'PCO', 'AD', 'c.a. 1500', 'stab-werner', 'Johannes Stabius', ...
    '', 'Stab-Werner');
addInfos('Strebe 1995', 'LENPAZ', 'A', '1994', 'strebe-1995', 'Daniel "daan" Strebe');
addInfos('Hobo-Dyer', 'CYL', 'A', '2002', 'hobo-dyer', 'Mick Dyer');
addInfos('McBT FPP', 'PCY', 'A', '1949', 'mcbryde-thomas-flat-polar-parabolic', 'Felix W. McBryde and Paul Thomas', ...
    'McBryde–Thomas flat-pole parabolic', 'McBryde-Thomas No. 5');
addInfos('Eckert 4', 'PCY', 'A', '1906', 'eckert-4', 'Max Eckert-Greifendorff');
addInfos('Eckert 5', 'PCY', 'M', '1906', 'eckert-5', 'Max Eckert-Greifendorff');
addInfos('NUG 2010', 'POLYHEMI', 'A', '2010', '', 'Daniela Roşca');
addInfos('Mercator', 'CYL', 'C', '1569', 'mercator-84', 'Gerardus Mercator', ...
    '', 'Wright');
addInfos('UTM/Gauss–Krüger', 'CYL', 'C', '1822', 'utm', 'Carl Friedrich Gauss and Johann Heinrich Louis Krüger');
addInfos('Plate Carrée', 'CYL', 'D', 'c.a. 120', 'rectang-0', 'Marinus of Tyre');
addInfos('Trans. Cylindrical', 'CYL', 'A', '', 'trans.cylind', '');
addInfos('Putniņš P2', 'PCY', 'A', '1934', 'putnins-p2', 'Reinholds V. Putnins');
addInfos('Putniņš P6', 'PCY', 'A', '1934', 'putnins-p6', 'Reinholds V. Putnins');
addInfos('Smyth', 'CYL', 'A', '1870', 'smyth', 'Charles Piazzi Smyth', ...
    '', 'Craster rectangular');
addInfos('Triston Edwards', 'CYL', 'A', '1953', 'trystan-edwards-snyder', 'Trystan Edwards');
addInfos('Balthasart', 'CYL', 'A', '1935', 'balthasart', 'M. Balthasart');
addInfos('Tobler', 'CYL', 'A', '1993', 'toblers-world-in-a-square', 'Waldo Tobler', ...
    'Tobler’s Equal-area World in a Square', '');
addInfos('Wagner 4', 'PCY', 'A', '1932', 'wagner-4', 'Karlheinz Wagner', ...
    '', 'Putniņš P2'' or Werenskiold III');

addInfos('Hatano', 'PCY', 'A', '1972', 'hatano', 'Masataka Hatano', ...
    'Hatano Asymmetric', '');
addInfos('Eckert 3', 'PCY', 'M', '1906', 'eckert-3', 'Max Eckert-Greifendorff');
addInfos('Kavrayskiy 1', 'CYL', 'M', '1933', 'kavraisky-1', 'Vladimir V. Kavraiskiy');
addInfos('Arden-Close', 'CYL', 'M', '1947', 'arden-close', 'Charles F. Arden-Close');
addInfos('Breusing', 'AZ', 'M', '1892', 'breusing-geometric-hemi-110w', 'Arthur Breusing');
addInfos('Stereographic', 'AZ', 'C', 'c.a. 200BC', 'stereographic-hemi-110w', 'Hipparchus of Nicaea and others');
addInfos('Jenny 2018', 'MIS', 'A', '2017', '', 'Bernhard Jenny and Bojan Šavrič');
addInfos('Tobler hyperelliptical', 'PCY', 'A', '1973', 'tobler', 'Waldo R. Tobler');
addInfos('Equal Earth', 'PCY', 'A', '2018', 'equalearth', 'Bojan Savric, Tom Patterson, Bernhard Jenny');
addInfos('Robinson', 'PCY', 'M', '1963', 'robinson', 'Arthur H. Robinson');
addInfos('SEA', 'POLY', 'A', '', '', '');
addInfos('SAND 2000', 'POLY', 'A', '', '', '');
addInfos('White 1992', 'POLY', 'A', '', '', '');
addInfos('Apian II', 'PCY', 'M', '1524', 'apian-ii', 'Peter Apian', ...
    '', 'Apian 2 Globular or Apianus II');
addInfos('Raisz Half-ellipsoidal', 'MIS', 'M', '1943', 'raisz-half-ellipsoidal-untilted', 'Erwin Raisz', ...
    'Raisz Half-ellipsoidal (untilted)', '');
addInfos('Wagner 8', 'LEN', 'M', '1949', 'wagner-8', 'Karlheinz Wagner');
addInfos('Atlantis', 'PCY', 'A', '1948', 'atlantis-landscape', 'John Bartholomew');
addInfos('Wagner 2', 'PCY', 'M', '1949', 'wagner-2', 'Karlheinz Wagner');
addInfos('Wagner 7', 'LEN', 'A', '1941', 'wagner-7', 'Karlheinz Wagner', ...
    '', 'Hammer-Wagner');
addInfos('Putniņš P5', 'PCY', 'M', '1934', 'putnins-p5', 'Reinholds V. Putnins');
addInfos('Wagner 5', 'PCY', 'M', '1949', 'wagner-5', 'Karlheinz Wagner');
addInfos('Wagner 1', 'PCY', 'A', '1932', 'wagner-1', 'Karlheinz Wagner', ...
    '', 'Kavraisky VI, Siemon II, or Werenskiold II');
addInfos('Putniņš P1', 'PCY', 'M', '1934', 'putnins-p1', 'Reinholds V. Putnins');
addInfos('Winkel 3 BOPC', 'LEN', 'M', '1921', 'winkel-tripel-bopc', 'Oswald Winkel', ...
    'Winkel Tripel BOPC', '');
addInfos('Putniņš P3', 'PCY', 'M', '1934', 'putnins-p3', 'Reinholds V. Putnins');
addInfos('Putniņš P3\u0027', 'PCY', 'M', '1934', 'putnins-p3z', 'Reinholds V. Putnins');
addInfos('Putniņš P4\u0027', 'PCY', 'A', '1934', 'putnins-p4z', 'Reinholds V. Putnins', ...
    '', 'Werenskiold I');
addInfos('Putniņš P5\u0027', 'PCY', 'M', '1934', 'putnins-p5z', 'Reinholds V. Putnins');
addInfos('Putniņš P6\u0027', 'PCY', 'A', '1934', 'putnins-p6z', 'Reinholds V. Putnins');
addInfos('Winkel 2', 'PCY', 'M', '1921', 'winkel-2', 'Oswald Winkel');
addInfos('McBryde P3', 'PCY', 'A', '1977', 'mcbryde-p3', 'F. Webster McBryde');
addInfos('McBryde Q3', 'PCY', 'A', '1977', 'mcbryde-q3', 'F. Webster McBryde');
addInfos('McBryde S2', 'PCY', 'A', '1977', 'mcbryde-s2', 'F. Webster McBryde');
addInfos('McBryde S3', 'PCY', 'A', '1977', 'mcbryde-s3', 'F. Webster McBryde');
addInfos('A4', 'LEN', 'M', '2008', 'a4-projection', 'BernhardJenny');
addInfos('Ciric I', 'LEN', 'M', '2010', 'ciric-1', 'Strahinja Ciric');
addInfos('Dedistort', 'LEN', 'M', '2013', 'dedistort', 'Kalinni Gorzkis');
addInfos('Winkel-Snyder', 'MIS', 'M', '', 'WinkelSnyder', '');  % not sure
addInfos('Mayr', 'PCY', 'A', '1964', 'Mayr', 'Franz Mayr');
addInfos('Foucaut Sinusoidal', 'PCY', 'A', '', 'FoucautSinusoidal', '', ...
    '', 'Tobler Foucaut');
addInfos('Bacon Globular', 'MIS', 'M', '1265', 'bacon-global', 'Roger Bacon', ...
    '', 'Bacon');
addInfos('Eckert 1', 'PCY', 'M', '1906', 'eckert-1', 'Max Eckert-Greifendorff');
addInfos('Eckert 2', 'PCY', 'A', '1906', 'eckert-2', 'Max Eckert-Greifendorff');
addInfos('Ortelius Oval', 'MIS', 'M', '1570', 'ortelius-oval', 'Abraham Ortelius');
addInfos('Apian Globular I', 'MIS', 'M', '1524', '', 'Peter Apian', ...
    '', 'Apianus Globular I');
addInfos('Wagner 3', 'PCY', 'M', '1932', 'wagner-3', 'Karlheinz Wagner');

addInfos('Loximuthal', 'PCY', 'M', '1935 and 1966', '', 'Karl Siemon, Wegtreue Ortskurskarte and Waldo R. Tobler', ...
    '', 'Siemon I');
addInfos('Siemon IV', 'PCY', 'A', '1937', 'Siemon4', 'Karl Siemon');

addInfos('Natural Earth', 'PCY', 'M', '2011', 'natural-earth', 'Tom Patterson');
addInfos('Kavrayskiy 5', 'PCY', 'A', '1933', 'kavraisky-5', 'Vladimir V. Kavraiskiy');
addInfos('Foucaut', 'PCY', 'A', '1862', '', 'De Prépetit Foucaut', ...
    '', 'Foucaut Stereographic Equivalent');
addInfos('Briesemeister', 'LEN', 'A', '1953', 'briesemeister-v2', 'William A. Briesemeister');


disp('actual nodes count:');
disp(ncnt);

cat = 'normal';
addCategory('Mercator', cat);
addCategory('Plate Carrée', cat);
addCategory('Equirectangular', cat);
addCategory('Lambert cylindrical', cat);
addCategory('Mollweide', cat);
addCategory('Hammer', cat);

cat = 'transverse';
addCategory('UTM/Gauss–Krüger', cat);
addCategory('Trans. Cylindrical', cat);
addCategory('Cassini', cat);

cat = 'oblique';
addCategory('Atlantis', cat);
addCategory('Briesemeister', cat);

cat = '2:1 ellipse';
addCategory('Aitoff', cat);
addCategory('Hammer', cat);
addCategory('Mollweide', cat);
addCategory('Apian II', cat);
addCategory('Raisz Half-ellipsoidal', cat);

cat = 'same shape gpm,c';
addCategory('Wagner 1', cat);
addCategory('Wagner 2', cat);
addCategory('Wagner 3', cat);

cat = 'same shape gpg-m';
addCategory('Eckert 1', cat);
addCategory('Eckert 2', cat);

cat = 'same shape gpb-m';
addCategory('Eckert 3', cat);
addCategory('Eckert 4', cat);
addCategory('Ortelius Oval', cat);

cat = 'same shape gpb,m';
addCategory('Eckert 5', cat);
addCategory('Eckert 6', cat);

cat = 'same shape gpg-b';
addCategory('Wagner 7', cat);
addCategory('Wagner 8', cat);

cat = 'same shape gpg,b';
addCategory('Putniņš P1', cat);
addCategory('Putniņš P2', cat);

cat = 'same shape gpb,g';
addCategory('Putniņš P3', cat);
addCategory('Craster\u0027s parabolic', cat);

cat = 'same shape gpg,m';
addCategory('Putniņš P5', cat);
addCategory('Putniņš P6', cat);

cat = 'same shape gpc-m';
addCategory('Bacon Globular', cat);
addCategory('Apian Globular I', cat);

cat = 'same shape gpm,b';
addCategory('Wagner 4', cat);
addCategory('Wagner 5', cat);
addCategory('Wagner 6', cat);
% addCategory('Winkel 3 BOPC', cat);

cat = 'same shape gpm-g';
addCategory('Putniņš P3\u0027', cat);
addCategory('Putniņš P4\u0027', cat);

cat = 'same shape gpb-g';
addCategory('Putniņš P5\u0027', cat);
addCategory('Putniņš P6\u0027', cat);

cat = '(may be) interrupted';
addCategory('Goode homolosire', cat);
addCategory('Boggs eumorphic', cat);
addCategory('McBT FPP', cat);
addCategory('McBT FPQ', cat);
addCategory('McBT FPS', cat);
addCategory('Quartic authalic', cat);
addCategory('Sinusoidal', cat);
addCategory('McBryde P3', cat);
addCategory('McBryde Q3', cat);
addCategory('McBryde S2', cat);
addCategory('McBryde S3', cat);
addCategory('Mollweide', cat);
addCategory('Siemon IV', cat);

cat = 'Bonne group';
addCategory('Bonne', cat);
addCategory('Sinusoidal', cat);
addCategory('Werner', cat);
addCategory('Bottomley', cat);

cat = 'Hufnagel''s family';
addCategory('Mollweide', cat);
addCategory('Eckert 4', cat);
addCategory('Wagner 4', cat);
addCategory('Lambert cylindrical', cat);
addCategory('Behrmann', cat);
addCategory('Smyth', cat);
addCategory('Triston Edwards', cat);
addCategory('Hobo-Dyer', cat);
addCategory('Gall-Peters', cat);
addCategory('Balthasart', cat);
addCategory('Tobler', cat);

cat = 'stretching';
addCategory('Kavrayskiy 7', cat);
addCategory('Wagner 6', cat);
addCategory('Lambert cylindrical', cat);
addCategory('Behrmann', cat);
addCategory('Smyth', cat);
addCategory('Triston Edwards', cat);
addCategory('Hobo-Dyer', cat);
addCategory('Gall-Peters', cat);
addCategory('Balthasart', cat);
addCategory('Tobler', cat);

cat = 'cylindrical equal-area family';
addCategory('Lambert cylindrical', cat);
addCategory('Behrmann', cat);
addCategory('Smyth', cat);
addCategory('Triston Edwards', cat);
addCategory('Hobo-Dyer', cat);
addCategory('Gall-Peters', cat);
addCategory('Balthasart', cat);
addCategory('Tobler', cat);

cat = 'Tobler hyperelliptical family';
addCategory('Mollweide', cat);
addCategory('Collignon', cat);
addCategory('Tobler hyperelliptical', cat);

cat = 'elliptical';
addCategory('Mollweide', cat);
addCategory('Eckert 4', cat);
addCategory('Wagner 4', cat);
addCategory('Wagner 6', cat);
addCategory('Hatano', cat);
addCategory('Eckert 3', cat);
addCategory('Putniņš P1', cat);
addCategory('Putniņš P2', cat);
addCategory('Wagner 5', cat);
addCategory('Winkel 2', cat);
addCategory('Apian II', cat);
addCategory('Kavrayskiy 7', cat);

cat = 'sinusoidal';
addCategory('Sinusoidal', cat);
addCategory('Eckert 6', cat);
addCategory('Eckert 5', cat);
addCategory('Winkel 1', cat);
addCategory('McBT FPS', cat);

cat = 'quartic';
addCategory('McBT FPQ', cat);
addCategory('Quartic authalic', cat);

cat = 'parabolic';
addCategory('McBT FPP', cat);
addCategory('Craster\u0027s parabolic', cat);
addCategory('Putniņš P3', cat);
addCategory('Putniņš P4\u0027', cat);
addCategory('Putniņš P3\u0027', cat);

cat = 'hyperbolic';
addCategory('Putniņš P5', cat);
addCategory('Putniņš P6', cat);
% addCategory('Putniņš P5\u0027', cat);
% addCategory('Putniņš P6\u0027', cat);

cat = 'evenly spaced';
addCategory('Kavrayskiy 7', cat);
addCategory('Wagner 1', cat);
addCategory('Wagner 6', cat);
addCategory('Sinusoidal', cat);
addCategory('Eckert 5', cat);
addCategory('Winkel 1', cat);
addCategory('Eckert 6', cat);
addCategory('Eckert 3', cat);
addCategory('Putniņš P5', cat);
% addCategory('Eckert 1', cat);

cat = 'as straight lines';
addCategory('A4', cat);
addCategory('Ciric I', cat);
addCategory('Dedistort', cat);
addCategory('Eckert 1', cat);
addCategory('Eckert 2', cat);
addCategory('Eckert 3', cat);
addCategory('Eckert 4', cat);
addCategory('Eckert 5', cat);
addCategory('Eckert 6', cat);
addCategory('Equal Earth', cat);
addCategory('Hatano', cat);
addCategory('Kavrayskiy 7', cat);
addCategory('McBryde P3', cat);
addCategory('McBryde Q3', cat);
addCategory('McBryde S2', cat);
addCategory('McBryde S3', cat);
addCategory('McBT FPQ', cat);
addCategory('McBT FPS', cat);
addCategory('McBT FPP', cat);
addCategory('Natural Earth', cat);
addCategory('Ortelius Oval', cat);
addCategory('Putniņš P3\u0027', cat);
addCategory('Putniņš P4\u0027', cat);
addCategory('Putniņš P5\u0027', cat);
addCategory('Putniņš P6\u0027', cat);
addCategory('Robinson', cat);
addCategory('Wagner 1', cat);
addCategory('Wagner 2', cat);
addCategory('Wagner 3', cat);
addCategory('Wagner 4', cat);
addCategory('Wagner 5', cat);
addCategory('Wagner 6', cat);
addCategory('Winkel 1', cat);
addCategory('Winkel 2', cat);
addCategory('Winkel 3', cat);
addCategory('Winkel 3 BOPC', cat);

cat = 'as points';
addCategory('Aitoff', cat);
addCategory('Apian II', cat);
addCategory('Boggs eumorphic', cat);
addCategory('Bonne', cat);
addCategory('Bottomley', cat);
addCategory('Craster\u0027s parabolic', cat);  %craster
addCategory('Foucaut', cat);     %stereo
addCategory('Goode homolosire', cat);
addCategory('Hammer', cat);   %may Hammer
addCategory('Kavrayskiy 5', cat);
addCategory('Mayr', cat);
addCategory('Mollweide', cat);
addCategory('Putniņš P1', cat);
addCategory('Putniņš P2', cat);
addCategory('Putniņš P3', cat);
addCategory('Putniņš P5', cat);
addCategory('Putniņš P6', cat);
addCategory('Quartic authalic', cat);
addCategory('Raisz Half-ellipsoidal', cat);
addCategory('Sinusoidal', cat);
addCategory('Werner', cat);

cat = 'fusion';
addCategory('Goode homolosire', cat);
addCategory('HEALPix', cat);
addCategory('Kavrayskiy 1', cat);
addCategory('McBryde P3', cat);
addCategory('McBryde Q3', cat);
addCategory('McBryde S2', cat);
addCategory('McBryde S3', cat);

cat = 'fusion-src';
addCategory('Sinusoidal', cat);
addCategory('Mollweide', cat);
addCategory('Lambert cylindrical', cat);
addCategory('Collignon', cat);
addCategory('Mercator', cat);
addCategory('Equirectangular', cat);
addCategory('Craster\u0027s parabolic', cat);
addCategory('McBT FPP', cat);
addCategory('McBT FPQ', cat);
addCategory('McBT FPS', cat);
addCategory('Quartic authalic', cat);

cat = 'blending';
addCategory('Dedistort', cat);
addCategory('Foucaut Sinusoidal', cat);
addCategory('Winkel 1', cat);
addCategory('Winkel 2', cat);
addCategory('Winkel 3', cat);
addCategory('Winkel-Snyder', cat);
addCategory('Boggs eumorphic', cat);
addCategory('Wagner 6', cat);
addCategory('Putniņš P3\u0027', cat);
addCategory('Mayr', cat);
addCategory('Arden-Close', cat);
addCategory('Breusing', cat);
addCategory('Strebe 2016', cat);
addCategory('Strebe 2018', cat);
addCategory('Jenny 2018', cat);

cat = 'blending-src';
addCategory('Sinusoidal', cat);
addCategory('Lambert cylindrical', cat);
addCategory('A4', cat);
addCategory('Ciric I', cat);
addCategory('Equirectangular', cat);
addCategory('Apian II', cat);
addCategory('Aitoff', cat);
addCategory('Mollweide', cat);
addCategory('Putniņš P1', cat);
addCategory('Putniņš P3', cat);
addCategory('Plate Carrée', cat);
addCategory('Mercator', cat);
addCategory('Stereographic', cat);

cat = 'construction';
addCategory('Hammer', cat);
addCategory('Aitoff', cat);
addCategory('Strebe 1995', cat);

addCategory('Azimuthal equal-area', 'Hammer');
addCategory('Azimuthal equidistant', 'Aitoff');

cat = 'const-src';
addCategory('Azimuthal equal-area', cat);
addCategory('Azimuthal equidistant', cat);
addCategory('Eckert 4', cat);
addCategory('Mollweide', cat);
addCategory('Hammer', cat);

cat = 'Eckert';
addCategory('Eckert 1', cat);
addCategory('Eckert 2', cat);
addCategory('Eckert 3', cat);
addCategory('Eckert 4', cat);
addCategory('Eckert 5', cat);
addCategory('Eckert 6', cat);

cat = 'Kavrayskiy';
addCategory('Kavrayskiy 1', cat);
addCategory('Kavrayskiy 5', cat);
addCategory('Kavrayskiy 7', cat);

cat = 'Lambert';

addCategory('Lambert cylindrical', cat);
addCategory('Azimuthal equal-area', cat);

cat = 'McBryde or McBT';
addCategory('McBT FPP', cat);
addCategory('McBT FPQ', cat);
addCategory('McBT FPS', cat);
addCategory('McBryde P3', cat);
addCategory('McBryde Q3', cat);
addCategory('McBryde S2', cat);
addCategory('McBryde S3', cat);

cat = 'Putniņš';
addCategory('Putniņš P1', cat);
addCategory('Putniņš P2', cat);
addCategory('Putniņš P3', cat);
addCategory('Craster\u0027s parabolic', cat);
addCategory('Putniņš P5', cat);
addCategory('Putniņš P6', cat);
addCategory('Wagner 4', cat);
addCategory('Wagner 6', cat);
addCategory('Putniņš P3\u0027', cat);
addCategory('Putniņš P4\u0027', cat);
addCategory('Putniņš P5\u0027', cat);
addCategory('Putniņš P6\u0027', cat);

cat = 'Siemon';
addCategory('Wagner 1', cat);
addCategory('Quartic authalic', cat);
addCategory('Loximuthal', cat);
addCategory('Siemon IV', cat);

cat = 'Strebe';
addCategory('Strebe 1995', cat);
addCategory('Strebe 2016', cat);
addCategory('Strebe 2018', cat);

cat = 'Tobler';
addCategory('Tobler hyperelliptical', cat);
addCategory('Tobler', cat);

cat = 'Wagner';
addCategory('Wagner 1', cat);
addCategory('Wagner 2', cat);
addCategory('Wagner 3', cat);
addCategory('Wagner 4', cat);
addCategory('Wagner 5', cat);
addCategory('Wagner 6', cat);
addCategory('Wagner 7', cat);
addCategory('Wagner 8', cat);
addCategory('Wagner 9', cat);

cat = 'Werenskiold';
addCategory('Wagner 1', cat);
addCategory('Wagner 4', cat);

cat = 'Winkel';
addCategory('Winkel 1', cat);
addCategory('Winkel 2', cat);
addCategory('Winkel 3', cat);
addCategory('Winkel 3 BOPC', cat);
addCategory('Winkel-Snyder', cat);


addRelation('Sinusoidal', 'Bonne', '<b>Sinusoidal projection</b> is a special case of <b>Bonne projection</b> where its standard parallel is 0&deg;, while standard parallel of Bonne projection is arbitrary (typically is 45&deg;N).');
addRelation('Werner', 'Bonne', '<b>Werner projection</b> is a special case of <b>Bonne projection</b> where its standard parallel is 90&deg;N, while standard parallel of Bonne projection is arbitrary (typically is 45&deg;N).');
addRelation('Bottomley', 'Bonne', '<b>Bottomley projection</b> is a special case of <b>Bonne projection</b> where its standard parallel is 30&deg;N, while standard parallel of Bonne projection is arbitrary (typically is 45&deg;N).');
addRelation('Strebe 2016', 'Bonne', '<b>Strebe 2016</b> is a blending of <b>Bonne projection</b> and Albers equal-area conic projection.');
addRelation('Strebe 2016', 'Albers', '<b>Strebe 2016</b> is a blending of Bonne projection and <b>Albers equal-area conic projection</b>.');
addRelation('Strebe 2018', 'Albers', '<b>Strebe 2018</b> is a blending of Azimuthal equal-area projection and <b>Albers equal-area conic projection</b>.');
addRelation('Strebe 2018', 'Azimuthal equal-area', '<b>Strebe 2018</b> is a blending of <b>Azimuthal equal-area projection</b> and Albers equal-area conic projection.');
addRelation('Goode homolosire', 'Sinusoidal', '<b>Goode homolosire projection</b> is a blending of <b>Sinusoidal projection</b> (less than 40°44′11.8″N/S) and Mollweide projection (in elsewhere).');
addRelation('Goode homolosire', 'Mollweide', '<b>Goode homolosire projection</b> is a blending of Sinusoidal projection (less than 40°44′11.8″N/S) and <b>Mollweide projection</b> (in elsewhere).');
addRelation('Goode homolosire', 'Boggs eumorphic', '<b>Goode homolosire projection</b> and <b>Boggs eumorphic projection</b> have interruptted forms in typical case.');
addRelation('Boggs eumorphic', 'Sinusoidal', '<b>Boggs eumorphic projection</b> averages the y-coordinates of <b>Sinusoidal projection</b> and Mollweide projection.');
addRelation('Boggs eumorphic', 'Mollweide', '<b>Boggs eumorphic projection</b> averages the y-coordinates of Sinusoidal projection and <b>Mollweide projection</b>.');
addRelation('Wagner 7', 'Wagner 8', '<b>Wagner VII projection</b> and <b>Wagner VIII projection</b> have the same shape.');
addRelation('Putniņš P3\u0027', 'Putniņš P4\u0027', '<b>Putniņš P3'' projection</b> and <b>Putniņš P4'' projection</b> have the same shape.');
addRelation('Putniņš P1', 'Putniņš P2', '<b>Putniņš P1 projection</b> and <b>Putniņš P2 projection</b> have the same shape.');
addRelation('Putniņš P5', 'Putniņš P6', '<b>Putniņš P5 projection</b> and <b>Putniņš P6 projection</b> have the same shape.');
addRelation('Lambert cylindrical', 'Behrmann', 'standard parallel and aspect ratio of <b>Behrmann projection</b> is 30&deg; and c.a. 2.36, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Smyth', 'standard parallel and aspect ratio of <b>Smyth projection</b> is 37.07&deg; and 2, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Triston Edwards', 'standard parallel and aspect ratio of <b>Triston Edwards projection</b> is 37.4&deg; and c.a. 1.98, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Hobo-Dyer', 'standard parallel and aspect ratio of <b>Hobo-Dyer projection</b> is 37.5&deg; and c.a. 1.98, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Gall-Peters', 'standard parallel and aspect ratio of <b>Gall-Peters projection</b> is 45&deg; and &pi;/2, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Balthasart', 'standard parallel and aspect ratio of <b>Balthasart projection</b> is 50&deg; and c.a. 1.30, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Tobler', 'standard parallel and aspect ratio of <b>Tobler projection</b> is 55.65&deg; and c.a. 1, while 0&deg; and &pi; for <b>Lambert cylindrical equal-area projection</b>');
addRelation('Lambert cylindrical', 'Arden-Close', '<b>Arden-Close projection</b> is a blending of Mercator projection and <b>Lambert cylindrical equal-area projection</b>.');
addRelation('Mercator', 'Arden-Close', '<b>Arden-Close projection</b> is a blending of <b>Mercator projection</b> and Lambert cylindrical equal-area projection.');
addRelation('Wagner 6', 'Kavrayskiy 7', '<b>Wagner VI projection</b> is equivalent to <b>Kavrayskiy VII projection</b> vertically compressed by a factor of &radic;3/2.');
addRelation('HEALPix', 'Lambert cylindrical', '<b>HEALPix</b> is hybrid of Collignon projection and <b>Lambert cylindrical equal-area projection</b>.');
addRelation('HEALPix', 'Collignon', '<b>HEALPix</b> is hybrid of <b>Collignon projection</b> and Lambert cylindrical equal-area projection.');

addRelation('Mollweide', 'Aitoff', 'Hammer projection, <b>Aitoff projection</b>, <b>Mollweide projection</b>, Apian II projection and Raisz Half-ellipsoidal (untilted) projection have a shape of 2:1 ellipse.');
addRelation('Mollweide', 'Hammer', '<b>Hammer projection</b>, Aitoff projection, <b>Mollweide projection</b>, Apian II projection and Raisz Half-ellipsoidal (untilted) projection have a shape of 2:1 ellipse.');
addRelation('Mollweide', 'Apian II', 'Hammer projection, Aitoff projection, <b>Mollweide projection</b>, <b>Apian II projection</b> and Raisz Half-ellipsoidal (untilted) projection have a shape of 2:1 ellipse.');
addRelation('Mollweide', 'Raisz Half-ellipsoidal', 'Hammer projection, Aitoff projection, <b>Mollweide projection</b>, Apian II projection and <b>Raisz Half-ellipsoidal (untilted) projection</b> have a shape of 2:1 ellipse.');

addRelation('Hammer', 'Strebe 1995', '<b>Strebe 1995</b> is constructed by using Eckert IV projection, Mollweide projection and <b>Hammer-Aitoff projection</b>.');
addRelation('Mollweide', 'Strebe 1995', '<b>Strebe 1995</b> is constructed by using Eckert IV projection, <b>Mollweide projection</b> and Hammer-Aitoff projection.');
addRelation('Eckert 4', 'Strebe 1995', '<b>Strebe 1995</b> is constructed by using <b>Eckert IV projection</b>, Mollweide projection and Hammer-Aitoff projection.');

addRelation('Azimuthal equal-area', 'Hammer', '<b>Hammer projection</b> is constructed based on the equatorial form of <b>Lambert azimuthal equal-area projection</b>');

addRelation('Azimuthal equidistant', 'Aitoff', '<b>Aitoff projection</b> is constructed based on the equatorial form of <b>azimuthal equidistant projection</b>');
addRelation('Kavrayskiy 1', 'Equirectangular', '<b>Kavrayskyi I projection</b> combines Mercator projection and <b>Equirectangular projection</b>.');
addRelation('Kavrayskiy 1', 'Mercator', '<b>Kavrayskyi I projection</b> combines <b>Mercator projection</b> and Equirectangular projection.');
addRelation('Breusing', 'Stereographic', '<b>Breusing projection</b> uses a geometric means of the radii of <b>Stereographic projection</b> and Azimuthal equal-area projection.');
addRelation('Breusing', 'Azimuthal equal-area', '<b>Breusing projection</b> uses a geometric means of the radii of Stereographic projection and <b>Azimuthal equal-area projection</b>.');
addRelation('Putniņš P1', 'Wagner 6', '<b>Wagner 6 (Putniņš P1'') projection</b> is a blending of Plate Carrée projection and <b>Putniņš P1 projection</b>.');
addRelation('Wagner 6', 'Plate Carrée', '<b>Wagner 6 (Putniņš P1'') projection</b> is a blending of <b>Plate Carrée projection</b> and Putniņš P1 projection.');
addRelation('Putniņš P3', 'Putniņš P3\u0027', '<b>Putniņš P3'' projection</b> is a blending of Plate Carrée projection and <b>Putniņš P3 projection</b>.');
addRelation('Putniņš P3\u0027', 'Plate Carrée', '<b>Putniņš P3'' projection</b> is a blending of <b>Plate Carrée projection</b> and Putniņš P3 projection.');


addRelation('Atlantis', 'Mollweide', '<b>Atlantis projection</b> is a oblique version of <b>Mollweide projection</b>.');

addRelation('UTM/Gauss–Krüger', 'Mercator', '<b>Gauss–Krüger projection</b> is a transverse form of <b>Mercator projection</b>.');
addRelation('Trans. Cylindrical', 'Lambert cylindrical', '<b>Trans. Cylindrical</b> is a transverse form of <b>Lambert cylindrical projection</b>.');

addRelation('McBT FPQ', 'Quartic authalic', 'Meridians of <b>McBryde–Thomas flat-pole quartic projection</b> and <b>Quartic authalic projection</b> are fourth-order curves.');
addRelation('McBT FPP', 'Craster\u0027s parabolic', 'Meridians of <b>McBryde–Thomas flat-pole parabolic projection</b> and <b>Putniņš P4 projection</b> are parabolas.');

addRelation('McBT FPS', 'Sinusoidal', 'Meridians of <b>Sinusoidal projection</b>, McBryde–Thomas flat-pole sinusoidal projection, Eckert V projection, Eckert VI projection and Winkel I projection are sinusoids.');
addRelation('Eckert 6', 'Sinusoidal', 'Meridians of <b>Sinusoidal projection</b>, McBryde–Thomas flat-pole sinusoidal projection, Eckert V projection, <b>Eckert VI projection</b> and Winkel I projection are sinusoids.');

addRelation('Winkel 1', 'Sinusoidal', '<b>Winkel I projection</b> uses arithmetic mean of <b>Sinusoidal projection</b> and Equirectangular projection with standard parallels at 50°28′N/S. <hr> Meridians of <b>Sinusoidal projection</b>, McBryde–Thomas flat-pole sinusoidal projection, Eckert V projection, Eckert VI projection and <b>Winkel I projection</b> are sinusoids.');
addRelation('Winkel 1', 'Equirectangular', '<b>Winkel I projection</b> uses arithmetic mean of Sinusoidal projection and <b>Equirectangular projection</b> with standard parallels at 50°28′N/S.');

addRelation('Eckert 5', 'Sinusoidal', '<b>Eckert V projection</b> combines <b>Sinusoidal projection</b> and Plate Carrée projection. <hr> Meridians of <b>Sinusoidal projection</b>, McBryde–Thomas flat-pole sinusoidal projection, <b>Eckert V projection</b>, Eckert VI projection and Winkel I projection are sinusoids.');
addRelation('Eckert 5', 'Plate Carrée', '<b>Eckert V projection</b> combines Sinusoidal projection and <b>Plate Carrée projection</b>.');
addRelation('Eckert 5', 'Winkel 1', '<b>Eckert V projection</b> is similar to <b>Winkel I projection</b> where it uses Plate Carrée projection (standard parallels at equator), <b>Winkel I projection</b> uses Equirectangular projection with standard parallels at 50°28′N/S.');

addRelation('Winkel 2', 'Equirectangular', '<b>Winkel II projection</b> uses arithmetic mean of <b>Equirectangular projection</b> and Apian II projection.');
addRelation('Winkel 2', 'Apian II', '<b>Winkel II projection</b> uses arithmetic mean of Equirectangular projection and <b>Apian II projection</b>.');
addRelation('Winkel 3', 'Equirectangular', '<b>Winkel tripel projection</b> uses arithmetic mean of Aitoff projection and <b>Equirectangular projection</b> with standard parallels at 50°28′N/S.');
addRelation('Winkel 3', 'Aitoff', '<b>Winkel tripel projection</b> uses arithmetic mean of <b>Aitoff projection</b> and Equirectangular projection with standard parallels at 50°28′N/S.');

addRelation('Winkel-Snyder', 'Equirectangular', '<b>Winkel II projection</b> uses arithmetic mean of <b>Equirectangular projection</b> and Mollweide projection.');
addRelation('Winkel-Snyder', 'Mollweide', '<b>Winkel II projection</b> uses arithmetic mean of Equirectangular projection and <b>Mollweide projection</b>.');

addRelation('Mollweide', 'Eckert 4', '<b>Mollweide projection</b>, Wagner 4 projection, Eckert 3 projection, <b>Eckert 4 projection</b> and Hatano Asymmetric projection have elliptical forms of meridians.');
addRelation('Mollweide', 'Eckert 3', '<b>Mollweide projection</b>, Wagner 4 projection, <b>Eckert 3 projection</b>, Eckert 4 projection and Hatano Asymmetric projection have elliptical forms of meridians.');
addRelation('Mollweide', 'Hatano', '<b>Mollweide projection</b>, Wagner 4 projection, Eckert 3 projection, Eckert 4 projection and <b>Hatano Asymmetric projection</b> have elliptical forms of meridians.');
addRelation('Mollweide', 'Wagner 4', '<b>Mollweide projection</b>, <b>Wagner 4 projection</b>, Eckert 3 projection, Eckert 4 projection and Hatano Asymmetric projection have elliptical forms of meridians.');

addRelation('Wagner 4', 'Wagner 5', '<b>Wagner IV projection</b>, <b>Wagner V projection</b>, Wagner VI projection and Winkel III BOPC projection have the same shape.');
addRelation('Wagner 4', 'Wagner 6', '<b>Wagner IV projection</b>, Wagner V projection, <b>Wagner VI projection</b> and Winkel III BOPC projection have the same shape.');
addRelation('Wagner 5', 'Wagner 6', 'Wagner IV projection, <b>Wagner V projection</b>, <b>Wagner VI projection</b> and Winkel III BOPC projection have the same shape.');
addRelation('Wagner 4', 'Winkel 3 BOPC', '<b>Wagner IV projection</b>, Wagner V projection, Wagner VI projection and <b>Winkel III BOPC projection</b> have the same shape.');
addRelation('Wagner 5', 'Winkel 3 BOPC', 'Wagner IV projection, <b>Wagner V projection</b>, Wagner VI projection and <b>Winkel III BOPC projection</b> have the same shape.');
addRelation('Wagner 6', 'Winkel 3 BOPC', 'Wagner IV projection, Wagner V projection, <b>Wagner VI projection</b> and <b>Winkel III BOPC projection</b> have the same shape.');

addRelation('Cassini', 'Plate Carrée', '<b>Cassini projection</b> is the transverse form of <b>Plate carrée projection</b>.');
addRelation('Equal Earth', 'Robinson', '<b>Equal Earth</b> is inspired by <b>Robinson projection</b>.');
addRelation('Equirectangular', 'Plate Carrée', '<b>Plate Carrée projection</b> is a special case of <b>Equirectangular projection</b> which uses equator as standard parallel.');
addRelation('McBryde P3', 'Craster\u0027s parabolic', '<b>McBryde P3</b> is a fusion of McBT FPP and <b>Craster''s parabolic</b>.');
addRelation('McBryde P3', 'McBT FPP', '<b>McBryde P3</b> is a fusion of <b>McBT FPP</b> and Craster''s parabolic.');
addRelation('McBryde Q3', 'Quartic authalic', '<b>McBryde Q3</b> is a fusion of McBT FPQ and <b>Quartic authalic</b>.');
addRelation('McBryde Q3', 'McBT FPQ', '<b>McBryde Q3</b> is a fusion of <b>McBT FPQ</b> and Quartic authalic.');
addRelation('McBryde S2', 'Sinusoidal', '<b>McBryde S2</b> is a fusion of <b>Sinusoidal</b> and Eckert 6.');
addRelation('McBryde S2', 'Eckert 6', '<b>McBryde S2</b> is a fusion of Sinusoidal and <b>Eckert 6</b>.');
addRelation('McBryde S3', 'Sinusoidal', '<b>McBryde S3</b> is a fusion of <b>Sinusoidal</b> and McBT FPS.');
addRelation('McBryde S3', 'McBT FPS', '<b>McBryde S3</b> is a fusion of Sinusoidal and <b>McBT FPS</b>.');
addRelation('A4', 'Dedistort', '<b>Dedistort</b> is a blending of <b>A4</b> and Ciric I.');
addRelation('Ciric I', 'Dedistort', '<b>Dedistort</b> is a blending of A4 and <b>Ciric I</b>.');
addRelation('Sinusoidal', 'Foucaut Sinusoidal', '<b>Foucaut Sinusoidal</b> is a blending of <b>Sinusoidal</b> and Lambert cylindrical.');
addRelation('Lambert cylindrical', 'Foucaut Sinusoidal', '<b>Foucaut Sinusoidal</b> is a blending of Sinusoidal and <b>Lambert cylindrical</b>.');
addRelation('Sinusoidal', 'Mayr', '<b>Mayr</b> is a blending of <b>Sinusoidal</b> and Lambert cylindrical.');
addRelation('Lambert cylindrical', 'Mayr', '<b>Mayr</b> is a blending of Sinusoidal and <b>Lambert cylindrical</b>.');
addRelation('SEA', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>SEA</b>.');
addRelation('APP 2012', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>APP 2012</b>.');
addRelation('White 1992', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>White 1992</b>.');
addRelation('NUG 2010', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>NUG 2010</b>.');
addRelation('USG 2011', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>USG 2011</b>.');
addRelation('SAND 2000', 'Azimuthal equal-area', '<b>Azimuthal equal-area</b> is employed in the construction of <b>SAND 2000</b>.');
addRelation('Eckert 1', 'Eckert 2', '<b>Eckert 1</b> and <b>Eckert 2</b> have the same shape.');
addRelation('Eckert 5', 'Eckert 6', '<b>Eckert 5</b> and <b>Eckert 6</b> have the same shape.');
addRelation('Putniņš P3', 'Craster\u0027s parabolic', '<b>Putniņš P3</b> and <b>Craster''s parabolic</b> have the same shape.');
addRelation('Apian Globular I', 'Bacon Globular', '<b>Apian Globular I</b> and <b>Bacon Globular</b> have the same shape.');
addRelation('Putniņš P5\u0027', 'Putniņš P6\u0027', '<b>Putniņš P5''</b> and <b>Putniņš P6''</b> have the same shape.');
addRelation('Eckert 3', 'Eckert 4', '<b>Eckert 3</b>, <b>Eckert 4</b> and Ortelius Oval have the same shape.');
addRelation('Eckert 3', 'Ortelius Oval', '<b>Eckert 3</b>, Eckert 4 and <b>Ortelius Oval</b> have the same shape.');
addRelation('Eckert 4', 'Ortelius Oval', 'Eckert 3, <b>Eckert 4</b> and <b>Ortelius Oval</b> have the same shape.');
addRelation('Wagner 1', 'Wagner 2', '<b>Wagner 1</b>, <b>Wagner 2</b> and Wagner 3 have the same shape.');
addRelation('Wagner 1', 'Wagner 3', '<b>Wagner 1</b>, Wagner 2 and <b>Wagner 3</b> have the same shape.');
addRelation('Wagner 2', 'Wagner 3', 'Wagner 1, <b>Wagner 2</b> and <b>Wagner 3</b> have the same shape.');

addRelation('Boggs eumorphic', 'Putniņš P1', '<b>Boggs eumorphic</b> and <b>Putniņš P1</b> have similar shape.');
addRelation('Boggs eumorphic', 'Putniņš P2', '<b>Boggs eumorphic</b> and <b>Putniņš P2</b> have similar shape.');
addRelation('Siemon IV', 'Putniņš P1', '<b>Siemon IV</b> and <b>Putniņš P1</b> have similar shape.');
addRelation('Siemon IV', 'Putniņš P2', '<b>Siemon IV</b> and <b>Putniņš P2</b> have similar shape.');
addRelation('Boggs eumorphic', 'Siemon IV', '<b>Boggs eumorphic</b> and <b>Siemon IV</b> have similar shape.');
addRelation('Putniņš P3\u0027', 'Wagner 1', '<b>Putniņš P3\u0027</b> and <b>Wagner 1</b> have similar shape.');
addRelation('Putniņš P3\u0027', 'Wagner 2', '<b>Putniņš P3\u0027</b> and <b>Wagner 2</b> have similar shape.');
addRelation('Putniņš P3\u0027', 'Wagner 3', '<b>Putniņš P3\u0027</b> and <b>Wagner 3</b> have similar shape.');
addRelation('Putniņš P4\u0027', 'Wagner 1', '<b>Putniņš P4\u0027</b> and <b>Wagner 1</b> have similar shape.');
addRelation('Putniņš P4\u0027', 'Wagner 2', '<b>Putniņš P4\u0027</b> and <b>Wagner 2</b> have similar shape.');
addRelation('Putniņš P4\u0027', 'Wagner 3', '<b>Putniņš P4\u0027</b> and <b>Wagner 3</b> have similar shape.');
addRelation('Quartic authalic', 'Siemon IV', '<b>Siemon IV</b> is a variant of <b>Quartic authalic</b>.');
addRelation('Trans. Cylindrical', 'Jenny 2018', '<b>Jenny 2018</b> is a blending of Azimuthal equal-area and <b>Trans. Cylindrical</b>.');
addRelation('Azimuthal equal-area', 'Jenny 2018', '<b>Jenny 2018</b> is a blending of <b>Azimuthal equal-area</b> and Trans. Cylindrical.');
addRelation('Tobler hyperelliptical', 'Mollweide', '<b>Tobler hyperelliptical projection</b> degenerates to <b>Mollweide projection</b> when α = 0, k = 2, and γ ≈ 1.2731.');
addRelation('Tobler hyperelliptical', 'Collignon', '<b>Tobler hyperelliptical projection</b> degenerates to <b>Collignon projection</b> when α = 0 and k = 1.');
addRelation('Hammer', 'Briesemeister', '<b>Briesemeister projection</b> is a oblique and rescaled version of <b>Hammer projection</b>.');

data.nodes = nodes;
data.edges = edges;

order = reorderEdges();
data.edges = data.edges(order);

edges = data.edges;

calcEndpts4Edge();

calcNeighb();

data.nodes = nodes;
data.edges = edges;

disp('actual edges count:');
disp(ecnt);

savejson([], data, outfile);

fid = fopen(outfile);
fidout = fopen([outfile, '+w'], 'w');

tline = fgetl(fid);
while ischar(tline)
    ff = strfind(tline,sprintf('\t'));
    if isempty(ff)
        fwrite(fidout, tline, 'char');
    else
        ffb = strfind(tline,'": ');
        if ~isempty(ffb)
            tline(ffb + 2) = [];
        end
%         ffb = strfind(tline,'": [');
%         if ~isempty(ffb)
%             tline(ffb + 2) = [];
%         end
        fwrite(fidout, tline(size(ff, 2)+1:end), 'char');
    end
    tline = fgetl(fid);
end

fclose(fid);
fclose(fidout);

movefile([outfile, '+w'], outfile);

end

function [  ] = addRelation( node1, node2, desc )

global nodes;
global edges;
global ecnt;

found = false;

for j = 1:size(edges, 2)
    edge = edges{j};
    s = '';
    t = '';
    for i = 1:size(nodes, 2)
        node = nodes{i};
        if str2num(node.id) == str2num(edge.source)
            s = node.label;
            break;
        end
    end
    for i = 1:size(nodes, 2)
        node = nodes{i};
        if str2num(node.id) == str2num(edge.target)
            t = node.label;
            break;
        end
    end
    if strcmp(s, node1) && strcmp(t, node2)
        found = true;
        if isfield(edge, 'desc')
            disp([node1, ' -> ', node2, ' relation exists']);
            break;
        end
        edges{j}.desc = desc;
        break;
    end
    if strcmp(s, node2) && strcmp(t, node1)
        found = true;
        if isfield(edge, 'desc')
            disp([node1, ' -> ', node2, ' relation exists']);
            break;
        end
        edges{j}.desc = desc;
        break;
    end
end

if ~found
    disp([node1, ' -> ', node2, ' not found']);
else
    ecnt = ecnt + 1;
end

end

% function [  ] = reorderNeighb(  )
% 
% global nodes;
% global edges;
% 
% for i = 1:size(nodes, 2)
%     ang = [];
%     neig = nodes{i}.neighbors;
%     for j = 2:size(neig, 2)
%         nb = neig(j+1);
%     end
% end
% 
% end

function [  ] = calcNeighb(  )

global nodes;
global edges;

for i = 1:size(nodes, 2)
    nodes{i}.neighbors = 0;
    nodes{i}.edges = 0;
    px = [];
    py = [];
    for j = 1:size(edges, 2)
        node = nodes{i};
        edge = edges{j};
        if str2num(node.id) == str2num(edge.source)
            nodes{i}.neighbors(end + 1) = edge.t;
            nodes{i}.edges(end + 1) = j - 1;
            [ s, t ] = fun_edge_curve( nodes, edge );
            [x, y] = fun_js_curve(s, t);
            px(end + 1) = x(1) - x(2);
            py(end + 1) = y(1) - y(2);
        end
        if str2num(node.id) == str2num(edge.target)
            nodes{i}.neighbors(end + 1) = edge.s;
            nodes{i}.edges(end + 1) = j - 1;
            [ s, t ] = fun_edge_curve( nodes, edge );
            [x, y] = fun_js_curve(s, t);
            px(end + 1) = x(end) - x(end - 1);
            py(end + 1) = y(end) - y(end - 1);
        end
    end
    ang = atan2(px, py);
    [s, ord] = sort(ang, 'descend');
    nodes{i}.neighbors = [0, nodes{i}.neighbors(ord + 1)];
    nodes{i}.edges = [0, nodes{i}.edges(ord + 1)];
end

end

function [ order ] = reorderEdges(  )

global nodes;
global edges;

edge_distance = [];
directed = [];

for i = 1:size(edges, 2)
    e = edges{i};
    [ s, t ] = fun_edge_curve( nodes, e );
    edge_distance(end + 1) = sqrt((s.x - t.x) ^ 2+ (s.y - t.y) ^ 2);
    
    if size(e.attributes, 1) == 1 && strcmp(e.attributes{1}, 'curved')
        directed(end + 1) = 1;
    else
        directed(end + 1) = 0;
    end
end

ff = find(directed);
ffnot = find(~directed);

[s1, ord1] = sort(edge_distance(ff), 'descend');
[s2, ord2] = sort(edge_distance(ffnot), 'descend');

order = [ffnot(ord2), ff(ord1)];

end

function [  ] = calcEndpts4Edge(  )

global nodes;
global edges;

order = [];

for i = 1:size(nodes, 2)
    order(str2num(nodes{i}.id) + 1) = i;
end

for i = 1:size(edges, 2)
    edge = edges{i};
    s = str2num(edge.source);
    t = str2num(edge.target);
    edges{i}.s = order(s + 1) - 1;
    edges{i}.t = order(t + 1) - 1;
end

end

function [  ] = addInfos( node, type, prop, year, img, author, name, alias )

global ncnt;

if nargin == 6
    name='';
    alias = '';
elseif nargin ~= 8
    disp([node, ' -> nargin should be 6 or 8']);
end

global nodes;

found = false;

for i = 1:size(nodes, 2)
    if strcmp(nodes{i}.label, node)
        found = true;
        ncnt = ncnt + 1;
        if ~isempty(name)
            nodes{i}.name = name;
        end
        
        if ~isempty(alias)
            nodes{i}.alias = alias;
        end
        
        if strcmp(type, 'PCY')
            nodes{i}.attributes{end + 1} = 'pseudocylindrical';
        elseif strcmp(type, 'PCO')
            nodes{i}.attributes{end + 1} = 'pseudoconic';
        elseif strcmp(type, 'CYL')
            nodes{i}.attributes{end + 1} = 'cylindrical';
        elseif strcmp(type, 'CON')
            nodes{i}.attributes{end + 1} = 'conic';
        elseif strcmp(type, 'LEN')
            nodes{i}.attributes{end + 1} = 'lenticular';
        elseif strcmp(type, 'LENPAZ')
            nodes{i}.attributes{end + 1} = 'lenticular';
            nodes{i}.attributes{end + 1} = 'pseudoazimuthal';
        elseif strcmp(type, 'LEN')
            nodes{i}.attributes{end + 1} = 'lenticular';
        elseif strcmp(type, 'MIS')
            nodes{i}.attributes{end + 1} = 'miscellaneous';
        elseif strcmp(type, 'AZ')
            nodes{i}.attributes{end + 1} = 'azimuthal';
        elseif strcmp(type, 'POLY')
            nodes{i}.attributes{end + 1} = 'polyhedral';
        elseif strcmp(type, 'POLYCUBE')
            nodes{i}.attributes{end + 1} = 'polyhedral';
            nodes{i}.attributes{end + 1} = 'cube';
        elseif strcmp(type, 'POLYOCT')
            nodes{i}.attributes{end + 1} = 'polyhedral';
            nodes{i}.attributes{end + 1} = 'octahedron';
        elseif strcmp(type, 'POLYHEMI')
            nodes{i}.attributes{end + 1} = 'polyhedral';
            nodes{i}.attributes{end + 1} = 'hemisphere';
        else
            disp([node, ' -> ', type, ' not found']);
        end
        
        if strcmp(prop, 'A')
            nodes{i}.attributes{end + 1} = 'equal-area';
        elseif strcmp(prop, 'C')
            nodes{i}.attributes{end + 1} = 'conformal';
        elseif strcmp(prop, 'D')
            nodes{i}.attributes{end + 1} = 'equidistant';
        elseif strcmp(prop, 'AD')
            nodes{i}.attributes{end + 1} = 'equal-area';
            nodes{i}.attributes{end + 1} = 'equidistant';
        elseif strcmp(prop, 'M')
            nodes{i}.attributes{end + 1} = 'compromise';
        else
            disp([node, ' -> ', prop, ' not found']);
        end
        nodes{i}.crby = author;
        nodes{i}.year = year;
        nodes{i}.img = ['img/png/', img, '.png'];
%         nodes{i}.img = ['img/nop.png'];
    end
end

if ~found
    disp([node, ' not found']);
end

end

function [  ] = addCategory( node, cat )

global nodes;

found = false;

for i = 1:size(nodes, 2)
    if strcmp(nodes{i}.label, node)
        nodes{i}.attributes{end + 1} = cat;
        found = true;
    end
end

if ~found
    disp([node, ' -> ', cat, ' not found']);
end

end

