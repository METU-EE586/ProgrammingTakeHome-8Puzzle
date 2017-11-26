function [heuristic] = heuristic_manhattan(inpState, goalState)
% This function calculates the Manhattan distance between inpState and
% goalState

numElements = length(inpState); % Total number of elements in the puzzle, 
...including 0 (zero).
lenEdge = sqrt(numElements); % Length of an edge of the puzzle

dummyArray = 1:numElements; % A dummy array used to determine position of 
...the relevant entities

heuristic = 0; % Initilize the output value
for i = 1:numElements-1
    number = goalState(i);
    
    % Find position (column, row) of the number in the goal state
    rowGoal = ceil(i/lenEdge);
    colGoal = i - lenEdge*(rowGoal-1);
    
    % Find position (column, row) of the number in the input state
    orderInp = dummyArray(inpState == number);
    rowInp = ceil(orderInp/lenEdge);
    colInp = orderInp - lenEdge*(rowInp-1);
    
    % Calculate the heuristic adding up to the previous value
    heuristic = heuristic + abs(rowGoal-rowInp) + abs(colGoal-colInp);
end
end

