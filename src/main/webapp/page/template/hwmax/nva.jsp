<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1" style="width: 300px;"><a href="productDetail.html"><img src="/image/ad1.jpg" /></a></li>
            <li class="banner2" style="width: 300px;"><a href="productDetail.html"><img src="/image/ad2.jpg" /></a></li>
            <li class="banner3" style="width: 300px;"><a href="productDetail.html"><img src="/image/ad3.jpg" /></a></li>
            <li class="banner4" style="width: 300px;"><a href="productDetail.html"><img src="/image/ad4.jpg" /></a></li>

        </ul>
    </div>
    <div class="clear"></div>
</div>

<div class="shopNav">
    <div class="slideall">
        <div class="nav-cont">
            <ul>
                <li class="qc"><a href="/">首页</a></li>
                <li class="qc"><a href="/video/list">教学视频</a></li>
                <li class="qc"><a href="/list?status=1">已解决</a></li>
                <li class="qc"><a href="/list?status=0">未解决</a></li>
                <li class="qc last"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2125383258&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2125383258:41" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></li>
            </ul>
        </div>

        <!--轮播 -->
        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>


        <!--小导航 -->

        <!--走马灯 -->
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>

