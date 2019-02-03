CREATE TABLE Division
(
	idDivision INT IDENTITY,
	DivisionName VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_idDivision PRIMARY KEY (idDivision)
);

CREATE TABLE Location
(
	idLocation INT IDENTITY,
	LocationCity VARCHAR(45),
	LocationAddress VARCHAR(45),

	CONSTRAINT pk_idLocation PRIMARY KEY (idLocation)
);

CREATE TABLE Fixture
(
	idFixture INT IDENTITY,
	FixtureDateTime DATETIME,
	Location_idLocation INT,
	HomeScore INT,
	AwayScore INT,
	
	CONSTRAINT pk_idFixture PRIMARY KEY (idFixture),
	CONSTRAINT fk_Fixture_Location FOREIGN KEY (Location_idLocation) REFERENCES Location
);

CREATE TABLE Match
(
	idMatch INT IDENTITY,
	MatchDateTime DATETIME,
	Fixture_idFixture INT,
	
	CONSTRAINT pk_idMatch PRIMARY KEY (idMatch),
	CONSTRAINT fk_Match_Fixture FOREIGN KEY (Fixture_idFixture) REFERENCES Fixture
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
	PlayerPosition INT,
	
	CONSTRAINT pk_idPlayer PRIMARY KEY (idPlayer)
);

CREATE TABLE MatchScores
(
	idMatchScores INT IDENTITY,
	MatchScoresPoints INT,
	Player_idPlayer INT NOT NULL,
	Match_idMatch INT NOT NULL,
	
	CONSTRAINT fk_MatchScores_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player,
	CONSTRAINT fk_MatchScores_Match FOREIGN KEY (Match_idMatch) REFERENCES Match
);

CREATE TABLE Team
(
	idTeam INT IDENTITY,
	TeamName VARCHAR(45),
	TeamPoints INT,
	Division_idDivision INT NOT NULL,
	TeamCaptain_idPlayer INT NOT NULL,
	
	CONSTRAINT pk_idTeam PRIMARY KEY (idTeam),
	CONSTRAINT fk_Team_Player FOREIGN KEY (TeamCaptain_idPlayer) REFERENCES Player,
	CONSTRAINT fk_Team_Division FOREIGN KEY (Division_idDivision) REFERENCES Division
);

CREATE TABLE Team_has_Player
(
	Team_idTeam INT NOT NULL,
	Player_idPlayer INT NOT NULL,
	
	CONSTRAINT fk_Team_has_Player_Team FOREIGN KEY (Team_idTeam) REFERENCES Team,
	CONSTRAINT fk_Team_has_Player_Player FOREIGN KEY (Player_idPlayer) REFERENCES Player
);

CREATE TABLE Fixture_has_Team
(
	Fixture_idFixture INT NOT NULL,
	Team_idTeam INT NOT NULL,

	CONSTRAINT fk_Fixture_has_Team_Fixture FOREIGN KEY (Fixture_idFixture) REFERENCES Fixture,
	CONSTRAINT fk_Fixture_has_Team_Team FOREIGN KEY (Team_idTeam) REFERENCES Team
);

CREATE TABLE TeamPoints
(
	idTeamScores INT IDENTITY,
	Team_idTeam INT NOT NULL,
	Fixture_idFixture INT NOT NULL,
	FixtureScore VARCHAR(15),

	CONSTRAINT pk_idTeamScores PRIMARY KEY (idTeamScores),
	CONSTRAINT fk_TeamPoints_Team FOREIGN KEY (Team_idTeam) REFERENCES Team,
	CONSTRAINT fk_TeamPoints_Fixture FOREIGN KEY (Fixture_idFixture) REFERENCES Fixture
);