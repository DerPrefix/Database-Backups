USE App_Nicklas;
DROP TABLE IF EXISTS passwort_Youtube_App;
CREATE TABLE passwort_Youtube_App (
user_name VARCHAR(255), action VARCHAR(255), reason VARCHAR(255), pw VARCHAR(255));
INSERT INTO passwort_Youtube_App VALUES ('Nicklas', 'access ', 'verify', '123');
