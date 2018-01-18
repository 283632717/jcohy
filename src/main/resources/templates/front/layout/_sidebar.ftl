
<#--<!-- 侧边栏结束&ndash;&gt;-->
<div class="blogerinfo shadow">
    <div class="blogerinfo-figure">
        <img src="../images/Absolutely.jpg" alt="Absolutely" />
    </div>
    <p class="blogerinfo-nickname">Jcohy</p>
    <p class="blogerinfo-introduce">一枚90后程序员，Java开发工程师</p>
    <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;陕西 - 西安</p>
    <hr />
    <div class="blogerinfo-contact">
        <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i class="fa fa-qq fa-2x"></i></a>
        <a target="_blank" title="给我写信" href="javascript:layer.msg('启动邮我窗口')"><i class="fa fa-envelope fa-2x"></i></a>
        <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i class="fa fa-weibo fa-2x"></i></a>
        <a target="_blank" title="码云" href="javascript:layer.msg('转到你的github主页')"><i class="fa fa-git fa-2x"></i></a>
    </div>
</div>
<div></div><!--占位-->
<div class="blog-module shadow">
    <div class="blog-module-title">热文排行</div>
    <ul class="fa-ul blog-module-ul">
	<@blogList type="readNum">
		<#list list as x>
            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.html">${x.title}</a></li>
		</#list>
	</@blogList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">分享排行</div>
    <ul class="fa-ul blog-module-ul">
	<@blogList type="shareNum">
		<#list list as x>
            <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.html">${x.title}</a></li>
		</#list>
	</@blogList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">最近分享</div>
    <ul class="fa-ul blog-module-ul">
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1c1BJ6Qc" target="_blank">Canvas</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1kVK8UhT" target="_blank">pagesize.js</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1mit2aiW" target="_blank">时光轴</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1nuAKF81" target="_blank">图片轮播</a></li>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">标签分类</div>
    <ul class="fa-ul blog-module-ul">
	<@tagList>
		<#list list as x>
            <li><a href="${x.url}" target="_blank">${x.name}</a></li>
		</#list>
	</@tagList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">热门资源</div>
    <dl class="footprint">
        <dt>2017年03月12日</dt>
        <dd>新增留言回复功能！人人都可参与回复！</dd>
        <dt>2017年03月10日</dt>
        <dd>Jcohy2.0基本功能完成，正式上线！</dd>
        <dt>2017年03月09日</dt>
        <dd>新增文章搜索功能！</dd>
        <dt>2017年02月25日</dt>
        <dd>QQ互联接入网站，可QQ登陆发表评论与留言！</dd>
    </dl>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">友情链接</div>
    <ul class="blogroll">
		<@linkList>
			<#list list as x>
				<li><a href="${x.url}" target="_blank">${x.title}</a></li>
			</#list>
		</@linkList>
    </ul>
</div>