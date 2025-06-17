DROP PROCEDURE IF EXISTS CreateOrder;

CREATE PROCEDURE CreateOrder(
    IN inOrderID INT,
    IN inCustomerID INT,
    IN inOrderDate DATE,
    IN inProductID1 INT, IN inQuantity1 INT, IN inUnitPrice1 DECIMAL(10,2),
    IN inProductID2 INT, IN inQuantity2 INT, IN inUnitPrice2 DECIMAL(10,2)
)
BEGIN
    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
    VALUES (inOrderID, inCustomerID, inOrderDate, 0);

    INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
    VALUES (inOrderID, inProductID1, inQuantity1, inUnitPrice1),
           (inOrderID, inProductID2, inQuantity2, inUnitPrice2);

    UPDATE Orders
    SET OrderTotalAmount = (SELECT SUM(PurchaseQuantity * UnitPrice) FROM OrderItems WHERE OrderID = inOrderID)
    WHERE OrderID = inOrderID;
END;