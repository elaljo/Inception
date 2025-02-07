-- 1. Remove Anonymous Users - common security practice
DELETE FROM mysql.user WHERE User='';

-- 2. Create a New User - The '%' symbol means the user can connect from any host.
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';

-- 3. Grant Privileges to the New User - WITH GRANT OPTION allows the user to grant privileges to others, giving them administrative powers.
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;

-- 4. Apply Changes
FLUSH PRIVILEGES;

-- 5. Remove the Test Database - Deletes the default test database, which can be a security risk if left in place.
DROP DATABASE IF EXISTS test;

-- 6. Apply Changes Again - Ensures the changes related to the dropped database and user permissions are fully applied.
FLUSH PRIVILEGES;