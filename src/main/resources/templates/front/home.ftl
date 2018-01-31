<#include "/front/layout/__layout.ftl">
<#include "/front/layout/_paginate.ftl">
<@html>
<#--<div id="blog-list">-->
    <#--<#if (page.content?size > 0)>-->
        <#--<#list page.content as x>-->
            <#--<div class="qing-entry-text">-->
                <#--<div class="qing-list-title">-->
                    <#--<span class="qing-category">${(x.category.name)!}<i></i></span><a href="${ctx!}/b/view/${x.id}"> ${x.title}</a>-->
                <#--</div>-->
                <#--<div class="qing-list-hint">-->
                    <#--<span><i class="am-icon-user qing-color-author" title="作者"></i>&nbsp;${x.author.nickName}</span>&nbsp;-->
                    <#--<span><i class="am-icon-clock-o qing-color-clock" title="时间"></i>&nbsp;${x.createAt}</span>&nbsp;-->
                    <#--<span><i class="am-icon-eye-slash qing-color-eye" title="阅读"></i>&nbsp;阅读(${x.views})</span>&nbsp;-->
                    <#--<span><i class="am-icon-comments-o qing-color-comment" title="评论"></i>&nbsp;评论(<span id = "sourceId::${x.id}" class = "cy_cmt_count" ></span>)</span>&nbsp;-->
                    <#--<script id="cy_cmt_num" src="https://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=${siteChangyanAppId!}"></script>-->
                    <#--<!--         <span><i class="am-icon-heart-o qing-color-heart" title="点赞"></i> 点赞(1)</span> &ndash;&gt;-->
                <#--</div>-->
                <#--<p class="qing-list-content">${x.summary}</p>-->
                <#--<div class="qing-list-foot">-->
                    <#--<i class="am-icon-tags"></i>-->
                    <#--<#list x.tags?split(",") as tag>-->
                        <#--<span class="am-radius">${tag}</span>-->
                    <#--</#list>-->
                    <#--<a href="${ctx!}/b/view/${x.id}" class="qing-read-more">阅读全文>></a>-->
                <#--</div>-->
            <#--</div>-->
        <#--</#list>-->
    <#--<#else>-->
        <#--<div class="qing-content">-->
            <#--没有任何数据-->
        <#--</div>-->
    <#--</#if>-->
<#--</div>-->
<!-- 分页 -->
<#--<@paginate currentPage=page.number + 1  totalPage=page.totalPages link="/b/" + c + "?p=" />-->
<@blogList type="all">
    <#list list as x>
        <div class="article shadow">
            <div class="article-left">
                <img src="${ctx!}/${(x.coverURL)!}" alt="${(x.coverURL)!}" />
            </div>
            <div class="article-right">
                <div class="article-title">
                    <a href="${ctx!}/article/${x.id}">${(x.title)!}</a>
                </div>
                <div class="article-abstract">
                ${(x.summary)!}
                </div>
            </div>
            <div class="clear"></div>
            <div class="article-footer">
                <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;${(x.createDate)!}</span>
                <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;${(x.author.nickName)!}</span>
                <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">${(x.tags)!}</a></span>
                <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;${(x.readNum)!}</span>
                <span class="article-viewinfo"><i class="fa fa-star"></i>&nbsp;${(x.heartNum)!}</span>
                <span class="article-viewinfo"><i class="fa fa-share-square-o"></i>&nbsp;${(x.shareNum)!}</span>

                <#--<span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;${(x.heartNum)!}</span>-->
                <#--<span class="article-viewinfo"><i class="fa fa-share-alt"></i>&nbsp;${(x.shareNum)!}</span>-->
            </div>
        </div>
    </#list>
</@blogList>

</@html>