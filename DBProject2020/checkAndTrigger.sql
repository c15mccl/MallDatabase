--check constraint
alter table EMPLOYEES add constraint hours_check CHECK (
    hours_worked <= 40);
    
--trigger customer and shop
drop TRIGGER isShopping1;
drop TRIGGER isShopping2;
ALTER TABLE CUSTOMER ADD 
    (isShopping integer DEFAULT 0);
UPDATE CUSTOMER SET isShopping = 1;
ALTER TABLE CUSTOMER ADD CONSTRAINT isShopping   
    CHECK (isShopping > 0) 
        DEFERRABLE INITIALLY DEFERRED;
CREATE OR REPLACE TRIGGER isShopping1
    AFTER INSERT ON SHOP FOR EACH ROW
        BEGIN
            UPDATE CUSTOMER
            SET isShopping = isShopping + 1
            WHERE cID = :NEW.customerID;
        END;
        /
CREATE OR REPLACE TRIGGER isShopping2
    AFTER DELETE ON SHOP FOR EACH ROW
        BEGIN
            UPDATE CUSTOMER
            SET isShopping = isShopping - 1
            WHERE cID = :OLD.customerID;
        END;
        /
        
    
        
    
    
