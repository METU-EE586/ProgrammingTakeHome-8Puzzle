function [pathToGoal] = complete_search(startState, method)

% First check if the input state can be solved or not
% if ~issolvable(startState)
%     error("Puzzle with specified starting state can not be solved");
% end

numTiles = length(startState); % Total number of tiles in the puzzle
goalState = [(1:numTiles-1) 0]'; % Define the goal state

switch method
    case 'Breadth First'
        pathToGoal = breadth_first_search(startState, goalState);
        
    case 'Depth First'
        pathToGoal = depth_first_search(startState, goalState);
        
    case 'Iterative Deepening'
        pathToGoal = iterative_deepening_search(startState, goalState);
        
    case 'A*'
        pathToGoal = a_star_search(startState, goalState, 'Heuristic Manhattan');
        
    otherwise
        warning('An undefined search algorithm is selected.');
        
end
end

function [pathToGoal] = construct_path(inpNode, labelledNodes, numTiles)
currentNode = inpNode;
pathToGoal = [];

while (currentNode(numTiles+1) ~= 1) % Until nodeID is equal to 1
    pathToGoal = [currentNode pathToGoal]; % Insert currentNode to the path
    parentID = currentNode(numTiles+2);
    currentNode = labelledNodes(:, (labelledNodes(numTiles+1, :) == parentID));
end

pathToGoal = [currentNode pathToGoal]; % Add startNode to the beginning
end
