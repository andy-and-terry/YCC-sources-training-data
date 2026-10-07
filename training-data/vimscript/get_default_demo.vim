let config = {'timeout': 30, 'retries': 3}

let timeout = get(config, 'timeout', 10)
let verbose = get(config, 'verbose', 0)

let items = ['a', 'b', 'c']
let third = get(items, 2, 'none')
let tenth = get(items, 9, 'none')

echo timeout
echo verbose
echo third
echo tenth
