function state = fsm_step(state, event)
    transitions = struct( ...
        'locked_coin', 'unlocked', ...
        'locked_push', 'locked', ...
        'unlocked_coin', 'unlocked', ...
        'unlocked_push', 'locked');
    key = [state '_' event];
    if isfield(transitions, key)
        state = transitions.(key);
    end
end

state = 'locked';
events = {'push', 'coin', 'push', 'coin', 'coin'};
for i = 1:numel(events)
    state = fsm_step(state, events{i});
    disp(state)
end
