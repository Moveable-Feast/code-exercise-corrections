-- 解答

-- 答案
select
  sell_date,
  count(distinct product) num_sold,
  group_concat(
    distinct product
    separator','
  ) products
from activities
group by sell_date;