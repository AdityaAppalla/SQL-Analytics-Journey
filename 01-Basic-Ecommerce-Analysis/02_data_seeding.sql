USE Analysis;

-- Populating Customers (JoJo's Theme )
INSERT INTO customers VALUES
(121, "Jonathan","Joestar","Liverpool","012-112-1880"),
(131, "Joseph","Joestar","New York","013-113-1938"),
(135, "Jotaro","Kujo","Tokyo","014-114-1988"),
(137, "Josuke","Higashikata","Morioh","015-115-1999"),
(139, "Giorno","Giovanna","Naples","016-116-2001"),
(140, "Jolyne","Cujoh","Florida","017-116-2011"),
(141, "Johnny","Joestar","San Diego","018-116-1890"),
(143, "Josuke","Higashikata","Morioh","019-116-2011"),
(145, "Jodio","Joestar","Hawaii","020-116-2020");

-- Populating Products (Pokemon Theme)
INSERT INTO products VALUES
(001,"Poke Ball",9.99),
(002,"Great Ball",19.99),
(003,"Ultra Ball",39.99),
(004,"Love Ball",59.99),
(005,"Beast Ball",89.99),
(006,"Master Ball",999.99);

-- Orders
INSERT INTO orders VALUES
(501, 121,"2005-03-21",159.96),
(523, 131,"2005-01-01",3999.96),
(534, 135,"2005-11-20",359.96),
(555, 139,"2006-02-09",49.95),
(051, 141,"1890-06-17",629.90),
(566, 143,"2007-07-11",999.99),
(589, 137,"2008-03-28",119.98),
(050, 141,"1890-06-06",1089.98);

-- Post realization updates to correct order totals calculation
UPDATE orders SET total_amount = 359.96 WHERE order_id = 534;
UPDATE orders SET total_amount = 629.90 WHERE order_id = 051;

-- Linking Orders to Products
INSERT INTO order_items VALUES
(601, 501, 003, 4),
(602, 523, 006, 4),
(603, 534, 005, 4),
(604, 555, 001, 5),
(605, 051, 005, 6),
(606, 051, 004, 1),
(607, 051, 001, 3),
(608, 566, 006, 1),
(609, 589, 004, 2),
(610, 050, 005, 1),
(611, 050, 006, 1);

COMMIT;
