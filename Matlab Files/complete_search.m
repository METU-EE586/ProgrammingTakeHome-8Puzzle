function [pathToGoal] = complete_search(startState, method)

% First check if the input state can be solved or not
% if ~issolvable(startState)
%     error("Puzzle with specified starting state can not be solved");
% end

numTiles = length(startState); % Total number of tiles in the puzzle
goalState = [(1:numTiles-1) 0]'; % Define the goal state

switch method
    case 'Breadth First'
        [pathToGoal, numExploredNodes, memoryUsage] = breadth_first_search(startState, goalState);
        
    case 'Depth First'
        [pathToGoal, numExploredNodes, memoryUsage] = depth_first_search(startState, goalState);
        
    case 'Iterative Deepening'
        [pathToGoal, numExploredNodes, memoryUsage] = iterative_deepening_search(startState, goalState);
        
    case 'A*'
        [pathToGoal, numExploredNodes, memoryUsage] = a_star_search(startState, goalState, 'Heuristic Manhattan');
        
    otherwise
        warning('An undefined search algorithm is selected.');
        
end
end
