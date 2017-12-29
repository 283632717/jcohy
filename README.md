#### 项目部署

>  *  将代码clone下来后，用idea打开，或者直接在idea里面关联好git，直接下拉下来。</br>
>  *  修改数据库配置，帐号密码。
>  *  如果是首次运行，先在数据库里面创建一个数据库jcohy。然后将application.yml里面的jpa.hibernate.ddl-auto = update改成create。
>  *  运行项目，程序会自动创建相关的表结构。
>  *  之后将jpa.hibernate.ddl-auto = create改为update。

#### 提交说明

>  *  每次提交新项目之前，必须先更新一下代码。以防提交出错或代码覆盖的问题。
>  *  每次提交都必须编写注释和作者。合并冲突。
>  *  项目的主配置文件如果有更新，在提交的时候，要先合并冲突。再提交。
>  *  Flyway
>    * 常用命令
    
            `./flyway info`       查询当前状态
            `./flyway baseline`   设置baseline版本（除线上系统基本用不到）
            `./flyway migrate`    执行migrate
            `./flyway validate`   核对数据库状态

>    * Tip（此过程可忽略）

            为Mysql添加flyway用户
            mysql> CREATE USER 'flyway'@'localhost' IDENTIFIED BY 'flyway';
            mysql> GRANT ALL PRIVILEGES ON jcohy.* TO 'flyway'@'localhost';
            mysql>flush privileges;
            
>    *  首次运行项目时，需要先创建jcohy数据库。然后执行操作，flyway会自动检测resource/db/migration/下的数据库脚本并执行
>    *  每次有关数据库改动时，请自行创建数据库脚本文件到resource/db/migration/下
>    *  脚本命名格式。V1.0.0_20171229_1__JCOHY_DB_INIT（注：JCOHY前是两个下划线）  

            V1.0.1:版本号。
            20171229:代表日期。
            1:表示当天第一次提交。
            JCOHY_DB_INIT:表示项目初始化操作。如果为添加数据，为ADD_SOME_DATA。

#### issues
>  *  有问题可以提交到issues。