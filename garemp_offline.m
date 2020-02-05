function [  ] = garemp_offline(  )

addArrows('maps.json', 'maps+arrows.json');
flipEdges('maps+arrows.json', 'maps+flipped.json');
distortGraph('maps+flipped.json', 'maps+distort.json');
flipEdges('maps+distort.json', 'maps+mono.json');
addColors('maps+mono.json', 'maps+color.json');

end
