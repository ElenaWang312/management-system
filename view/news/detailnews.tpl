<div class="app-news-detail">
	<div class="app-inner">
		<h1>新闻详情</h1>
		<div class="container-fluid">
			<div class="row info">
				<div class="col-lg-2 text-right">新闻标题：</div>
				<div class="col-lg-10">{{news.title}}</div>
			</div>
			<div class="row info">
				<div class="col-lg-2 text-right">新闻作者：</div>
				<div class="col-lg-10">{{news.writer}}</div>
			</div>
			<div class="row info">
				<div class="col-lg-2 text-right">发布时间：</div>
				<div class="col-lg-10">{{news.date | date : 'yyyy-MM-dd hh:mm:ss'}}</div>
			</div>
			<div class="row info">
				<div class="col-lg-2 text-right">新闻内容：</div>
				<div class="col-lg-10">{{news.content}}</div>
			</div>
		</div>
	</div>
</div>