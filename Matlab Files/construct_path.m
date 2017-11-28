function [pathToGoal] = construct_path(visitedNodes, numTiles)
currentNode = visitedNodes(:, end);
pathToGoal = [];

while (currentNode(numTiles+1) ~= 1) % Until nodeID is equal to 1
    pathToGoal = [currentNode pathToGoal]; % Insert currentNode to the path
    parentID = currentNode(numTiles+2);
    currentNode = visitedNodes(:, (visitedNodes(numTiles+1, :) == parentID));
end

pathToGoal = [currentNode pathToGoal]; % Add startNode to the beginning
end