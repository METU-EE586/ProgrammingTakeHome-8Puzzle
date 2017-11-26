function [pathToGoal, numExploredNodes, memoryUsage] = iterative_deepening_search(startState, goalState)
% This function realizes Iterative Deepening Search algorithm.

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
maxDepth = 50; % The algorithm will not search beyond this level
numTiles = length(startState); % Total number of tiles in the puzzle
startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
memoryUsage = [];


% MAIN LOOP
% While incrementing the allowed depth of search, run DFS for each iteration
for iDepth = 1:maxDepth
    idTobeAssigned = 2;
    
    stack = []; % Initialize the stack
    visitedNodes = []; % It will be used to store visited nodes
    
    % Initialize currentNode which represents the node to processed at this moment
    currentNode = startNode;
    % Mark currentNode as visited
    visitedNodes = currentNode;
    % Push current node into Stack
    stack = [currentNode stack];
    
    % Loop until current node meets the goalstate
    while (~all(currentNode(1:numTiles) == goalState))
        % Record the number of stored variables
        memoryUsage = [memoryUsage; size(stack,2) + size(visitedNodes,2)];
        
        % Investigate details of the current node
        currentID = currentNode(numTiles+1);
        currentCost = currentNode(numTiles+3);
        
        unvisitedSuccExists = 0; % A flag that can be modeified afterwards
        
        % If the node is within allowed depth
        if (currentCost < iDepth)
            % Generate the successors of the current node
            successorStates = successors(currentNode(1:numTiles));
            
            for iSucc = 1: size(successorStates, 2)
                succState = successorStates(:, iSucc);
                
                if any(ismember(succState', visitedNodes(1:numTiles, :)', 'rows'))
                    continue;
                end
                
                succNode = [succState; idTobeAssigned; currentID; currentCost+1] ; % Construct the node
                idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next node
                % Record the successor into the list to be pushed later
                unvisitedSuccExists = 1; % Update the flag
                break;
            end
        end
        
        % If there is no unvisited successor
        if ~unvisitedSuccExists
            stack(:, 1) = []; % Pop currentNode out of stack
            
            % If the stack is not empty, proceed to the node at the top of stack
            if ~isempty(stack)
                currentNode = stack(:, 1);
            % If the stack empty, it means the goalNode is not within specified depth.
            else                
                break;
            end
            
        % Else push the unvisited successor into the stack
        else
            currentNode = succNode;
            stack = [currentNode stack];
            visitedNodes = [visitedNodes currentNode];
        end
    end
    
    if all(currentNode(1:numTiles) == goalState)
        % Search is accomplished, construct the path to the goal
        pathToGoal = construct_path(currentNode, visitedNodes, numTiles);
        numExploredNodes = size(visitedNodes, 2) - 1;
        return;
        
    elseif iDepth == maxDepth
        error("The IDDFS algorithm could not find a solution.");
    end 
end
end
