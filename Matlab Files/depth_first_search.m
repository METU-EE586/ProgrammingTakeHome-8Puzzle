function [pathToGoal] = depth_first_search(startState, goalState)

numTiles = length(startState); % Total number of tiles in the puzzle

idTobeAssigned = 1;
% The structure is in the following form:
...node = [state; nodeID; predecessorID; totalCost]
startNode = [startState; idTobeAssigned; 0; 0];
idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next node

stack = []; % Initialize the stack
visitedNodes = []; % It will be used to store visited nodes

% Initialize currentNode which represents the node to processed at this moment
currentNode = startNode;
% Mark currentNode as visited
visitedNodes = [visitedNodes currentNode];
% Push current node into Stack
stack = [currentNode stack];

% Loop until current node meets the goalstate
while (~all(currentNode(1:numTiles) == goalState))
    % Investigate details of the current node
    currentID = currentNode(numTiles+1);
    currentCost = currentNode(numTiles+3);      
    
    unvisitedSuccExists = 0; % A flag that can be modeified afterwards
        
    successorStates = successors(currentNode(1:numTiles)); % Generate the successors of the current node
    
    for iSucc = 1: size(successorStates, 2)
        iSuccState = successorStates(:, iSucc);
        
        if any(ismember(iSuccState', visitedNodes(1:numTiles, :)', 'rows'))
            continue;
        end
        
        succNode = [iSuccState; idTobeAssigned; currentID; currentCost+1] ; % Construct the node                
        idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next node
        % Record the successor into the list to be pushed later
        unvisitedSuccExists = 1;
        break;
    end
    
    % If there is no unvisited successor
    if ~unvisitedSuccExists
        stack(:, 1) = []; % Pop currentNode out of stack
        
        if ~isempty(stack)
            currentNode = stack(:, 1);
        else
            % If the stack empty, it means the goalNode is not within specified
            % depth.
            error("The DFS algorithm could not find a solution.");
        end
        
    % Else push the unvisited successor into the stack
    else
        currentNode = succNode;
        stack = [currentNode stack];
        visitedNodes = [visitedNodes currentNode];
    end
end

pathToGoal = construct_path(currentNode, visitedNodes, numTiles);
end
