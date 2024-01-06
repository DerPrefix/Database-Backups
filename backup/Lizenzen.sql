USE App_Nicklas;
DROP TABLE IF EXISTS Lizenzen;
CREATE TABLE Lizenzen (
Lizenz VARCHAR(255), User VARCHAR(255), Note VARCHAR(255));
INSERT INTO Lizenzen VALUES ('3C7S6DLR7QJ', 'Nicklas', '{"Bio": [4.0, 1.0], "Chemie": [6.0, 4.0, 3.0], "Deutsch": [4.0, 2.0, 1.0, 1.0, 3.0], "Englisch": [3.0, 5.0, 3.0, 3.0], "Ethik": [4.0, 3.0, 2.0], "Geo": [6.0, 4.0, 2.0], "Geschichte": [2.0, 4.0, 2.0], "Hauswirtschaft": [1.0, 2.0, 3.0, 3.0], "Kunst": [3.0], "Mathe": [6.0, 6.0, 4.0, 4.0, 3.0, 3.0], "Musik": [2.0, 5.0, 2.0, 3.0], "Physik": [2.0, 2.0], "Sozi": [2.0, 2.0, 4.0, 4.0], "Technik": [2.0, 4.0], "Wirtschaft": [3.0, 2.0]}');
