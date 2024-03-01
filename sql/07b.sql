/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct f.title
from film f
join inventory i using(film_id)
left join (
    select distinct f.title
    from film f
    join inventory i using(film_id)
    join rental r using(inventory_id)
    join customer c using(customer_id)
    join address a using(address_id)
    join city ct using(city_id)
    join country cr on ct.country_id = cr.country_id and cr.country_id = 103) as rented_by_americans on f.title = rented_by_americans.title
where rented_by_americans.title is null
order by f.title;
