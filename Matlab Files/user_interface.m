function varargout = user_interface(varargin)
% USER_INTERFACE MATLAB code for user_interface.fig
%      USER_INTERFACE, by itself, creates a new USER_INTERFACE or raises the existing
%      singleton*.
%
%      H = USER_INTERFACE returns the handle to a new USER_INTERFACE or the handle to
%      the existing singleton*.
%
%      USER_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USER_INTERFACE.M with the given input arguments.
%
%      USER_INTERFACE('Property','Value',...) creates a new USER_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before user_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to user_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help user_interface

% Last Modified by GUIDE v2.5 28-Nov-2017 13:29:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @user_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @user_interface_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before user_interface is made visible.
function user_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to user_interface (see VARARGIN)

% Choose default command line output for user_interface
handles.output = hObject;

handles.visitedNodes =  []; 
handles.queue_stack = [];
handles.numIterations = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes user_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = user_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialStateEdit_Callback(hObject, eventdata, handles)
% hObject    handle to initialStateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialStateEdit as text
%        str2double(get(hObject,'String')) returns contents of initialStateEdit as a double


% --- Executes during object creation, after setting all properties.
function initialStateEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialStateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RandInitialButton.
function RandInitialButton_Callback(hObject, eventdata, handles)
% hObject    handle to RandInitialButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

goalStateStr = ['goalState = ' get(handles.GoalStateEdit,'String') ';'];
eval(goalStateStr);
goalState = goalState'; % Convert it to a column vector

numStepFromGoal = str2double(get(handles.RandInitialDistanceEdit,'String'));

% Produce random start states
startState = produce_random_puzzle(goalState, numStepFromGoal, 1)';
startStateStr = ['[' num2str(startState) ']'];

set(handles.initialStateEdit,'string',num2str(startStateStr));


% --- Executes on button press in PauseSingleRunButton.
function PauseSingleRunButton_Callback(hObject, eventdata, handles)
% hObject    handle to PauseSingleRunButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BFSButton.
function BFSButton_Callback(hObject, eventdata, handles)
% hObject    handle to BFSButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BFSButton


% --- Executes on button press in DFSButton.
function DFSButton_Callback(hObject, eventdata, handles)
% hObject    handle to DFSButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DFSButton



% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5



function GoalStateEdit_Callback(hObject, eventdata, handles)
% hObject    handle to GoalStateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GoalStateEdit as text
%        str2double(get(hObject,'String')) returns contents of GoalStateEdit as a double
goalStateStr = ['goalState = ' get(hObject,'String')  ';'];
eval(goalStateStr);
goalState = goalState(:); % Convert it to a column vector


% --- Executes during object creation, after setting all properties.
function GoalStateEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GoalStateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartStopSRButton.
function StartStopSRButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartStopSRButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%




function MCDistanceEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MCDistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MCDistanceEdit as text
%        str2double(get(hObject,'String')) returns contents of MCDistanceEdit as a double
MCNumStepFromGoal = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function MCDistanceEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MCDistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function MCnumberEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MCnumberEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MCnumberEdit as text
%        str2double(get(hObject,'String')) returns contents of MCnumberEdit as a double
MCNumRun = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function MCnumberEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MCnumberEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartMCButton.
function StartMCButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartMCButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Determine the parameters of Monte Carlo simulations

if get(handles.BFSButton,'Value')
    searchMethod = 'Breadth First';
elseif get(handles.DFSButton,'Value')
    searchMethod = 'Depth First';
elseif get(handles.IDDFSButton,'Value')
    searchMethod = 'Iterative Deepening';
