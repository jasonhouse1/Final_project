START TRANSACTION;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
VALUES (101, 3, CURDATE(), 0);

INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
VALUES (101, 2, 2, 800.00),
       (101, 3, 1, 1500.00);

UPDATE Orders
SET OrderTotalAmount = (SELECT SUM(PurchaseQuantity * UnitPrice) FROM OrderItems WHERE OrderID = 101)
WHERE OrderID = 101;

COMMIT;