%% Q8
load('Q8_MCSimData.mat');
distArray = [1 3 5 8 10 12 15];


% Plot Average num of Moves
figure;
hold on;
grid on;
plot(distArray, MCSim.BFS(2,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.IDDFS(2,:), '-+', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarMisplaced(2,1:7), '-x', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarManhattan(2,1:7), '-s', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Number of Moves included in the Optimum Sequence');
xlabel('Distance between the initial and goal states (step)');
ylabel('# of Moves in the Solution')
legend('BFS', 'ID-DFS', 'A* - Misplaced', 'A* - Manhattan');

% Plot Average num of visited Nodes
figure;
hold on;
grid on;
plot(distArray, MCSim.BFS(2,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.IDDFS(2,:), '-+', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarMisplaced(2,1:7), '-x', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarManhattan(2,1:7), '-s', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Number of Expanded Nodes');
xlabel('Distance between the initial and goal states (step)');
ylabel('# of Expanded Nodes')
legend('BFS', 'ID-DFS', 'A* - Misplaced', 'A* - Manhattan');

% Plot Average num of visited Nodes
figure;
hold on;
grid on;
plot(distArray, MCSim.BFS(3,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.IDDFS(3,:), '-+', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarMisplaced(3,1:7), '-x', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarManhattan(3,1:7), '-s', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Allocated Memory');
xlabel('Distance between the initial and goal states (step)');
ylabel('Memory Allocated (# instantaneously stored nodes)')
legend('BFS', 'ID-DFS', 'A* - Misplaced', 'A* - Manhattan');

% Plot Average num of visited Nodes
figure;
hold on;
grid on;
plot(distArray, MCSim.BFS(4,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.IDDFS(4,:), '-+', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarMisplaced(4,1:7), '-x', 'MarkerSize', 6, 'LineWidth', 2);
plot(distArray, MCSim.AstarManhattan(4,1:7), '-s', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Time Elapsed');
xlabel('Distance between the initial and goal states (step)');
ylabel('Time Elapsed (sec)')
legend('BFS', 'ID-DFS', 'A* - Misplaced', 'A* - Manhattan');


% Q9
load('Q9_MCSimData.mat');
edgeArray = [3 5 8 10 12 15 20 25 30];

% Plot Average num of Moves
figure;
subplot(4,1,1);  
grid on;
plot(edgeArray, MCSim.AstarManhattan(1,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Number of Moves included in the Optimum Sequence');
ylabel('# of Moves')

% Plot Average num of Visited Nodes
subplot(4,1,2);  
grid on;
plot(edgeArray, MCSim.AstarManhattan(2,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Number of Visited Nodes');
ylabel('# of Vis. Nodes')

% Plot Average num of Visited Nodes
subplot(4,1,3);  
grid on;
plot(edgeArray, MCSim.AstarManhattan(3,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Allocated Memory');
ylabel('Mem. Allocated')

% Plot Average Time Elapsed
subplot(4,1,4);  
grid on;
plot(edgeArray, MCSim.AstarManhattan(4,:), '-o', 'MarkerSize', 6, 'LineWidth', 2);

title('Comparison in terms of Time Elapsed');
xlabel('Edge length of the puzzle');
ylabel('Time (sec)')
