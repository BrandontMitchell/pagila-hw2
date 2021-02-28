/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

select distinct(title) from inventory
inner join film on inventory.film_id=film.film_id
where film.film_id not in 
(
    select film_id
    from rental
    inner join customer on rental.customer_id=customer.customer_id
    inner join address on customer.address_id=address.address_id
    inner join city on address.city_id=city.city_id
    inner join country on city.country_id=country.country_id
    inner join inventory on rental.inventory_id=inventory.inventory_id
    where country = 'United States'
)
order by title asc;
