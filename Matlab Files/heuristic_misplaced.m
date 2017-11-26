function [heuristic] = heuristic_misplaced(inpState, goalState)

heuristic = sum(inpState == goalState);

end

