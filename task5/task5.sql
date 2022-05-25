CREATE TABLE observer
(
	user VARCHAR(30) NOT NULL,
	time TIMESTAMP NOT NULL,
	
	kt INTEGER,
	nt VARCHAR(20), 
	mothfee NUMERIC(12,2),
	mothmins INTEGER,
	minfee NUMERIC(12,2)
);

CREATE FUNCTION update_observer()
	RETURNS TRIGGER AS
$$
BEGIN
	INSERT INTO observer
	SELECT session_user, now(), nt.*
	FROM n nt;
END
$$
	LANGUAGE 'plpgsql'


CREATE TRIGGER observer_trigger
	AFTER UPDATE
	ON t
	REFERENCING NEW TABLE AS n
	FOR EACH STATEMENT EXECUTE PROCEDURE update_observer();