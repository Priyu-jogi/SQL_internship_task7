 -- Task :Creating Views
 
-- database 
USE library_management_system;

-- 1. Create a view to show issued books with reader and staff details
CREATE VIEW IssuedBooksView AS
SELECT 
    i.issue_id,
    r.first_name,
    r.last_name,
    b.title AS book_title,
    s.name AS staff_name,
    i.issue_date
FROM Issue i
JOIN Readers r ON i.reader_id = r.reader_id
JOIN Books b ON i.isbn = b.isbn
JOIN Staff s ON i.staff_id = s.staff_id;

-- View usage example
SELECT * FROM IssuedBooksView;

-- 2. Create a view for readers who never issued a book
CREATE VIEW ReadersWithoutIssues AS
SELECT r.reader_id, r.first_name, r.last_name
FROM Readers r
LEFT JOIN Issue i ON r.reader_id = i.reader_id
WHERE i.issue_id IS NULL;

-- View usage example
SELECT * FROM ReadersWithoutIssues;

-- 3. Create a view to show Fiction books only
CREATE VIEW FictionBooks AS
SELECT isbn, title, author, publisher, price
FROM Books
WHERE category = 'Fiction';

-- View usage example
SELECT * FROM FictionBooks;

-- 4. Update through a view (only if view is updatable)
-- Example: Update price for a Fiction book
UPDATE FictionBooks
SET price = 300.00
WHERE isbn = 'FIC123';

select * from   FictionBooks ;

-- 5. Drop a view
DROP VIEW IF EXISTS FictionBooks;

select *from  FictionBooks ;
