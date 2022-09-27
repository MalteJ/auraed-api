CREATE TABLE IF NOT EXISTS `executable` (
    `aurid` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `exec` varchar(255) NOT NULL,
    `comment` varchar(255) NOT NULL,
    PRIMARY KEY (`aurid`)
);
