<div class="app-news-list">
	<div class="app-inner">
		<h1>新闻列表</h1>
		<div class="container-fluid">
			<div class="row title">
				<div class="col-lg-2">新闻ID</div>
				<div class="col-lg-3">新闻标题</div>
				<div class="col-lg-1">新闻作者</div>
				<div class="col-lg-2">发布时间</div>
				<div class="col-lg-5">新闻内容</div>
			</div>
			<!-- 动态渲染内容 -->
			<div class="row list" ng-repeat="item in data">
				<div class="col-lg-2"><a ng-href="#/newsdetail/{{item.id}}">{{item.id}}</a></div>
				<div class="col-lg-3">{{item.title}}</div>
				<div class="col-lg-1">{{item.writer}}</div>
				<div class="col-lg-2">{{item.date | date : 'yyyy-MM-dd hh:mm:ss'}}</div>
				<div class="col-lg-3">{{item.content}}</div>
				<div class="col-lg-1 btn btn-danger">删除</div>
			</div>
		</div>
		<ul class="pagination pull-right">
			<li><a ng-href="#/newslist/{{num - 1 > 0 ? num - 1 : 1}}">前一页</a></li>
			<li><a ng-href="#/newslist/{{+num + 1}}">后一页</a></li>
		</ul>
	</div>
</div>
