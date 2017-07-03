<div class="app-user-list">
	<div class="app-inner clearfix">
        <!-- clearfix类清除浮动 -->
        <h1>用户列表</h1>
        <div class="container-fluid">
        	<div class="row title">
				<div class="col-lg-2">用户ID</div>
				<div class="col-lg-1">用户名</div>
				<div class="col-lg-1">性别</div>
				<div class="col-lg-2">密码</div>
				<div class="col-lg-2">电话</div>
				<div class="col-lg-4">简介</div>
			</div>
			<div class="row list" ng-repeat="item in data">
				<div class="col-lg-2"><a ng-href="#/userdetail/{{item.id}}">{{item.id}}</a></div>
				<div class="col-lg-1">{{item.username}}</div>
				<div class="col-lg-1">{{item.sex}}</div>
				<div class="col-lg-2">{{item.password}}</div>
				<div class="col-lg-2">{{item.telephone}}</div>
				<div class="col-lg-3">{{item.info}}</div>
				<div class="col-lg-1 btn btn-danger">删除</div>
			</div>
        </div>
        <ul class="pagination pull-right">
			<li><a ng-href="#/userdetail/{{num - 1 > 0 ? num - 1 : 1}}">前一页</a></li>
			<li><a ng-href="#/userdetail/{{+num + 1}}">后一页</a></li>
		</ul>
		
	</div>
</div>
