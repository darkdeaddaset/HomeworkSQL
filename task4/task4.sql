//task4
CREATE OR REPLACE PROCEDURE edit_salary(
)
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    rec RECORD;
    cur CURSOR FOR SELECT * FROM s WHERE salary < 50;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO rec;
        IF NOT FOUND THEN
            EXIT;
        END IF;
        rec.salary = 50;
        UPDATE s SET salary = rec.salary WHERE CURRENT OF cur;
    END LOOP;
END;
$BODY$;

CALL edit_salary();

SELECT * FROM s;