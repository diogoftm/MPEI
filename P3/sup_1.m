% a state transition matrix example
H = [0.8 0 0 0.3 0; 0.2 0.6 0 0.2 0; 0 0.3 1 0 0; 0 0.1 0 0.4 0; 0 0 0 0.1 1];
% how to use crawl()
v = 0;
v3 = 0;
v5 = 0;
for i = 1 : 1000
    state = crawl(H, 1, [3,5]);
    v = v + length(state) - 1;
    if state(1,length(state)) == 3
        v3 = v3 + 1;
    else
        v5 = v5 + 1;
    end
end
v = v/1000 %average of steps 'til absorbency
p3 = v3/1000 %probability to be absorved by state 3
p5 = v5/1000 %probability to be absorved by state 5

c = cell(1,10000);
s = [1,2,4];
for i = 1 : 10000
    st = s(1,randi(3,1));
    c{1,i} = crawl(H, st, [3,5]);
end



% Note:
% if the Markov chain has more than 1 absorbing state the third argument
% must be a vector with the absorbing states
% for example in a chain with 5 states and considering that
% states 4 and 5 are absorbing states:
% state = crawl(H5, 1, [4 5])
%
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
% the sequence of states will be saved in the vector "state"
% initially, the vector contains only the initial state:
state = [first];
% keep moving from state to state until state "last" is reached:
while (1)
state(end+1) = nextState(H, state(end));
if ismember(state(end), last) % verifies if state(end) is absorbing
break;
end
end
end
% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
% find the probabilities of reaching all states starting at the current one:
probVector = H(:,currentState); % probVector is a row vector
n = length(probVector); %n is the number of states
% generate the next state randomly according to probabilities probVector:
state = discrete_rnd(1:n, probVector);
end
% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
U=rand();
i = 1 + sum(U > cumsum(probVector));
state= states(i);
end