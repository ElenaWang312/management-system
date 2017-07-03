$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            backgroundColor: 'rgba(0,0,0,0)'
        },
        title: {
            text: '2017 管理系统新增用户'
        },
        exporting:{
            enabled:false
        },
        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        credits:{
            enabled:true
        },
        series: [{
            type: 'pie',
            name: '新增用户类型占比',
            data: [
                ['前端开发工程师',   45.0],
                ['JAVA开发工程师',       26.8],
                {
                    name: 'PHP开发工程师',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['数据库工程师',    8.5],
                ['设计师',     6.2],
                ['产品经理',   0.7]
            ]
        }]
    });
});