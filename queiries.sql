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
SELECT image, description, order_status, order_id, order_date, delivery_address, total cost
FROM `order`
WHERE user_id=:user;
/*6. List all items in a particular Order showing photo, description, Quantity, cost per item, line total.*/
SELECT product.image, product.description, order_item.quantity,
  order_item.price_per_item, order_total
FROM product
  JOIN order_item
ON product_id = product.id
JOIN `order`
ON order_id = order.id
WHERE order_id = 1;

/*7. Show all products which are currently on offer (ordered by %age off) [if you have implemented offers]*/
SELECT product.name, ((product.retail_price-product.discount_price)/product.retail_price)*100 AS 'percentage'
FROM product
WHERE discount_price !=0
ORDER BY percentage DESC;

/*8. Search for all items in a particular category matching (or closely matching) my search key word(s)*/
SELECT product.name, product.category
FROM product
WHERE category SOUNDS LIKE (:category);
/*GROUP BY product.name;*/

/*9. Recommend products to me which were bought by people who also purchased my last item.*/
SELECT product.name
FROM product
JOIN order_item
ON product_id = product.id
JOIN order
ON order_id = order.id
JOIN user
ON user_id = user.id;


/*10. Show my items in a particular category, between price range, with an average review rating of 3-4 stars.


# Front - end

1. Write a simple front end script that will display the output of a query in a nice tabular form.
