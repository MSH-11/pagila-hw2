/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select a.last_name, a.first_name
from actor a
left join customer c on (a.last_name || a.first_name) = (c.last_name || c.first_name)
where c.customer_id is null;

