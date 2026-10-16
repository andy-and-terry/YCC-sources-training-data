cfg.server.host = 'localhost';
cfg.server.port = 8080;
cfg.debug = false;
cfg.server.port = cfg.server.port + 1;
cfg.tags = {'a', 'b'};
fprintf('%s:%d\n', cfg.server.host, cfg.server.port);
cfg.tags{end+1} = 'c';
disp(numel(cfg.tags));
