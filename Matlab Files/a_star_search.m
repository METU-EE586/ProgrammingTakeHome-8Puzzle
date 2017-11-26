function [pathToGoal] = A_star_search(startState, goalState, heuristicType)
numTiles = length(startState); % Total number of tiles in the puzzle

idTobeAssigned = 1;
% The structure is in the following form:
...     node = [state; nodeID; predecessorID; g (Cost); h (Heuristic); f (= g + h)]
    startNode = [startState; idTobeAssigned; 0; 0; 0; 0];
idTobeAssigned = idTobeAssigned + 1; % Update the id to be assigned to the next nod

queue = startNode; % Enqueue startNode
visitedNodes = zeros(numTiles+5, 1); % It will be used to store visited nodes

while (~isempty(queue))
    % Dequeue the node with minimum f = g + h (g:Cost, h:Heuristic)
    currentNode = queue(:,1);
    queue(:,1) = [];
    
    curState = currentNode(1:numTiles);
    curID = currentNode(numTiles+1);
    curCost = currentNode(numTiles+3);
    
    % When the goal state is popped out of queue than finish the search.
    if (currentNode(1:numTiles) == goalState)
        pathToGoal = construct_path(currentNode, visitedNodes, numTiles);
        return;
    end
    
    successorStates = successors(currentNode(1:numTiles)); % Find successors of the parent
    
    for iSuccessor = 1:size(successorStates,2)
        iSuccState = successorStates(:, iSuccessor);
        % Calculate the heuristic for the successor
        switch heuristicType
            case 'Heuristic Manhattan'
                iSuccHeuristic = heuristic_manhattan(iSuccState, goalState);
            case 'Heuristic Misplaced'
                iSuccHeuristic = heuristic_misplaced(iSuccState, goalState);
        end
        % Cost is calculated by incrementing parent cost by 1.
        iSuccCost = curCost + 1;
        iSuccF = iSuccCost + iSuccHeuristic;
        % Build the successor node by obtained properties
        iSuccNode = [iSuccState; idTobeAssigned; curID; iSuccCost; iSuccHeuristic; iSuccF];
        idTobeAssigned = idTobeAssigned + 1;
        
        % Check if the successor has already been labelled, compare the costs
        [isSuccVisited, locVisited] = ismember(iSuccState', visitedNodes(1:numTiles, :)', 'rows');
        
        % Check if the successor is already in the queue
        [isSuccQueued, locQueue] = ismember(iSuccState', queue(1:numTiles, :)', 'rows');
        
        % If previous cost(in visited nodes) was larger than put this successor in the queue
        if isSuccVisited
            oldCost = visitedNodes(numTiles+3, locVisited);
            if oldCost > iSuccCost
                queue = [queue iSuccNode];
            end
        end
        
        % If previous f (in queue) was larger than overwrite it with this successor
        if isSuccQueued
            oldF = queue(numTiles+5, locQueue);
            if oldF > iSuccF
                queue(:, locQueue) = iSuccNode;
            end
        end
        
        % If this is the first time we come across with this successor, insert it into
        ... the queue.
            if ~isSuccQueued && ~isSuccVisited
            queue = [queue iSuccNode];
            end
    end
    
    % Sort queue with respect to f
    queue = sortrows(queue', numTiles+5)';
    
    % To insert currentNode in visitedNodes
    % First check is it was visited before
    [curNodeVisited, curLoc] = ismember(curState', visitedNodes(1:numTiles, :)', 'rows');
    if curNodeVisited
        visitedNodes(:, curLoc) = currentNode;
    else
        visitedNodes = [visitedNodes currentNode];
    end
end

error("The A* algorithm could not find a solution.");

end

