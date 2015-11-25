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
SELECT count(*)
FROM user
WHERE username = :username
      AND password = sha1(concat(:salt, :password));

/*3. List Categories, ordered by how many products in that category (highest first). */

SELECT
  category,
  COUNT(product.id) AS productCount
FROM product
GROUP BY category
ORDER BY productCount DESC;

/*4. Show products with 5 star ratings ordered by popularity.*/
SELECT
  product.name,
  AVG(review.rating) AS avRating
FROM product
  JOIN review
    ON product.id = review.product_id
GROUP BY product.name
HAVING avRating >= 4.5
ORDER BY AVG(rating);

/*5. List My Orders, showing image, description, order status, order_id, order_date, delivery_address & total cost.*/
SELECT
  order.status,
  order.id,
  order_date,
  address_line_1,
  address_line_2,
  town,
  county,
  post_code,
  country,
  order_total
FROM `order`
  JOIN address
    ON order.user_id = address.user_id
WHERE `order`.user_id = :user;
/*6. List all items in a particular Order showing photo, description, Quantity, cost per item, line total.*/
SELECT
  product.image,
  product.description,
  order_item.quantity,
  order_item.price_per_item,
  order_item.item_total
FROM product
  JOIN order_item
    ON product_id = product.id
WHERE order_id = 2;

/*7. Show all products which are currently on offer (ordered by %age off) [if you have implemented offers]*/
SELECT
  product.name,
  ((product.retail_price - product.discount_price) / product.retail_price) * 100 AS 'percentage'
FROM product
WHERE discount_price != 0
ORDER BY percentage DESC;
.

/*8. Search for all items in a particular category matching (or closely matching) my search key word(s)*/
SELECT
  product.name,
  product.category
FROM product
WHERE category SOUNDS LIKE (:category);
/*GROUP BY product.name;*/

/*9. Recommend products to me which were bought by people who also purchased my last item.*/
SELECT user_id
FROM order_item
  JOIN `order`
    ON order_item.order_id = order.id
WHERE order_item.product_id = 1
GROUP BY `order`.user_id;


SELECT order_item.product_id, count(product_id) AS productCount, product.name
FROM `order`
  JOIN `order_item`
    ON order_item.order_id = order.id
  JOIN (SELECT user_id
        FROM order_item
          JOIN `order`
            ON order_item.order_id = order.id
        WHERE order_item.product_id = :lastProduct
        GROUP BY `order`.user_id) AS specialUser
    ON `order`.user_id = specialUser.user_id
  JOIN product
  ON product.id = order_item.product_id
GROUP BY product_id
ORDER BY productCount DESC;


# product.name
# FROM product
# JOIN order_item
# ON product_id = product.id
#
# JOIN user
# ON user_id = user.id




/*10. Show my items in a particular category, between price range, with an average review rating of 3-4 stars.*/
SELECT product.name, product.retail_price, review.rating
FROM product
  JOIN review
    ON review.product_id=product.id
  JOIN order_item
    ON order_item.product_id = product.id
  JOIN `order`
    ON order_id = order.id
  JOIN user
    ON order.user_id = user.id
  WHERE user.id = 2
    AND product.retail_price BETWEEN 60 AND 120
    AND review.rating BETWEEN 3 AND 4;

# Front - end

1. Write a simple front end script that will display the output of a query in a nice tabular form.
