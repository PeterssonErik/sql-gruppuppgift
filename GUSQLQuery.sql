USE [ SQLDB GruppUppgift]
GO

SELECT playerID, playerName, playerEmail, registerDate, countryName AS country, genderName AS gender
FROM dbo.player
JOIN dbo.gender ON player.genderID = gender.genderID
JOIN dbo.country ON player.countryID = country.countryID;  

SELECT dbo.player.playerID, characterName, creationDate, class, raceName, characterGender, town, worldName, dbo.characterr.characterID
FROM dbo.characterr
JOIN dbo.player ON characterr.playerID = player.playerID
JOIN dbo.class ON characterr.classID = class.classID
JOIN dbo.race ON characterr.raceID = race.raceID
JOIN dbo.characterGender ON characterr.characterGenderID = characterGender.characterGenderID
JOIN dbo.hearthstone ON characterr.hearthstoneID = hearthstone.hearthstoneID
JOIN dbo.worldConnectCharacter ON characterr.characterID = worldConnectCharacter.characterID
JOIN dbo.world ON worldConnectCharacter.worldID = world.worldID
	
GO


