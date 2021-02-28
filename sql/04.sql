/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

select title from film
inner join inventory on film.film_id=inventory.film_id
inner join rental on inventory.inventory_id=rental.inventory_id
inner join customer on rental.customer_id=customer.customer_id
where customer.customer_id = 1
group by film.film_id
having count(film.film_id) > 1;
