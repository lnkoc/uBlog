-- as root
CREATE DATABASE blogdb;
GRANT ALL PRIVILEGES ON blogdb.* TO 'lnkoc'@'localhost' IDENTIFIED BY 'lnkoc';

-- as user
CREATE TABLE ARTICLES(
    ID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(255),
    INTRO VARCHAR(300),
    CONTENT VARCHAR(3000),
    CREATED TIMESTAMP NOT NULL
);
