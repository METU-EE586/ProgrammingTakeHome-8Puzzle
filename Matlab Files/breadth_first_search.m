function [pathToGoal] = breadth_first_search(startState, goalState)

numTiles = length(startState); % Total number of tiles in the puzzle

idTobeAssigned = 1;
% The structure is in the following form:
...     node = [state; nodeID; predecessorID; totalCost]
startNode = [startState; idTobeAssigned; 0; 0];
idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next nod

queue = startNode; % Enqueue startNode
visitedNodes = zeros(numTiles+3, 1); % It will be used to store visited nodes

while (~isempty(queue))
    % Dequeue parentNode
    parentNode = queue(:,1);
    queue(:,1) = [];
    
    parentID = parentNode(numTiles+1);
    parentCost = parentNode(numTiles+3);
 
    if (parentNode(1:numTiles) == goalState)
        % The algorithm reaches to the goal state
        pathToGoal = construct_path(parentNode, visitedNodes, numTiles);
        return;
    end
    
    successorStates = successors(parentNode(1:numTiles)); % Find successors of the parent
    
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
    
    visitedNodes = [visitedNodes parentNode];
end

error("The BFS algorithm could not find a solution.");

end

