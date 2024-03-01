/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

select *, to_char(100*"total revenue"/sum(revenue) OVER (), 'FM909.90') as "percent revenue"
from(
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
    ) as subq1
) as subq2;
