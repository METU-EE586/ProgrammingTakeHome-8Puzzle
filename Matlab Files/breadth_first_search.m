function [pathToGoal, numExploredNodes, memoryUsage] = breadth_first_search(startState, goalState)
% This function realizes Breadth First Search algorithm.

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
idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next nod

queue = startNode; % Enqueue startNode
visitedNodes = zeros(numTiles+3, 1); % It will be used to store visited nodes
memoryUsage = [];


% MAIN LOOP
% Loop until the queue is empty
% Note also that when the goal state is discovered, the loop will be terminated (by an if-statement)
while (~isempty(queue))
    % Record the number of stored variables
    memoryUsage = [memoryUsage; size(queue,2) + size(visitedNodes,2)]; 
    
    % Dequeue parentNode
    parentNode = queue(:,1);
    queue(:,1) = [];
    
    % Investigate details of the parent node
    parentID = parentNode(numTiles+1);
    parentCost = parentNode(numTiles+3);
 
    % When the algorithm reaches the goal state, produce the path and return
    if (parentNode(1:numTiles) == goalState)        
        pathToGoal = construct_path(parentNode, visitedNodes, numTiles);
        
        numExploredNodes = size(visitedNodes, 2) - 1;
        return;
    end
    
    % Find successors of the parent
    successorStates = successors(parentNode(1:numTiles)); 
    
    % Add unvisited successors to the queue
    for iSuccessor = 1:size(successorStates,2)
        curSuccState = successorStates(:, iSuccessor);
        
        % If the successor has already been labelled, skip it.
        if any(ismember(curSuccState', visitedNodes(1:numTiles, :)', 'rows'))
            continue;
        end
        
        % If the successor is not in queue add it into the queue.
        if ~any(ismember(curSuccState', queue(1:numTiles, :)', 'rows'))
            curSuccNode = [curSuccState; idTobeAssigned; parentID; parentCost+1];
            idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next node
            
            queue = [queue curSuccNode]; % Enqueue curSuccNode
            % Note that, there is no ordering operation on the queue since
            % it is quaranteed that each successor has a cost value that is
            % bigger than that of all previously visited nodes.
            
        end
    end
    
    % Add parentNode into visitedNodes
    visitedNodes = [visitedNodes parentNode];
end

% Issues an error since the queue is empty and a solution could not be obtained
error("The BFS algorithm could not find a solution.");
end

