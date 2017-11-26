function [pathToGoal] = construct_path(inpNode, visitedNodes, numTiles)
currentNode = inpNode;
pathToGoal = [];

while (currentNode(numTiles+1) ~= 1) % Until nodeID is equal to 1
    pathToGoal = [currentNode pathToGoal]; % Insert currentNode to the path
    parentID = currentNode(numTiles+2);
    currentNode = visitedNodes(:, (visitedNodes(numTiles+1, :) == parentID));
end

pathToGoal = [currentNode pathToGoal]; % Add startNode to the beginning
end