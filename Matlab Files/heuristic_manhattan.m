function [heuristic] = heuristic_manhattan(inpState, goalState)

heuristic = 0;
numElements = length(inpState);
lenEdge = sqrt(numElements);

tempArray = 1:numElements;

for i=1:numElements-1
    num = goalState(i);
    rowGoal = ceil(i/lenEdge);
    colGoal = i - lenEdge*(rowGoal-1);
    
    iInp = tempArray(inpState == num);
    rowInp = ceil(iInp/lenEdge);
    colInp = iInp - lenEdge*(rowInp-1);
     
    heuristic = heuristic + abs(rowGoal-rowInp) + abs(colGoal-colInp);
end
end

