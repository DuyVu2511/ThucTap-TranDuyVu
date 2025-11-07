CREATE DATABASE TouhouSpellCards;
GO

USE TouhouSpellCards;
GO


CREATE TABLE Game (
    GameTitle NVARCHAR(100) PRIMARY KEY,
    ReleaseYear INT
);


-- 4. Tạo bảng SpellCard
CREATE TABLE SpellCard (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    GameTitle NVARCHAR(100) NOT NULL,
    BossName NVARCHAR(100) NOT NULL,
    StageType NVARCHAR(50) NOT NULL,        
    CardType NVARCHAR(50) NOT NULL,        
    SpellName NVARCHAR(200) NOT NULL,       
    Difficulty NVARCHAR(50) NOT NULL,       
    Stage NVARCHAR(50) NOT NULL,           
    VideoURL NVARCHAR(500) NULL,

    CONSTRAINT FK_SpellCard_Game FOREIGN KEY (GameTitle) REFERENCES Game(GameTitle)
);


INSERT INTO Game (GameTitle, ReleaseYear)
VALUES 
('Touhou 6 - Embodiment of Scarlet Devil', 2002);


INSERT INTO SpellCard (GameTitle, BossName, StageType, CardType, SpellName, Difficulty, Stage, VideoURL)
VALUES
-- MidBoss Non-Spell
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Non-Spell','Non-Spell 1','Easy','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Non-Spell','Non-Spell 1','Normal','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Non-Spell','Non-Spell 1','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Non-Spell','Non-Spell 1','Lunatic','Stage 1',NULL),

-- MidBoss Spell Card
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Spell Card','Moon Sign "Moonlight Ray"','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','MidBoss','Spell Card','Moon Sign "Moonlight Ray"','Lunatic','Stage 1',NULL),

-- Boss Non-Spell 1
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 1','Easy','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 1','Normal','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 1','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 1','Lunatic','Stage 1',NULL),

-- Boss Spell Card 1
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Night Sign "Night Bird"','Easy','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Night Sign "Night Bird"','Normal','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Night Sign "Night Bird"','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Night Sign "Night Bird"','Lunatic','Stage 1',NULL),

-- Boss Non-Spell 2
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 2','Easy','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 2','Normal','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 2','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Non-Spell','Non-Spell 2','Lunatic','Stage 1',NULL),

-- Boss Spell Card 2
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Darkness Sign "Demarcation"','Easy','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Darkness Sign "Demarcation"','Normal','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Darkness Sign "Demarcation"','Hard','Stage 1',NULL),
('Touhou 6 - Embodiment of Scarlet Devil','Rumia','Boss','Spell Card','Darkness Sign "Demarcation"','Lunatic','Stage 1',NULL);


select * from Game
select * from SpellCard

drop table Game
drop table SpellCard