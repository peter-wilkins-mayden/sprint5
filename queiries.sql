# Queries to write for online shop

/*1. Insert new user.*/
INSERT INTO user (`username`, `salt`, `password`, `first_name`,
`last_name`,
`email`,
`telephone`,
`mobile`)
VALUES (:username, :salt, :password, :first_name,
:last_name,
:email,
:telephone,
:mobile);

/*2. Authenticate/login user.*/
SELECT  salt, password FROM user u
WHERE username = :username;

/*3. List Categories, ordered by how many products in that category (highest first). */

SELECT category, COUNT(product.id) FROM product
GROUP BY category;

/*4. Show products with 5 star ratings ordered by popularity.*/
SELECT product.name FROM product
JOIN review ON product.id=review.product_id
WHERE rating=5
GROUP BY product.name
ORDER BY AVG(rating);

/*5. List My Orders, showing image, description, order status, order_id, order_date, delivery_address & total cost.*/
SELECT
/*6. List all items in a particular order showing photo, description, Quantity, cost per item, line total.
7. Show all products which are currently on offer (ordered by %age off) [if you have implemented offers]
8. Search for all items in a particular category matching (or closely matching) my search key word(s)
9. Recommend products to me which were bought by people who also purchased my last item.
10. Show my items in a paricular category, between price range, with an average review rating of 3-4 stars.


# Front - end

1. Write a simple front end script that will display the output of a query in a nice tabular form.