% clear;
% clc;

%% COMPLETE SEARCH
% 
% % INITIALIZE VARIABLES
method = 'Iterative Deepening';
mode= "complete"; % It is a complete search
numStep = 15; % MC Parameter
numPuzzle = 20; % MC Parameter
goalState = [1:8 0]'; % will be defined by user
numTiles = length(goalState); % Total number of tiles in the puzzle

aveNumMoves = 0; % Average number of moves in the solution
aveNumVisitedNodes = 0; % Average number of expanded nodes
aveAllocatedMemory = 0; % Average of allocated memory
aveTimeElapsed = 0;


% Produce random start states
% startStateMatrix = produce_random_puzzle(goalState, numStep, numPuzzle);
startStateMatrix = [3 4 6 1 0 8 7 2 5]';

for iRun = 1:numPuzzle
    % Construct node to start the search
    startState = startStateMatrix(:, iRun);
    if strcmp(method, 'A*')
        startNode = [startState; 1; 0; 0; 0; 0]; % = [state; nodeID; predecessorID; cost; heuristic; f]
    else
        startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
    end
    
    switch method
        case 'Breadth First'
            queue = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, queue, timeElapsed] = breadth_first_search(goalState, mode, queue, visitedNodes);
            
        case 'Depth First'
            stack = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, stack, timeElapsed] = depth_first_search(goalState, mode, stack, visitedNodes);
            
        case 'Iterative Deepening'
            stack = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, stack, timeElapsed] = iterative_deepening_search(goalState, mode, stack, visitedNodes);
            
        case 'A*'
            queue = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            heuristicType = 'Heuristic Manhattan';
            
            [visitedNodes, queue, timeElapsed] = a_star_search(goalState, mode, queue, visitedNodes, heuristicType);
            
    end
    
    % Construct the path to the goal
    pathToGoal = construct_path(visitedNodes, numTiles);
    
    % Investigate analytics
    numMovesInSolution = size(pathToGoal, 2) - 1;
    numVisitedNodes = size(visitedNodes,2);
    memoryAllocated = numVisitedNodes + size(queue,2);
%     memoryAllocated = numVisitedNodes + size(stack,2);
    
    % Sum these up to average later on
    aveNumMoves = aveNumMoves + numMovesInSolution;
    aveNumVisitedNodes = aveNumVisitedNodes + numVisitedNodes;
    aveAllocatedMemory = aveAllocatedMemory + memoryAllocated;
    aveTimeElapsed = aveTimeElapsed + timeElapsed;
end

% Calculate avereges
aveNumMoves = aveNumMoves/ numPuzzle;
aveNumVisitedNodes = aveNumVisitedNodes/ numPuzzle;
aveAllocatedMemory = aveAllocatedMemory/ numPuzzle;
aveTimeElapsed = aveTimeElapsed/ numPuzzle;


%% SINGLE STEP SEARCH
% 
% % % INITIALIZE VARIABLES
% method = 'A*';
% mode= 'single_step'; % It is a complete search
% numStep = 5; % MC Parameter
% numPuzzle = 1; % MC Parameter
% goalState = [1:8 0]'; % will be defined by user
% numTiles = length(goalState); % Total number of tiles in the puzzle
% 
% numIterations = 0;
% 
% % Produce a random start state
% startState = produce_random_puzzle(goalState, numStep, numPuzzle);
% 
% if strcmp(method, 'A*')
%     startNode = [startState; 1; 0; 0; 0; 0]; % = [state; nodeID; predecessorID; cost; heuristic; f]
% else
%     startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
% end
% 
% queue = startNode; % Enqueue startNode
% stack = startNode; % Enqueue startNode
% visitedNodes = []; % Initialize visited nodes as an empty set
% 
% while ~all((stack(1:numTiles, 1) == goalState))
%     numIterations = numIterations + 1;
%     
%     switch method
%         case 'Breadth First'
%             
%             [visitedNodes, queue, ~] = breadth_first_search(goalState, mode, queue, visitedNodes);
%             
%         case 'Depth First'
%             
%             [visitedNodes, stack, ~] = depth_first_search(goalState, mode, stack, visitedNodes);
%             
%         case 'Iterative Deepening'
%             
%             [visitedNodes, stack, ~] = iterative_deepening_search(goalState, mode, stack, visitedNodes);
%             
%         case 'A*'
%             
%             heuristicType = 'Heuristic Manhattan';
%             
%             [visitedNodes, queue, timeElapsed] = a_star_search(goalState, mode, queue, visitedNodes, heuristicType);
%     end
% end
% 
% pathToGoal = construct_path(visitedNodes, numTiles);