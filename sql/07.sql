/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */

select distinct f.title
from film f
join inventory i using(film_id)
where i.film_id not in (
    select i.film_id
    from inventory i
    join rental r using(inventory_id)
    join customer c using(customer_id)
    join address a using(address_id)
    join city ct using(city_id)
    join country cr using(country_id)
    where cr.country_id = 103)
order by f.title;

