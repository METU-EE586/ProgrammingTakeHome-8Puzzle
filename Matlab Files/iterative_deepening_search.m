function [pathToGoal] = iterative_deepening_search(startState, goalState)

maxDepth = 50; % The algorithm will not search beyond this level

numTiles = length(startState); % Total number of tiles in the puzzle
% The structure is in the following form:
...node = [state; nodeID; predecessorID; totalCost]
startNode = [startState; 1; 0; 0];

for iDepth = 1:maxDepth
    idTobeAssigned = 2;
    
    stack = []; % Initialize the stack
    visitedNodes = []; % It will be used to store visited nodes
    
    % Initialize currentNode which represents the node to processed at this moment
    currentNode = startNode;
    % Mark currentNode as visited
    visitedNodes = [currentNode];
    % Push current node into Stack
    stack = [currentNode stack];
    
    while (~all(currentNode(1:numTiles) == goalState))
        % Investigate details of the current node
        currentID = currentNode(numTiles+1);
        currentCost = currentNode(numTiles+3);
        
        unvisitedSuccExists = 0;
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
                unvisitedSuccExists = 1;
                break;
            end
        end
        
        % If there is no unvisited successor
        if ~unvisitedSuccExists
            stack(:, 1) = []; % Pop currentNode out of stack
            
            if ~isempty(stack)
                currentNode = stack(:, 1);
            else
                % If the stack empty, it means the goalNode is not within specified
                % depth.
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
        pathToGoal = construct_path(currentNode, visitedNodes, numTiles);
        return;
    elseif iDepth == maxDepth
        error("The IDDFS algorithm could not find a solution.");
    end 
end
end
