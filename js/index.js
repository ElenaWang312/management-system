angular.module("icketang",["ui.router"])
.config(function ($stateProvider,$urlRouterProvider) {
   $stateProvider
   .state("home",{
        url:"/",
        // 模板地址
        templateUrl:"view/home.tpl",
        controller:"homeCtrl"
   })
   .state("login",{
   	   url:"/login",
   	   templateUrl:"view/login.tpl",
   	   controller:"logCtrl"
   })
   .state("userlist",{
       url:'/userlist/1',
       templateUrl:"view/user/userlist.tpl",
       controller:"userList"
   })
   .state("createuser",{
       url:'/createuser',
       templateUrl:"view/user/createuser.tpl",
       controller:"createUser"
   })
   .state("newslist",{
      url: '/newslist/:listPage',
      templateUrl:"view/news/newslist.tpl",
      controller:"newsList"
   })
   .state("createnews",{
      url: '/createnews',
      templateUrl:"view/news/createnews.tpl",
      controller:"createNews"
   })
   .state("detailnews",{
      url:"/newsdetail/:newsId",
      templateUrl:"view/news/detailnews.tpl",
      controller:"detailNews"
   })
   .state("userdetail",{
    url:"/userdetail/:id",
    templateUrl:"view/user/userdetail.tpl",
    controller:"userDetail"
   })
   .state("photo",{
    url:"/photo",
    templateUrl:"view/photo/photo.tpl",
    controller:"photoCtrl"
   })
   .state("createphoto",{
    url:"/createphoto",
    templateUrl:"view/photo/createphoto.tpl",
    controller:"createphotoCtrl"
   })
   .state("staticcome",{
    url:"/static1",
    templateUrl:"view/static/come.tpl",
    controller:"comeCtrl"
   })
   .state("staticadd",{
    url:"/static2",
    templateUrl:"view/static/add.tpl",
    controller:"addCtrl"
   })
   .state("staticgo",{
    url:"/static3",
    templateUrl:"view/static/go.tpl",
    controller:"goCtrl"
   })
   .state("set",{
    url:"/set",
    templateUrl:"view/set.tpl",
    controller:"setCtrl"
   })
   // $urlRouterProvider.otherwise("/")
})
.controller("homeCtrl",function ($scope,$http,$element,$interval) {
   $scope.date=new Date();
   $interval(function () {
         $scope.date = new Date();
   }, 1000)
   $http.get("action/newslist.json")
   .success(function (res) {
    // console.log(res);
      if(res && res.errno==0 && res.data){
        $scope.news=res.data;
        var idx=0;
        var idx_max=$scope.news.length
        $interval(function () {   
          idx++;
          $element.find(".move").animate({"top":-40*idx+"px"}, 1000,function (){
              if(idx==8){
               idx=0;
              $element.find(".move").css({"top":"0px"})
          }
          })
         },3000)
      }
   })
   $http.get("action/tianqi.json")
   .success(function (res){
      if(res && res.errno===0 && res.data){
        $scope.weather=res.data;
        // console.log($scope);
        var arr1=[];
        for (var i = 0; i < $scope.weather.length; i++) {
          arr1.push($scope.weather[i].items);
        };
        // console.log(arr1);
        $element.find(".chart-container").highcharts({
            chart: {
            height:130,
            width:460,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            backgroundColor: 'rgba(0,0,0,0)'
             },
             colors:["orange"],
             title:{
               text:""
             },
             legend:{
              enabled:false
             },
             credits:{
              enabled:false
             },
             series:[
              {
                data:arr1
              }
             ],
              exporting: {
               enabled: false
              },
             plotOptions:{
              series:{
                 dataLabels:{
                         enabled:true,
                         format:"{y}℃",
                      style:{
                     color:"black"
                  }
                 }
                }
             },

             xAxis:{
               visible:false
             },
             yAxis: {
              title:"",
              gridLineWidth: 0,
              visible:false
            }
        })
      }
   })
   $http.get("action/email.json")
   .success(function (res){
      if(res && res.errno===0){
          $scope.email=res.data;
      }
   })
})
.controller("logCtrl",function ($scope,$http,$location,$rootScope){
   $scope.formsubmit=function () {
     $http.post("action/login.php",$scope.user)
     .success(function (res){
     	console.log(res);
        if (res && res.errno==0 && res.data){
        	$location.path("/");
          // console.log(res.data);
        	$rootScope.username=res.data.username;
        }else{
          alert("登录失败，用户名或密码错误");
        }
     })
 }   
})
.controller("setCtrl",function () {
  
})
.controller("userList",function ($scope,$http,$stateParams,$element){
   // console.log($stateParams);
   // $scope.num=?这是个啥？在哪里？
   $http.get("action/connect/userlist.php")
   .success(function (res) {
       $scope.data=res.data;
       $element.delegate('.btn', 'click', function(event) {
            $(this).parent().remove();
            $scope.userid=+$(this).siblings().eq(0).children().html();
            console.log({id:$scope.userid});
            $http.get("action/connect/deleteuser.php?id="+$scope.userid)
            .success(function (res){
              console.log(res);
              if(res && res.errno ===0){
                 alert("删除成功");
              }
            })   
       });
   })

})
.controller("createUser",function ($scope,$http,$location){
   $scope.user={
    sex:"man"
   }
   $scope.userFormSubmit=function (){
       console.log($scope.user)
       $.post("action/createuser.php?",$scope.user)
       .success(function (res) {
           var result = JSON.parse(res);
           console.log(res);
          if(result && result.errno === 0){
            $location.path("/userlist/1")
          }
       })
   }

})
.controller("userDetail",function ($scope,$http,$stateParams) {
  // console.log($stateParams);
  $scope.userid=$stateParams.id;
  $http({
    url:"action/userdetail.json",
    method:"GET"
  })
  .success(function (res){
    $scope.data=res.data;
  })
})
.controller("createNews",function ($scope,$stateParams,$location,$http) {
  $scope.newsFormSubmit=function (){
     console.log($scope.news);
     // console.log(new Date());
     $http.get("action/createNews.php?title="+$scope.news.title+"&writer="+$scope.news.writer+"&content="+$scope.news.content)
     .success(function (res){
        console.log(res);
        if(res && res.errno === 0){
           $location.path("/newslist/1")
        }
     })
  }
})
.controller("newsList",function ($scope,$stateParams,$http,$element,$location){
   // console.log("newsList");
  $scope.num=$stateParams.listPage;
  $http.get("action/connect/newslist.php",{
     params:{
        num:$scope.num
     }
  })
  .success(function (res){
      if(res && res.errno === 0 && res.data){
        $scope.data=res.data;
      }
    $element.delegate('.btn', 'click', function(event) {
       $(this).parent().remove();
       // $scope.newsid={
       //  id:+$(this).siblings().eq(0).children().html()
       //  }
       $scope.newsid=+$(this).siblings().eq(0).children().html();
       // console.log($scope.newsid);
       $http.get("action/connect/deletenews.php?id="+$scope.newsid)
       .success(function (res){
        console.log(res);
          if(res && res.errno===0){
            alert("删除成功");
          }
        // window.location.href="action/connect/deletenews.php";
       });
      
       // $location.path("action/connect/deletenews.php")
    });
  })
})
.controller("detailNews",function ($scope,$stateParams,$http){
     // console.log("detailNews")
     $scope.newsId=$stateParams.newsId;
     $http.get("action/newsdetail.php?id="+$scope.newsId)
     .success(function (res){
        if(res && res.errno===0){
          $scope.news=res.data;
        }
     }) 
})
.run(function ($rootScope,$http,$location){
	// 请求checkLogin.php，进行登录的session检测
  $http({
  	url:"action/checkLogin.php",
  	method:"GET"
  })
  .success(function (res){
     if (res && res.data && res.data.username){
     	$rootScope.username=res.data.username;
     	$location.path("/")
     }else{
      // alert("您未登录，请登录");
     	$location.path("/login")
     }
  })
})
.controller("comeCtrl",function () {

})
.controller("addCtrl",function () {

})
.controller("goCtrl",function () {

})
.controller("photoCtrl",function ($scope,$http){
    $http.get("action/imageList.json")
    .success(function (res) {
       console.log(res);
       $scope.data=res.data;
    })   
})
.controller("createphotoCtrl",function (){

})
.controller("navCtrl",function ($scope,$element) {
  // console.log($element);
 $element.delegate(".nav-list .licontainer","click",function (){
       console.log(this);
     $(this).siblings("ul").slideToggle()
 })
 $scope.list = [
		// 用户模块
		{
			id: 'user',
			title: '用户模块',
			childList: [
				{
					url: '#/userlist/1',
					title: '用户列表'
				},
				{
					url: '#/createuser',
					title: '创建用户'
				}
			]
		},
		{
			id: 'news',
			title: '新闻模块',
			childList: [
				{
					url: '#/newslist/1',
					title: '新闻列表'
				},
				{
					url: '#/createnews',
					title: '创建新闻'
				}
			]
		},
    {
      id: 'static',
      title: '统计模块',
      childList: [
        {
          url:"#/static1",
          title:"来访人数"
        },
        {
          url:"#/static2",
          title:"新增用户"
        },
        {
          url:"#/static3",
          title:"流失用户"
        }
      ]
    },
    {
      id: 'static',
      title: '相册模块',
      childList: [
        {
          url:"#/photo",
          title:"图片浏览"
        },
        {
          url:"#/createphoto",
          title:"上传图片"
        }
      ]
    }

	];
})