elseif get(handles.AstarMisplacedButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Misplaced';
elseif get(handles.AstarManhattanButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Manhattan';    
end

searchMode = "complete";

goalStateStr = ['goalState = ' get(handles.GoalStateEdit,'String') ';'];
eval(goalStateStr);
goalState = goalState'; % Convert it to a column vector

MCNumRun = str2double(get(handles.MCnumberEdit,'String'));
MCNumStepFromGoal = str2double(get(handles.MCDistanceEdit,'String'));

numTiles = length(goalState); % Total number of tiles in the puzzle

% Initialize metrics
aveNumMoves = 0; % Average number of moves in the solution
aveNumVisitedNodes = 0; % Average number of expanded nodes
aveAllocatedMemory = 0; % Average of allocated memory
aveTimeElapsed = 0;

% Produce random start states
startStateMatrix = produce_random_puzzle(goalState, MCNumStepFromGoal, MCNumRun);


for iRun = 1:MCNumRun
    % Construct node to start the search
    startState = startStateMatrix(:, iRun);
    if strcmp(searchMethod, 'A*')
        startNode = [startState; 1; 0; 0; 0; 0]; % = [state; nodeID; predecessorID; cost; heuristic; f]
    else
        startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
    end
    
    switch searchMethod
        case 'Breadth First'
            queue = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, queue, timeElapsed] = breadth_first_search(goalState, searchMode, queue, visitedNodes);
            
        case 'Depth First'
            stack = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, stack, timeElapsed] = depth_first_search(goalState, searchMode, stack, visitedNodes);
            
        case 'Iterative Deepening'
            stack = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, stack, timeElapsed] = iterative_deepening_search(goalState, searchMode, stack, visitedNodes);
            
        case 'A*'
            queue = startNode; % Enqueue startNode
            visitedNodes = []; % Initialize visited nodes as an empty set
            
            [visitedNodes, queue, timeElapsed] = a_star_search(goalState, searchMode, queue, visitedNodes, heuristicType);            
    end
    
    % Construct the path to the goal
    pathToGoal = construct_path(visitedNodes, numTiles);
    
    % Investigate analytics
    numMovesInSolution = size(pathToGoal, 2) - 1;
    numVisitedNodes = size(visitedNodes,2);
    if strcmp(searchMethod, 'Breadth First') || strcmp(searchMethod, 'A*')
        memoryAllocated = numVisitedNodes + size(queue,2);
    else
        memoryAllocated = numVisitedNodes + size(stack,2);
    end   
    
    % Sum these up to average later on
    aveNumMoves = aveNumMoves + numMovesInSolution;
    aveNumVisitedNodes = aveNumVisitedNodes + numVisitedNodes;
    aveAllocatedMemory = aveAllocatedMemory + memoryAllocated;
    aveTimeElapsed = aveTimeElapsed + timeElapsed;
end

% Calculate avereges
aveNumMoves = aveNumMoves/ MCNumRun;
aveNumVisitedNodes = aveNumVisitedNodes/ MCNumRun;
aveAllocatedMemory = aveAllocatedMemory/ MCNumRun;
aveTimeElapsed = aveTimeElapsed/ MCNumRun;

% Show results on the interface
set(handles.resultMCNumMoves,'string',num2str(aveNumMoves));
set(handles.resultMCTimeElapsed,'string',num2str(aveTimeElapsed));
set(handles.resultMCMaxAllocMemory,'string',num2str(aveAllocatedMemory));
set(handles.resultMCExpandedNodes,'string',num2str(aveNumVisitedNodes));


% --- Executes on button press in SingleStepButton.
function SingleStepButton_Callback(hObject, eventdata, handles)
% hObject    handle to SingleStepButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Determine the parameters of the search
if get(handles.BFSButton,'Value')
    searchMethod = 'Breadth First';
elseif get(handles.DFSButton,'Value')
    searchMethod = 'Depth First';
elseif get(handles.IDDFSButton,'Value')
    searchMethod = 'Iterative Deepening';
