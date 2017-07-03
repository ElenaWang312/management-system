<div class="app-login">
	<div class="login-container">
		<form name="login" ng-submit="formsubmit()">
			<div class="form-group row">
			  <h2>登录</h2>
			  <div class="col-lg-3  text-right">
				<label for="login_username">用户名</label>
			  </div>
			  <div class="col-lg-8">
				<input type="text" 
				 id="login_username"
				 name="username"
                 ng-pattern="/^[a-zA-Z]\w{5,7}$/"
                 ng-required="true"
                 ng-minlength="6" 
                 ng-model="user.username"          
				>
				<!-- 绑定数据 -->
			  </div>
			</div>
			<div class="form-group row">
			  <div class="col-lg-3 text-right">
				<label for="login_pass">密&emsp;码</label>
		      </div>
			  <div class="col-lg-8">
				<input type="password" id="login_pass" name="password"
                 ng-pattern="/[a-zA-Z]+.*\d+|\d+.*[a-zA-Z]+/"
                 ng-required="true"
                 ng-model="user.password"
				>
			  </div>
			</div>
			<div class="tip text-danger col-lg-offset-3 col-lg-8">
			<p ng-show="login.username.$dirty && login.username.$invalid">用户名不符合规范</p>
			<p ng-show="login.password.$dirty && login.password.$invalid">密码不符合规范</p>
			</div>
			<button class="btn btn-success" ng-disabled="login.$invalid">提交</button>
		</form>
	</div>

</div>