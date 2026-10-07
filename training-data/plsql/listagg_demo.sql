CREATE TABLE team_members (
    team VARCHAR2(20),
    member VARCHAR2(20)
);

INSERT INTO team_members VALUES ('Core', 'Zed');
INSERT INTO team_members VALUES ('Core', 'Amy');
INSERT INTO team_members VALUES ('Core', 'Kim');
INSERT INTO team_members VALUES ('Web', 'Bob');
INSERT INTO team_members VALUES ('Web', 'Lee');

BEGIN
    FOR rec IN (
        SELECT team,
               COUNT(*) AS members,
               LISTAGG(member, ', ') WITHIN GROUP (ORDER BY member) AS roster
        FROM team_members
        GROUP BY team
        ORDER BY team
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.team || ' (' || rec.members || '): ' || rec.roster);
    END LOOP;
END;
/
