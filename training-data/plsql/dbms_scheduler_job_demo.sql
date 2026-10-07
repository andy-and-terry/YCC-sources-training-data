-- DBMS_SCHEDULER for recurring background jobs, an alternative to
-- hand-rolled DBMS_JOB submissions for periodic maintenance tasks.
CREATE TABLE job_run_log (
    run_time TIMESTAMP,
    message VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE log_job_run IS
BEGIN
    INSERT INTO job_run_log VALUES (SYSTIMESTAMP, 'scheduled run completed');
    COMMIT;
END log_job_run;
/

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'nightly_maintenance_job',
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'log_job_run',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=2',
        enabled         => TRUE
    );
END;
/

-- Run it once immediately for demonstration purposes.
BEGIN
    DBMS_SCHEDULER.RUN_JOB('nightly_maintenance_job');
END;
/

SELECT * FROM job_run_log;
