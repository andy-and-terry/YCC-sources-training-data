% datetime and duration arithmetic.

t0 = datetime(2024, 1, 31, 8, 30, 0);
fprintf('start: %s\n', char(t0, 'yyyy-MM-dd HH:mm'));

% Add durations
t1 = t0 + hours(36);
fprintf('+36h:  %s\n', char(t1, 'yyyy-MM-dd HH:mm'));

% Calendar durations respect month lengths
t2 = t0 + calmonths(1);
fprintf('+1mo:  %s\n', char(t2, 'yyyy-MM-dd'));

% Difference of two datetimes is a duration
elapsed = t1 - t0;
fprintf('elapsed hours: %.1f\n', hours(elapsed));
fprintf('elapsed days:  %.2f\n', days(elapsed));

% Components
fprintf('weekday: %s\n', char(day(t0, 'name')));
fprintf('year=%d month=%d day=%d\n', year(t0), month(t0), day(t0));

% A range of dates
week = t0 + days(0:6);
fprintf('%s\n', char(week(end), 'eee dd MMM'));

% Comparison
fprintf('t1 later: %d\n', t1 > t0);
