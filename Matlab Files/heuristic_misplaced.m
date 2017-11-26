function [heuristic] = heuristic_misplaced(inpState, goalState)
% This function calculates number of misplaced tiles considering inpState and
% goalState.

heuristic = sum(inpState ~= goalState);

end

