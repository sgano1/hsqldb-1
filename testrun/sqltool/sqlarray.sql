/*
 * $Id: sqlarray.sql 3615 2010-06-02 11:17:43Z unsaved $
 *
 * Tests basic usage of SQL Arrays
 */

CREATE TABLE a (i BIGINT PRIMARY KEY, ar INTEGER ARRAY);

INSERT INTO a VALUES (1, array [11, null, 13]);
INSERT INTO a VALUES (2, null);
INSERT INTO a VALUES (3, array [21, 22]);

* ROWCOUNT _
SELECT count(*) FROM a;

* if (*ROWCOUNT != 3)
    \q Failed to insert 3 rows with SQL Values
* end if

* ROWCOUNT _
 SELECT count(*) FROM a WHERE i = 1 AND ar[3] = 13;
* if (*ROWCOUNT != 1)
    \q Failed to read imported SQL Array Element
* end if
