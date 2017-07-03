<div class="app-news-create">
	<div class="app-inner">
		<h1>创建新闻</h1>
		<!-- 创建表单 -->
		<!-- 设置文案 -->
		<!-- 绑定数据，添加name属性 -->
		<!-- 添加校验的规则 -->
		<!-- 脏值检测 -->
		<form name="newsForm" ng-submit="newsFormSubmit()">
			<div class="form-group row">
				<div class="col-lg-2 text-right"><label for="title">新闻标题</label></div>
				<div class="col-lg-4"><input 
					type="text"
					placeholder="请输入新闻标题" 
					class="form-control" 
					ng-model="news.title"
					name="title" 
					ng-required="true"
					id="title" 
				></div>
				<div class="col-lg-4 text-danger"><span ng-show="newsForm.title.$dirty && newsForm.title.$invalid">新闻标题必填</span></div>
			</div>
			<div class="form-group row">
				<div class="col-lg-2 text-right"><label for="writer">新闻作者</label></div>
				<div class="col-lg-4"><input 
					type="text"
					placeholder="请输入新闻作者" 
					class="form-control" 
					ng-model="news.writer"
					name="writer" 
					ng-required="true"
					id="writer" 
				></div>
				<div class="col-lg-4 text-danger"><span ng-show="newsForm.writer.$dirty && newsForm.writer.$invalid">新闻作者必填</span></div>
			</div>
			<div class="form-group row">
				<div class="col-lg-2 text-right"><label for="content">新闻内容</label></div>
				<div class="col-lg-4"><textarea
					placeholder="请输入新闻内容"
					class="form-control" 
					ng-model="news.content"
					name="content"
					ng-required="true"
					id="content"
				></textarea></div>
				<div class="col-lg-4 text-danger"><span ng-show="newsForm.content.$dirty && newsForm.content.$invalid">新闻内容必填</span></div>
			</div>
			<div class="row form-group submit-btn">
				<div class="col-lg-4 col-lg-offset-2">
					<button ng-disabled="newsForm.$invalid" class="btn btn-success">提交</button>
				</div>
			</div>
		</form>
	</div>
</div>
