SELECT product_id,
       name,
       price,
       Row_number()
         OVER(
           ORDER BY price DESC) product_number,
       Rank()
         OVER(
           ORDER BY price DESC) product_rank,
       Dense_rank()
         OVER(
           ORDER BY price DESC) product_dense_rank
FROM   products 