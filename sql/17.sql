/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */

select *, sum(revenue) OVER (ORDER BY rank) as "total revenue"
from (
    select
        RANK () OVER (
            ORDER BY COALESCE(SUM(p.amount), 0.00) DESC
        ) as rank,
        f.title,
        COALESCE(SUM(p.amount), 0.00) as revenue
    from
        film f
    left join inventory i on f.film_id = i.film_id
    left join rental r on i.inventory_id = r.inventory_id
    left join payment p on r.rental_id = p.rental_id
    group by f.title
    order by revenue DESC, title
) as subq;
