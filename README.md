

1、取出uid为10，50，100，300，500，1000的用户订单
2、取出某一日的交易数据，并按金额降序排序/时间降序排序，并关联用户name和product name
3、获取用户的最后登录时间
4、取出orders单笔超过200元的
5、去出orders总支付金额超过200元的
6、取出所有下过单的uid
7、Orders 与reconciliation 相互match的单号
8、Orders 与reconciliation 只存在于orders的
9、Orders 与reconciliation 只存在于reconciliation的

10、给orders增加一个status状态，用以存储 未付款，付款了，对账了，结算了
11、给orders增加一个字段，标记结算时间



数据库结构存在可以优化的地方，哪里可以改进，理由是？
