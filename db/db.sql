CREATE TABLE location
(
	office varchar(50) PRIMARY KEY
);

CREATE TABLE team
(
	team_code varchar(20) PRIMARY KEY
);

CREATE TABLE employee
(
	employee INTEGER PRIMARY KEY,
	fn VARCHAR(20) NOT NULL,
	ln VARCHAR(20) NOT NULL,
	position VARCHAR(64) NOT NULL,
	salary INTEGER CHECK (salary > 0),
	office_loc VARCHAR(20) REFERENCES location(office),
	team_code VARCHAR(20) REFERENCES team(team_code)
);

CREATE TABLE project
(
	n INTEGER PRIMARY KEY,
	cc VARCHAR(20) REFERENCES customer(cc),
	team_code VARCHAR(20) REFERENCES team(team_code),
	dl TIMESTAMP NOT NULL
);