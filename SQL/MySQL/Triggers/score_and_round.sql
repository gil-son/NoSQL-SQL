CREATE DATABASE IF NOT EXISTS score_and_round;
USE score_and_round;

CREATE TABLE IF NOT EXISTS tbl_player
(
	id_player INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    genre ENUM('M','F')
);

CREATE TABLE IF NOT EXISTS tbl_score
(
	id_score INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_player INT NOT NULL,
    score INT DEFAULT 0,
    FOREIGN KEY(id_player) REFERENCES tbl_player(id_player)
);

CREATE TABLE IF NOT EXISTS tbl_round
(
	id_round INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_score INT NOT NULL,
    id_player INT NOT NULL,
    point INT DEFAULT 0,
    FOREIGN KEY(id_score) REFERENCES tbl_score(id_score),
    FOREIGN KEY(id_player) REFERENCES tbl_player(id_player)
);

INSERT INTO tbl_player (name, genre) VALUES('Aaa','F'), ('Bbb','M'), ('Ccc','M'), ('Ddd','F');  SELECT * FROM  tbl_player;
INSERT INTO tbl_score (id_player) VALUES (1),(2),(3),(4); SELECT * FROM tbl_score;

/* ALERT! WHEN CREATE A TRIGGER, USE OTHER FILE SQL. BECAUSE CAN INTERFERE

DELIMITER $
CREATE TRIGGER tgr_register_points AFTER INSERT 
ON tbl_round
FOR EACH ROW
BEGIN
	UPDATE tbl_score SET score = score + NEW.point
	WHERE id_score = NEW.id_player;
END$
DELIMITER ;


-- DROP TRIGGER tgr_register_points;
*/

-- ROUND 1
INSERT INTO tbl_round (id_score,id_player,point) VALUES(1,1,10),(2,2,20),(3,3,30),(4,4,30);
SELECT * FROM tbl_score;
SELECT * FROM tbl_round;

-- ROUND 2
INSERT INTO tbl_round (id_score,id_player,point) VALUES(1,1,1),(2,2,2),(3,3,3),(4,4,3);
SELECT * FROM tbl_score;
SELECT * FROM tbl_round;

-- ROUND 3
INSERT INTO tbl_round (id_score,id_player,point) VALUES(1,1,4),(2,2,3),(3,3,2),(4,4,2);
SELECT * FROM tbl_score;
SELECT * FROM tbl_round;



-- DROP database score_and_round;

