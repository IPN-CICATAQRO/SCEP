<script>
	$(function () {
    $('#grafica1').highcharts({
        title: {
            text: 'Cantidad de alumnos por materia',
            x: 0 //center
        },
        /*subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },*/
        xAxis: {
            categories: ['2010', '2011', '2012', '2013', '2014', '2015']
        },
        yAxis: {
            title: {
                text: 'Cantidad'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        /*tooltip: {
            valueSuffix: '°C'
        },*/
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Matematicas',
            data: [20, 25, 15, 40, 55, 35]
        }, {
            name: 'Fisica',
            data: [15, 20, 10, 30, 45, 25]
        }, {
            name: 'Quimica',
            data: [12, 17, 8, 27, 42, 22]
        }, {
            name: 'Computacion',
            data: [30, 35, 25, 50, 65, 45]
        }]
    });
});

$(function () {
    $('#grafica2').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Numero de alumnos por categoria'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Alumnos:',
            data: [
                ['Doctorado', 75],
                ['Especialidad', 65],
                /*{
                    name: 'Maestria',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },*/
                ['Maestria', 85],
                /*['Opera', 6.2],
                ['Others', 0.7]*/
            ]
        }]
    });
});

$(function () {
    $('#grafica3').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Cantidad de materias por area de conocimiento'
        },
        xAxis: {
            categories: ['2011', '2012', '2013', '2014', '2015']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total de areas de conocimiento'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }
        },
        series: [{
            name: 'Interdiciplinario',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Ciencias medico biologicas',
            data: [2, 2, 3, 2, 1]
        }, {
            name: 'Administracion',
            data: [3, 4, 4, 2, 5]
        }]
    });
});

$(function () {
    $('#grafica4').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Grado de los directores de tesis'
        },
        subtitle: {
            text: 'Grado que tienen los profesores que pueden elegir de directores de tesis'
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: 'Cantidad:',
            data: [
                ['DR.', 8],
                ['DRA.', 9],
                ['M en C.', 5],
                ['ESP.', 6],
                ['L', 8],
            ]
        }]
    });
});
</script>