function [  ] = garemp_offline(  )
% Apache-2.0 © 2019-2020 Jin Yan
% School of Management and Engineering, 
% Capital University of Economics and Business, Beijing, China
% Copyright @ 2019-2020
% All Right Reserved
% GAREMP: Graphical Attribute and Relationship Explorer for Map Projections
% http://garemp.github.io/
%
% Run GAREMP offline in one command

addArrows('maps+sample.json', 'maps+arrows.json');
flipEdges('maps+arrows.json', 'maps+flipped.json');
distortGraph('maps+flipped.json', 'maps+distort.json');
flipEdges('maps+distort.json', 'maps+mono.json');
addColors('maps+mono.json', 'maps+color.json');
addInfo('maps+color.json', 'maps+results.json');

end
