# sql below

-- 1. 取出uid为10，50，100，300，500，1000的用户订单
SELECT * FROM `orders` WHERE `uid` IN (10, 50, 100, 300, 500, 1000);

-- 2. 取出某一日的交易数据，并按金额降序排序/时间降序排序，并关联用户name和product name
SELECT o.`order_number`, o.`amount`, o.`created_at`, u.`name` AS `user_name`, p.`name` AS `product_name` FROM `orders` o LEFT JOIN `product` p ON o.`product` = p.`id` LEFT JOIN `users` u ON o.`uid` = u.`id` WHERE o.`created_at` BETWEEN '2019-01-31 00:00:00' and '2019-01-31 23:59:59' ORDER BY o.`amount` DESC, o.`created_at` DESC;

-- 3. 获取用户的最后登录时间
SELECT l.`uid`, u.`name`, max(l.`created_at`) AS `last_login` FROM `login_log` l, `users` u WHERE l.`uid` = u.`id` group by l.`uid`;

-- 4. 取出orders单笔超过200元的
SELECT * FROM `orders` WHERE `amount` > 200;

-- 5. 取出orders总支付金额超过200元的
SELECT `uid`, sum(`amount`) FROM `orders` GROUP BY `uid` HAVING sum(`amount`) > 200;

-- 6. 取出所有下过单的uid
SELECT `uid` FROM `orders` GROUP BY `uid`;

-- 7. Orders 与reconciliation 相互match的单号
SELECT o.`order_number` FROM `orders` o INNER JOIN `reconciliation` r ON o.`order_number` = r.`order_number`;

-- 8. Orders 与reconciliation 只存在于orders的
SELECT o.`order_number` FROM `orders` o LEFT JOIN `reconciliation` r ON o.`order_number` = r.`order_number` WHERE r.`order_number` IS NULL;

-- 9. Orders 与reconciliation 只存在于reconciliation的
SELECT o.`order_number` FROM `orders` o RIGHT JOIN `reconciliation` r ON o.`order_number` = r.`order_number` WHERE o.`order_number` IS NULL;

-- 10. 给orders增加一个status状态，用以存储 未付款，付款了，对账了，结算了
ALTER TABLE `orders` ADD `status` tinyint(1) not null DEFAULT '0' COMMENT '0:未付款，1:付款了，2:对账了，3:结算了';

-- 11. 给orders增加一个字段，标记结算时间
ALTER TABLE `orders` ADD `payoff_time` timestamp COMMENT '结算时间';
