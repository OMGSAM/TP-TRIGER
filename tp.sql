--exo1

CREATE TRIGGER after_update_client
AFTER UPDATE ON Clients
FOR EACH ROW
BEGIN
    IF NEW.Compte > 1000 THEN
        UPDATE Clients
        SET Compte = NEW.Compte + 10
        WHERE IdClient = NEW.IdClient;
    END IF;
END;


--EXO2


CREATE TRIGGER after_insert_emprunt
AFTER INSERT ON Emprunts
FOR EACH ROW
BEGIN
    UPDATE Emprunts
    SET DateRetour = DATE_ADD(NEW.DateSortie, INTERVAL 14 DAY)
    WHERE NumE = NEW.NumE;
END;



-EXO3


CREATE TRIGGER before_insert_update_client
BEFORE INSERT OR UPDATE ON Clients
FOR EACH ROW
BEGIN
    SET NEW.Tél = REPLACE(REPLACE(NEW.Tél, '-', '.'), ' ', '.');
END;
