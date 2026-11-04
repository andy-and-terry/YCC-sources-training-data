function out = interleave(varargin)
  longest = max(cellfun(@numel, varargin));
  out = '';
  for i = 1:longest
    for k = 1:numel(varargin)
      if i <= numel(varargin{k})
        out(end+1) = varargin{k}(i);
      end
    end
  end
end

disp(interleave('abc', '12345'));
disp(interleave('ab', 'cd', 'efg'));
