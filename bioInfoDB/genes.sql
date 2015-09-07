
-- Definitions
DROP DATABASE IF EXISTS bioInfo;
CREATE DATABASE bioInfo; -- create new database
USE bioInfo; -- use that new database


CREATE TABLE GENE (
	g_sequence CHAR(32) NOT NULL, 
	id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE TRANSCRIPTION_FACTOR (
	tf_name CHAR(32) NOT NULL,
	id INT PRIMARY KEY AUTO_INCREMENT,
	FOREIGN KEY (b_id) REFERENCES (BINDING.id)
);

CREATE TABLE BINDING (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	b_sequence CHAR(32) NOT NULL, 
	FOREIGN KEY (g_id) REFERENCES (GENE.id)
);

CREATE VIEW regulation AS 
	SELECT g_id AS id,tf_name,b_sequence,g_sequence 
	FROM TRANSCRIPTION_FACTOR AS A JOIN BINDING AS B JOIN GENE AS C 
	ON A.b_id = B.id AND C.id = B.g_id;

CREATE VIEW is_called AS 
	SELECT g_id AS id, g_name AS gene_name, g_sequence AS gene_sequence 
	FROM GENE AS A JOIN GENE_NAME AS B 
	ON A.id = B.g_id;

CREATE VIEW encodes AS 
	SELECT b_id AS id,g_sequence AS gene_sequence, tf_name as transcription_factor 
	FROM GENE AS A JOIN TRANSCRIPTION_FACTOR AS B 
	ON A.id = B.b_id;
 
-- Filler data
INSERT INTO GENE (g_sequence) VALUES ("ATTAT");
INSERT INTO GENE (g_sequence) VALUES ("GTDAT");
INSERT INTO GENE (g_sequence) VALUES ("GGADT");

INSERT INTO GENE_NAME (g_name,g_id) VALUES ("kl0022",1);
INSERT INTO GENE_NAME (g_name,g_id) VALUES ("1072er",2);
INSERT INTO GENE_NAME (g_name,g_id) VALUES ("xx06a70",3);

INSERT INTO TRANSCRIPTION_FACTOR (tf_name,b_id) VALUES ("protein0",1);
INSERT INTO TRANSCRIPTION_FACTOR (tf_name,b_id) VALUES ("protein1",2);
INSERT INTO TRANSCRIPTION_FACTOR (tf_name,b_id) VALUES ("protein2",3);

INSERT INTO BINDING (b_sequence,g_id) VALUES ("AATTTAT",1);
INSERT INTO BINDING (b_sequence,g_id) VALUES ("ATTGGTTA",2);
INSERT INTO BINDING (b_sequence,g_id) VALUES ("DDTTAAG",3);
