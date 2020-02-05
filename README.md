GAREMP: Graphical Attribute and Relationship Explorer for Map Projections

Analyzing and comparing map projections with [GAREMP!](http://garemp.github.io)

http://garemp.github.io/

## License
Apache-2.0 © 2019-2020 Jin Yan

Capital University of Economics and Business

Beijing, China

## Sample file

File 'maps.json' which is generated from [Gephi](https://github.com/gephi/gephi) (A Graph modelling and visualization tool) is provided as the source and sample file of the following offline processes.

You can process your own JSON file by using the following approach.

## Prerequisites

Clone dependence (JSONLAB, Bounding-Spheres-And-Circles, Flow-Based Cartogram Generator, and graph-coloring, see below), and build Flow-Based Cartogram Generator, and graph-coloring, move executables of Flow-Based Cartogram Generator, and graph-coloring to this folder.

Offline processes of GAREMP is depend on 

[fangq](https://github.com/fangq)/[JSONLAB](https://github.com/fangq/jsonlab) (a MATLAB toolbox to encode/decode JSON files), 

[AntonSemechko](https://github.com/AntonSemechko)/[Bounding-Spheres-And-Circles](https://github.com/AntonSemechko/Bounding-Spheres-And-Circles) (a library to find minimum bounding spheres), 

and two executables:

[Flow-Based Cartogram Generator](https://github.com/Flow-Based-Cartograms/go_cart), 

and [brrcrites](https://github.com/brrcrites)/[graph-coloring](https://github.com/brrcrites/graph-coloring).

## Offline Processes of GAREMP

### mark directed edges

Run addArrows('maps.json', 'maps+arrows.json'); to mark directed edges as 'curved' in maps.json.

### flip undirected deges

Run flipEdges('maps+arrows.json', 'maps+flipped.json'); to flip source and target end-points of undirected edges if needed.

### distort the graph

Run distortGraph('maps+flipped.json', 'maps+distort.json'); to distort the graph based on cartogram algorithm.

This step would take a long time for cartogram-based distortion. Have a break.

### flip undirected deges once more

Run flipEdges('maps+distort.json', 'maps+mono.json'); to flip source and target end-points of undirected edges once more.

### calc and add colors

Run addColors('maps+mono.json', 'maps+color.json'); to calculate intersection between edges and assign distinct colors to intersected edges.

### add attributes and relationship

Run addInfo('maps+color.json', 'maps+results.json'); to add attributes, classification, relationship, adjust order or drawing, and calculate neighborship of nodes and endpoints of edges to obtain the final JSON file used in GAREMP.

Above commands could be executed in batch as garemp_offline().
