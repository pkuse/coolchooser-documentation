环境要求：php5.5 mysql5.6 apache2

配置流程：
1. 配置apache，document root指向项目目录
2. 按照mysql_model.sql文件建立mysql数据库
3. 配置应用。
	a. 编辑./application/config/config.php, 将$config['base_url']设为服务器ip或对应域名
	b. 编辑./application/config/database.php
	设置hostname为mysql所在机器的ip
	设置username，password为mysql用户名、密码
	设置database为所使用的数据库