elseif get(handles.AstarMisplacedButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Misplaced';
elseif get(handles.AstarManhattanButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Manhattan';    
end

searchMode = "single_step";

% Determine goalState
goalStateStr = ['goalState = ' get(handles.GoalStateEdit,'String') ';'];
eval(goalStateStr);
goalState = goalState'; % Convert it to a column vector

% Determine startState
startStateStr = ['startState = ' get(handles.initialStateEdit,'String') ';'];
eval(startStateStr);
startState = startState'; % Convert it to a column vector

numTiles = length(goalState); % Total number of tiles in the puzzle

% Create startNode
if strcmp(searchMethod, 'A*')
    startNode = [startState; 1; 0; 0; 0; 0]; % = [state; nodeID; predecessorID; cost; heuristic; f]
else
    startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
end

% Retrive previous information from handle struct
visitedNodes = handles.visitedNodes;
queue_stack = handles.queue_stack;
numIterations = handles.numIterations;

if isempty(visitedNodes)    
    queue_stack = startNode; % Enqueue startNode
elseif all(queue_stack(1:numTiles,1) == goalState)    
    return;
end

% Iterate the search algorithm one step then return outputs
numIterations = numIterations + 1;
switch searchMethod
    case 'Breadth First'
        [visitedNodes, queue_stack, ~] = breadth_first_search(goalState, searchMode, queue_stack, visitedNodes);
    case 'Depth First'
        [visitedNodes, queue_stack, ~] = depth_first_search(goalState, searchMode, queue_stack, visitedNodes);
    case 'Iterative Deepening'
        [visitedNodes, queue_stack, ~] = iterative_deepening_search(goalState, searchMode, queue_stack, visitedNodes);
    case 'A*'
        [visitedNodes, queue_stack, ~] = a_star_search(goalState, searchMode, queue_stack, visitedNodes, heuristicType);
end

% Print current state
currentState = queue_stack(1:numTiles, 1);
printPuzzle(hObject, handles, currentState);

% Print # of iterations and allocated memory
curAllocMemory = size(visitedNodes, 2) + size(queue_stack,2);

set(handles.resultSRAllocMemory,'string',num2str(curAllocMemory));
set(handles.resultSRNumIteration,'string',num2str(numIterations));

handles.visitedNodes = visitedNodes;
handles.queue_stack = queue_stack;
handles.numIterations = numIterations;

% Update handles structure
guidata(hObject, handles);

function RandInitialDistanceEdit_Callback(hObject, eventdata, handles)
% hObject    handle to RandInitialDistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RandInitialDistanceEdit as text
%        str2double(get(hObject,'String')) returns contents of RandInitialDistanceEdit as a double


% --- Executes during object creation, after setting all properties.
function RandInitialDistanceEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RandInitialDistanceEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultMCNumMoves_Callback(hObject, eventdata, handles)
% hObject    handle to resultMCNumMoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultMCNumMoves as text
%        str2double(get(hObject,'String')) returns contents of resultMCNumMoves as a double


% --- Executes during object creation, after setting all properties.
function resultMCNumMoves_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultMCNumMoves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function resultMCExpandedNodes_Callback(hObject, eventdata, handles)
% hObject    handle to resultMCExpandedNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultMCExpandedNodes as text
%        str2double(get(hObject,'String')) returns contents of resultMCExpandedNodes as a double


% --- Executes during object creation, after setting all properties.
function resultMCExpandedNodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultMCExpandedNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultMCMaxAllocMemory_Callback(hObject, eventdata, handles)
% hObject    handle to resultMCMaxAllocMemory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultMCMaxAllocMemory as text
%        str2double(get(hObject,'String')) returns contents of resultMCMaxAllocMemory as a double


% --- Executes during object creation, after setting all properties.
function resultMCMaxAllocMemory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultMCMaxAllocMemory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultMCTimeElapsed_Callback(hObject, eventdata, handles)
% hObject    handle to resultMCTimeElapsed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultMCTimeElapsed as text
%        str2double(get(hObject,'String')) returns contents of resultMCTimeElapsed as a double


% --- Executes during object creation, after setting all properties.
function resultMCTimeElapsed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultMCTimeElapsed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultSRNumIteration_Callback(hObject, eventdata, handles)
% hObject    handle to resultSRNumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultSRNumIteration as text
%        str2double(get(hObject,'String')) returns contents of resultSRNumIteration as a double


% --- Executes during object creation, after setting all properties.
function resultSRNumIteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultSRNumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultSRAllocMemory_Callback(hObject, eventdata, handles)
% hObject    handle to resultSRAllocMemory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultSRAllocMemory as text
%        str2double(get(hObject,'String')) returns contents of resultSRAllocMemory as a double


% --- Executes during object creation, after setting all properties.
function resultSRAllocMemory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultSRAllocMemory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StopSingleRunButton.
function StopSingleRunButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopSingleRunButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in IDDFSButton.
function IDDFSButton_Callback(hObject, eventdata, handles)
% hObject    handle to IDDFSButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IDDFSButton



% --- Executes on button press in AstarMisplacedButton.
function AstarMisplacedButton_Callback(hObject, eventdata, handles)
% hObject    handle to AstarMisplacedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AstarMisplacedButton


% --- Executes on button press in AstarManhattanButton.
function AstarManhattanButton_Callback(hObject, eventdata, handles)
% hObject    handle to AstarManhattanButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AstarManhattanButton


% --- Executes during object creation, after setting all properties.
function IDDFSButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IDDFSButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function AstarMisplacedButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AstarMisplacedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function AstarManhattanButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AstarManhattanButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in SRStartButton.
function SRStartButton_Callback(hObject, eventdata, handles)
% hObject    handle to SRStartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SRStartButton


% Determine the parameters of the search
if get(handles.BFSButton,'Value')
    searchMethod = 'Breadth First';
elseif get(handles.DFSButton,'Value')
    searchMethod = 'Depth First';
elseif get(handles.IDDFSButton,'Value')
    searchMethod = 'Iterative Deepening';
elseif get(handles.AstarMisplacedButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Misplaced';
elseif get(handles.AstarManhattanButton,'Value')
    searchMethod = 'A*';
    heuristicType = 'Heuristic Manhattan';    
end

searchMode = "single_step";

% Determine goalState
goalStateStr = ['goalState = ' get(handles.GoalStateEdit,'String') ';'];
eval(goalStateStr);
goalState = goalState'; % Convert it to a column vector

% Determine startState
startStateStr = ['startState = ' get(handles.initialStateEdit,'String') ';'];
eval(startStateStr);
startState = startState'; % Convert it to a column vector

numTiles = length(goalState); % Total number of tiles in the puzzle

% Create startNode
if strcmp(searchMethod, 'A*')
    startNode = [startState; 1; 0; 0; 0; 0]; % = [state; nodeID; predecessorID; cost; heuristic; f]
else
    startNode = [startState; 1; 0; 0]; % = [state; nodeID; predecessorID; totalCost]
end

% Retrive previous information from handle struct
visitedNodes = handles.visitedNodes;
queue_stack = handles.queue_stack;
numIterations = handles.numIterations;

if isempty(visitedNodes)    
    queue_stack = startNode; % Enqueue startNode
end

% Print current state
currentState = queue_stack(1:numTiles, 1);
printPuzzle(hObject, handles, currentState);

while ~all((queue_stack(1:numTiles, 1) == goalState))
    numIterations = numIterations + 1;
    
    switch searchMethod
        case 'Breadth First'            
            [visitedNodes, queue_stack, ~] = breadth_first_search(goalState, searchMode, queue_stack, visitedNodes);            
        case 'Depth First'            
            [visitedNodes, queue_stack, ~] = depth_first_search(goalState, searchMode, queue_stack, visitedNodes);            
        case 'Iterative Deepening'            
            [visitedNodes, queue_stack, ~] = iterative_deepening_search(goalState, searchMode, queue_stack, visitedNodes);            
        case 'A*'           
            [visitedNodes, queue_stack, ~] = a_star_search(goalState, searchMode, queue_stack, visitedNodes, heuristicType);
    end
    
    % Print current state
    currentState = queue_stack(1:numTiles, 1);
    printPuzzle(hObject, handles, currentState);
    
    % Print # of iterations and allocated memory
    curAllocMemory = size(visitedNodes, 2) + size(queue_stack,2);
    
    set(handles.resultSRAllocMemory,'string',num2str(curAllocMemory));
    set(handles.resultSRNumIteration,'string',num2str(numIterations));
    
    isStartButton = get(hObject,'Value');
    if ~ isStartButton
        break;
    end    
end

isStopButton = get(handles.SRStopButton,'Value');
isPauseButton = get(handles.SRPause,'Value');

if isStopButton % User stops the simulation
    handles.visitedNodes = [];
    handles.queue_stack = [];
    handles.numIterations = 0;
    % Clear the image
    
elseif isPauseButton % User pauses the simulation
    handles.visitedNodes = visitedNodes;
    handles.queue_stack = queue_stack;
    handles.numIterations = numIterations;
else
    % Search is accomplished
    handles.visitedNodes = [];
    handles.queue_stack = [];
    handles.numIterations = 0;
end

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in SRStopButton.
function SRStopButton_Callback(hObject, eventdata, handles)
% hObject    handle to SRStopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SRStopButton
clear_print(handles);

% --- Executes on button press in SRPause.
function SRPause_Callback(hObject, eventdata, handles)
% hObject    handle to SRPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SRPause

function printPuzzle(hObject, handles, currentState)
numOfTiles = length(currentState);
edgeLen = sqrt(numOfTiles);

axes(handles.axes1);
cla;
legend('off');
set(handles.axes1, 'box', 'off');
set(handles.axes1, 'xtick',  []);
set(handles.axes1, 'ytick',  []);
hold on;

% Draw a rectangle
rectangle('Position',[0 0 2*edgeLen 2*edgeLen], 'Curvature', 0.1);
axis([-0.2 2*edgeLen+0.2 -0.2 2*edgeLen+0.2]);

% Draw lines
for iLine = 1: edgeLen-1
    line([2*iLine 2*iLine], [0 2*edgeLen]);
    line([0 2*edgeLen], [2*iLine 2*iLine]);
end

% Put numbers on the puzzle
iNum = 1;
iRow = edgeLen;
while (iRow > 0)
    for iCol = 1:edgeLen
        curNum = currentState(iNum);
        iNum = iNum + 1;
        if curNum ~= 0
            text(2*iCol-1.1, 2*iRow-1.1, num2str(curNum),...
            'FontWeight', 'bold', 'FontSize', 14);
            drawnow;
        end
    end
    iRow = iRow -1;
end
guidata(hObject, handles);
pause(0);


function clear_print(handles)
axes(handles.axes1);
cla;
