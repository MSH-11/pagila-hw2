/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

select distinct f.title
from film f
join inventory i using(film_id)
join rental r using(inventory_id)
join customer c using(customer_id)
where i.film_id in (
    select i.film_id
    from inventory i
    join rental r using(inventory_id)
    where customer_id = 1
    group by i.film_id
    order by count(*) desc
    limit 2);

