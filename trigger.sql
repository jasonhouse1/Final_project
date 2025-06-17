DROP TRIGGER IF EXISTS ReduceStock;

CREATE TRIGGER ReduceStock AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.PurchaseQuantity
    WHERE ProductID = NEW.ProductID;
END;