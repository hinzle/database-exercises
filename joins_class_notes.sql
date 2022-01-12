use join_example_db;
describe roles;

SELECT * 
FROM users
LEFT JOIN roles ON users.role_id = roles.id;


SELECT * 
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT * 
FROM roles
LEFT JOIN users ON roles.id=users.role_id;

SELECT u.email, r.name 
FROM users u
LEFT JOIN roles r
ON u.role_id = r.id;
-- --------
use world;

Select*
from city
left join country
on city.countrycode=countrycode
left join countrylanguage
on city.countrycode=countrylanguage.countrycode;
-- ---------

select*
from city
left join countrylanguage
using(countrycode)