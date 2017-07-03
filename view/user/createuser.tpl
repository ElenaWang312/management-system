<div class="app-user-create">
	<div class="app-inner">
		<h1>创建用户</h1>
		<form name="userForm" ng-submit="userFormSubmit()" class="container">
			<div class="row name">
				<div class="col-lg-2 textright"><label for="username">用户名</label></div><span class="text-danger" ng-show="userForm.userName.$dirty && userForm.userName.$invalid">用户名以字母开头，5-10位</span>
				<div class="col-lg-6"><input type="text" name="userName" id="username" ng-model="user.username" ng-required="true" ng-pattern="/^[a-zA-Z]\w{4,9}$/" ng-minlength="5"></div>
			</div>
			<div class="row pass">
				<div class="col-lg-2 textright"><label for="password">密码</label></div><span class="text-danger" ng-show="userForm.passWord.$dirty && userForm.passWord.$invalid">必须包含字母和数字</span>
				<div class="col-lg-6"><input type="password" name="passWord" id="password" ng-model="user.password" ng-required="true" ng-pattern="/\d+.*[a-zA-Z]+|[a-zA-Z]+.*\d+/"></div>
			</div>
			<div class="row tel">
				<div class="col-lg-2 textright"><label for="telephone">手机号</label></div><span class="text-danger" ng-show="userForm.telePhone.$dirty && userForm.telePhone.$invalid">必须为11位数字</span>
				<div class="col-lg-6"><input type="text" name="telePhone" id="telephone" ng-model="user.telephone" ng-required="true"ng-pattern="/^\d{11}$/"></div>
			</div>
			<div class="row">
				<div class="col-lg-2 textright"><label for="man">性别</label></div>
				<div class="col-lg-6">
				<span>男：</span>
				<input type="radio" value="man" name="sex" id="man" ng-model="user.sex">
				<span>女：</span>
				<input type="radio" value="woman" name="sex" ng-model="user.sex">
			    </div>
			</div>
			<div class="row textright">
			<div class="col-lg-2"><label for="info">简介</label></div>
			<div class="col-lg-6"><textarea name="info" id="info" cols="30" rows="10" ng-model="user.info"></textarea>
            </div>
			</div>
			<div class="col-lg-6 col-lg-offset-2">
		        <button class="btn btn-success" ng-disabled="userForm.$invalid">提交</button>
		   </div>
		</form>
	</div>
</div>
