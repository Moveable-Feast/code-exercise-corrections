-- 解答
select round(sum(tiv_2016), 2) tiv_2016 from (select * from
(select * from
insurance i
left join
(select tiv_2015 tiv_2015_it, count(*) count_tiv_2015 from insurance group by tiv_2015_it) t
on i.tiv_2015 = t.tiv_2015_it) it
left join
(select lat lat_l, lon lon_l, count(*) count_city from insurance group by lat_l, lon_l) l
on it.lat = l.lat_l and it.lon = l.lon_l) i2 where i2.count_tiv_2015 > 1 and i2.count_city = 1;
-- 答案
SELECT
    ROUND(SUM(insurance.TIV_2016),2) AS TIV_2016
FROM
    insurance
WHERE
    insurance.TIV_2015 IN
    (
      SELECT
        TIV_2015
      FROM
        insurance
      GROUP BY TIV_2015
      HAVING COUNT(*) > 1
    )
    AND CONCAT(LAT, LON) IN
    (
      SELECT
        CONCAT(LAT, LON)
      FROM
        insurance
      GROUP BY LAT , LON
      HAVING COUNT(*) = 1
    );