clc;
clear;

goalState = [1:8 0]';
stepToGoal = 10;
numOfTrial = 10;

inpStateMatrix = produce_random_puzzle(goalState, stepToGoal, numOfTrial);

totalNumMove = 0;
numTrial = size(inpStateMatrix, 2);
for iTrial = 1: numTrial
    inpState = inpStateMatrix(:, iTrial);
    
%     pathToGoal  = complete_search(inpState, 'Breadth First');
    pathToGoal = complete_search(inpState, 'Iterative Deepening');
%     pathToGoal = complete_search(inpState, 'A*');
    % pathToGoal = complete_search(inpState, 'Depth First');
    numMoveInCurrTrial = size(pathToGoal, 2);
    totalNumMove = totalNumMove + numMoveInCurrTrial;
end

averageNumMove = totalNumMove/ numTrial
