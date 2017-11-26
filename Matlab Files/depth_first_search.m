function [pathToGoal, numExploredNodes, memoryUsage] = depth_first_search(startState, goalState)
% This function realizes Depth First Search algorithm.

% "startState, goalState" are column vectors representing the state of the
    ...puzzle for initial and goal configurations, respectively. 

% "pathToGoal" is sequence of configurations starting from startState
    ...ending up goalState. Each column_i of this matrix is the corresponding
    ...configuration of the puzzle at corresponding iteration

% "numExploredNodes" is the total number of nodes processed by the algorithm
	...to reach goal state. 
        
% "MemoryUsage" is a column array of size equal to the total number of iterations.
    ...At each iteration, total number of stored nodes (visited + queued/stacked)
    ...recorded in this array.

% INITIALIZE VARIABLES
numTiles = length(startState); % Total number of tiles in the puzzle
idTobeAssigned = 1;

startNode = [startState; idTobeAssigned; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
idTobeAssigned = idTobeAssigned + 1; % Update the ID to be assigned to the next node

stack = []; % Initialize the stack
visitedNodes = []; % It will be used to store visited nodes

currentNode = startNode; % currentNode represents the node to processed at current iteration
visitedNodes = [visitedNodes currentNode]; % Mark currentNode as visited
stack = [currentNode stack]; % Push current node into Stack
memoryUsage = [];


% MAIN LOOP
% Loop until current node meets the goalstate
% Note also that, when the stack is empty, the loop will be terminated (by an if-statement)
while (~all(currentNode(1:numTiles) == goalState))    
    % Record the number of stored variables
    memoryUsage = [memoryUsage; size(stack,2) + size(visitedNodes,2)]; 
    
    % Investigate details of the current node
    currentID = currentNode(numTiles+1);
    currentCost = currentNode(numTiles+3);              
        
    successorStates = successors(currentNode(1:numTiles)); % Generate the successors of the current node
    
    unvisitedSuccExists = 0; % A flag that can be modeified afterwards
    
    % Invesitage any unvisited successors
    for iSucc = 1: size(successorStates, 2)
        iSuccState = successorStates(:, iSucc);
        
        if any(ismember(iSuccState', visitedNodes(1:numTiles, :)', 'rows'))
            continue;
        end
        
        succNode = [iSuccState; idTobeAssigned; currentID; currentCost+1] ; % Construct the node                
        idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next node
        
        unvisitedSuccExists = 1; % Update the flag
        break;
    end
    
    % If there is no unvisited successor
    if ~unvisitedSuccExists
        stack(:, 1) = []; % Pop currentNode out of stack
        
        % If the stack is not empty, proceed to the node at the top of stack
        if ~isempty(stack) 
            currentNode = stack(:, 1);
        else
        % If the stack is empty, it means the goalNode is not within specified depth.
            error("The DFS algorithm could not find a solution.");
        end
        
    % Else push the unvisited successor into the stack
    else
        currentNode = succNode;
        stack = [currentNode stack];
        visitedNodes = [visitedNodes currentNode];
    end
end

% Search is accomplished, construct the path to the goal
pathToGoal = construct_path(currentNode, visitedNodes, numTiles);

numExploredNodes = size(visitedNodes, 2) - 1;
end
