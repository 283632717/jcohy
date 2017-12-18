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

#### issues
>  *  有问题可以提交到issues。