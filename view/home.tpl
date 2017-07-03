<script type="text/javascript" src="highcharts/modules/exporting.js"></script>
<script type="text/javascript" src="js/weather.js"></script>
<div class="app-home">
	<div class="app-inner">
		<h1>现在的时间是：{{date|date : "yyyy-MM-dd hh:mm:ss"}}</h1>
	</div>
  <div class="container-fluid clearfix">
  <div class="row-fluid clearfix row">
   <div class="col-lg-6">
	<div class="part1 span4">
      <p class="newstitle"><i class="iconfont icon-news1"></i>新闻</p>
		<div class="news">
		 <div class="move">
			<ul>
				<li ng-repeat="item in news"><a href="#" ng-bind="item.content"></a><span class="time" ng-bind="item.date"></span></li>
			</ul>
		 </div>
		</div>
	</div>
	<div class="email span4">
		<p class="emailtitle"><i class="iconfont"></i>邮件</p>
		<div class="email-content">
			<ul>
				<li ng-repeat="item in email"><span class="time" ng-bind="item.time"></span><p ng-bind="item.name" class="name"></p><p ng-bind="item.content"></p></li>
			</ul>
		</div>
	</div>
   </div>
   <div class="col-lg-6">
    <div class="part2">
    	<p class="weathertitle"><i class="iconfont icon-news"></i>天气</p>
        <div id="weatherchart">
        	<ul class="r1"><li ng-repeat="item in weather"><span ng-bind="item.hour"></span></li></ul>
        	<ul class="r2"><li></li><li></li><li></li><li></li></ul>
        	<div class="chart-container"></div>
        	<ul class="r3"><li ng-repeat="item in weather"><span ng-bind="item.level"></span></li></ul>
        	<ul class="r4"><li ng-repeat="item in weather"><span ng-bind="item.wind"></span></li></ul>
        </div>
    </div>  

	<div class="right span8">
	<div class="duty">
		<p class="dutytitle"><i class="iconfont icon-news"></i>任务</p>
		<ul class="clearfix">
			<li class="box"><span class="glyphicon glyphicon-bell"></span><span  class="num">3</span><p>提示消息</p></li>
			<li class="box"><span class="glyphicon glyphicon-briefcase"></span><span class="num">3</span><p>未处理</p></li>
			<li class="box"><span class="glyphicon glyphicon-warning-sign"></span><span  class="num">4</span><p>过期事务</p></li>
			<li class="box"><span class="glyphicon glyphicon-hourglass"></span><span class="num">5</span><p>今日事物</p></li>
		</ul>
		<ul class="clearfix">
			<li class="box"><span class="glyphicon glyphicon-thumbs-up"></span><span class="num">6</span><p>收到点赞</p></li>
			<li class="box"><span class="glyphicon glyphicon-heart-empty"></span><span class="num">8</span><p>被关注</p></li>
			<li class="box"><span class="glyphicon glyphicon-comment"></span><span class="num">9</span><p>收到私信</p></li>
			<li class="box"><span class="glyphicon glyphicon-phone-alt"></span><span class="num">3</span><p>明日事务</p></li>
		</ul>
	  </div>
    </div>
	</div>
	</div>
  </div>
</div>

