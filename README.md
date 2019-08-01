OnlineShop
JAVAEE项目-网上商城
本项目基于SSM框架+MySql+layui，表格datatable插件开发以及数据报表echarts，页面渲染是用的jsp
主要功能模块分为 1.前台界面 和 2.后台管理系统
1.前台界面
  1.登录注册：普通密码+图片验证码登录，记住密码，短信登录以及 手机短信验证码找回 账号密码
  2.首页商品展示：
    a.左侧栏 按 商品类别 和 价格区间 进行条件查询 商品列表
    b.主商品界面：
      1）.每个商品展示 价格，图片，名称，评论星数以及 添加购物车 和 收藏 按钮,可进行相关操作（需登录）
      2）.商品列表顶部可 按 评论星数、价格高低、上架时间先后进行 分页查询，右边一个商品的全局 模糊查询 按钮
    c.商品详情：
      1）.展示商品的基本信息、商品浏览量、评论星数，加上添加购物车功能
      2）底部展示 商品的描述，以及 商品 对应的评论列表，每个评论可进行点赞（需登录）
      3）评论列表底部 是 展示相关商品列表，查询 该商品的同类别下的 热门商品
   3.首页顶部 
       1）收藏列表：用户收藏的 商品列表，分页展示，可自行删除
       2）个人中心：
          a.添加收货地址：进行了省市县三级联动，保存收货信息，收货人以及手机号等信息
          b.修改个人信息：基本信息不能变更，只能修改个人头像和邮箱地址
          c.修改密码
          d.修改手机号码：需当前手机号的短信验证码
       3）我的足迹：基于redis保存登录用户的浏览商品的列表，可按 今天，近三天，近一周，近一个月查询，
                  也可清除某条商品浏览记录 和 清除 全部浏览记录
       4）我的购物车：使用redis实现的购物车，好处就是可随时同步，购物车里的信息不会丢失
       5）支付结算：调用支付宝的接口，用沙箱环境进行支付
    4.首页底部
       1）友情链接显示：按两列显示
       2）用户留言反馈：未绑定邮箱情况下，会弹出确认选择提示框，提示用户去个人中心界面绑定邮箱
                      已绑定可直接进行留言反馈，字数不少于10，且为了用户恶意刷留言，限定每个用户每天
                      只能留言五次，超过次数，会弹出提示框提示用户
2.后台管理界面
  1.登录
  2.后台主界面：
      1）展示商城所有基本信息：用户数量、商品总销量、总交易金额、订单数量，以及对应订单状态，和 对应商品的详情
  3.商品管理
      1）使用datatable插件进行商品数据展示，可进行商品的上下架，是否设为热门，以及添加和修改商品信息
      2）可按商品类别进行分类查询
  4.商品类别管理
      1）展示商品的8中类别，也可进行添加修改以及删除操作
  5.订单管理：
      1）交易信息：展示商城全年十二个月，每种对应状态订单的数量，用echarts数据报表展示，以及展示全年交易金额，退款金额，订单数量等
      2）交易订单（图）：根据订单的收货地址的省份，统计全中国每个省份的订单数量，用echarts中国地图展示，颜色深代表订单数量多
      3）订单管理：左侧展示各种订单状态的数量，进行对应条件查询，数据表格展示订单列表，对已支付的订单进行发货处理，
                所有订单可查询订单详情，以及 操作。表格上方 按每种商品类别的总销量，统计出购物产品比例，用比例图展示
      4）交易金额：统计系统当前时间所在月的销售情况，进行了当月 成功订单，失败订单以及对应数量的报表统计 和 展示
      5）退款管理：对用户发起的退款请求，进行退款处理
  6.会员管理
      1）会员列表：展示会员的基本信息，可对会员进行停用操作（不能登陆）
      2）会员等级：按照会员等级展示会员列表，饼状图展示会员等级对应数量
      3）会员积分
  7.消息管理：展示用户留言反馈列表，每条留言分为三个状态（待浏览，待回复，已回复）
  8.友情链接管理：至多添加12条友情链接
  9.管理员管理：本系统管理员分为三种类型：编辑管理员，普通管理员，超级管理员，记录每个管理员的操作日志
              编辑管理员：只能使用部分功能
              普通管理员：可是使用出超级管理员以外的功能
              超级管理员：全部功能
