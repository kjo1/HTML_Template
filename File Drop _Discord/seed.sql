INSERT INTO Division(DivisionName) VALUES
(
	'White Oaks'
);
INSERT INTO Division(DivisionName) VALUES
(
	'Red Oaks'
);

INSERT INTO Fixture(FixtureDateTime) VALUES
(
	GETDATE()
);

INSERT INTO Match(MatchDateTime, Fixture_idFixture) VALUES
(
	GETDATE(), 1
);

INSERT INTO Position(PositionNum) VALUES
(
	1
);
INSERT INTO Position(PositionNum) VALUES
(
	2
);

INSERT INTO Player(PlayerFirstName, PlayerLastName, PlayerSex) VALUES
(
	'Kevin', 'McGrinder', 'M'
);

INSERT INTO Player_has_Match(Player_idPlayer, Match_idMatch) VALUES
(
	1, 1
);
INSERT INTO Position_has_Player(Position_PositionNum, Player_idPlayer) VALUES
(
	1, 1
);

INSERT INTO TEAM(TeamName, TeamPoints, Division_idDivision) VALUES
(
	'Squash Team', 45, 1
);

INSERT INTO Team_has_Player(Team_idTeam, Player_idPlayer) VALUES
(
	1, 1
);

INSERT INTO Scores(ScoresPoints, Match_idMatch) VALUES
(
	3, 1
);

INSERT INTO Player_has_Scores(Player_idPlayer, Scores_idScores) VALUES
(
	1, 1
);