T = [0, 0.8/3, 0, 0.8/3, 0, 0;
    1/3, 0, 1/2, 0, 0.4, 0;
    1/3, 0.8/3, 0, 0.8/3, 0, 0;
    1/3, 0, 1/2, 0, 0.4, 0;
    0, 0.8/3, 0,0.8/3 ,0,0;
    0, 0.2, 0, 0.2, 0.2, 1];

x0 = [0.25;0.125;0.25;0.25;0.125;0];

states = ['1','3','5','7','9'];

crawl(T,s,6);
c = cell(1,1e6);

for i = 1 : 1e6
    st = randV();
    state = crawl(T,st,6);
    c{1,i} = state;
end

count = 0;
sw = [1,2,3,4,5,6];
for i = 1 : 1e6
    x = c{1,i};
    if isequal(sw,x)
        count = count + 1;
    end
end

prob = count/1e6;

prob_f = 0.25 * T(1,2) * T(3,2) * T(4,3) * T(4,5) * T(6,5);

count = 0;
count2 = 0;
for i = 1 : 1e6
    x = c{1,i};
    if x(1,1) == 1
        count = count + length(x)-1;
        count2 = count2 + 1;
    end
end

l = count/count2;

function [s] = randV()
    v = rand();
    s = 1;
    if v >0.25 && v<0.375
        s = 2;
    end
    if v>=0.375 && v < 0.6250
        s = 3;
    end
    if v>=0.6250 && v < 0.8750
        s = 4;
    end
    if v>=0.8750 && v < 1
        s = 5;
    end
end

function [str] = state_to_str(state)
 
    k = ['1','3','5','6','9'];
    st = "";
    for i=1:length(state)-1
        st = st + k(1,i);
    end
    str = st;

end

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