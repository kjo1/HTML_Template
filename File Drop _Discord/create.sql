CREATE TABLE Division
(
	idDivision INT IDENTITY,
	DivisionName VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_idDivision PRIMARY KEY (idDivision)
);

CREATE TABLE Fixture
(
	idFixture INT IDENTITY,
	FixtureDateTime DATETIME,
	
	CONSTRAINT pk_idFixture PRIMARY KEY (idFixture)
);

CREATE TABLE Match
(
	idMatch INT IDENTITY,
	MatchDateTime DATETIME,
	Fixture_idFixture INT,
	
	CONSTRAINT pk_idMatch PRIMARY KEY (idMatch),
	CONSTRAINT fk_Match_Fixture FOREIGN KEY (Fixture_idFixture) REFERENCES Fixture
);

CREATE TABLE Position
(
	PositionNum INT NOT NULL,
	
	CONSTRAINT pk_PositionNum PRIMARY KEY (PositionNum)
);

CREATE TABLE Player
(
	idPlayer INT IDENTITY,
	PlayerFirstName VARCHAR(45) NOT NULL,
	PlayerMiddleName VARCHAR(45),
	PlayerLastName VARCHAR(45) NOT NULL,
	PlayerSex CHAR(1) NOT NULL,
	PlayerEmail VARCHAR(45),
	PlayerPhone DECIMAL(11),
	
	CONSTRAINT pk_idPlayer PRIMARY KEY (idPlayer)
);

CREATE TABLE Player_has_Match
(
	Player_idPlayer INT NOT NULL,
	Match_idMatch INT NOT NULL,
	
	CONSTRAINT fk_Player_has_Match_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player,
	CONSTRAINT fk_Player_has_Match_Match FOREIGN KEY (Match_idMatch) REFERENCES Match
);

CREATE TABLE Position_has_Player
(
	Position_PositionNum INT NOT NULL,
	Player_idPlayer INT NOT NULL,
	
	CONSTRAINT fk_Position_has_Player_Position FOREIGN KEY (Position_PositionNum) REFERENCES Position,
	CONSTRAINT fk_Position_has_Player_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player
);

CREATE TABLE TEAM
(
	idTeam INT IDENTITY,
	TeamName VARCHAR(45),
	TeamPoints INT,
	Division_idDivision INT NOT NULL,
	
	CONSTRAINT pk_idTeam PRIMARY KEY (idTeam),
	CONSTRAINT fk_Team_Division FOREIGN KEY (Division_idDivision) REFERENCES Division
);

CREATE TABLE Team_has_Player
(
	Team_idTeam INT NOT NULL,
	Player_idPlayer INT NOT NULL,
	
	CONSTRAINT fk_Team_has_Player_Team FOREIGN KEY (Team_idTeam) REFERENCES Team,
	CONSTRAINT fk_Team_has_Player_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player
);

CREATE TABLE Scores
(
	idScores INT IDENTITY,
	ScoresPoints INT,
	Match_idMatch INT NOT NULL,
	
	CONSTRAINT pk_idScores PRIMARY KEY (idScores),
	CONSTRAINT fk_Scores_Match FOREIGN KEY (Match_idMatch) REFERENCES Match
);

CREATE TABLE Player_has_Scores
(
	Player_idPlayer INT NOT NULL,
	Scores_idScores INT NOT NULL,
	
	CONSTRAINT fk_Player_has_Scores_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player,
	CONSTRAINT fk_Player_has_Scores_Scores FOREIGN KEY (Scores_idScores) REFERENCES Scores
);