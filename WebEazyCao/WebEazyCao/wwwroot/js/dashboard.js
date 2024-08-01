$(function () {
    'use strict';

    var ticksStyle = {
        fontColor: '#495057',
        fontStyle: 'bold'
    };

    var mode = 'index';
    var intersect = true;

    var $salesChart = $('#sales-chart');

    // Lấy dữ liệu từ thuộc tính data-* của thẻ <canvas>
    var labels = $salesChart.data('labels');
    var data1 = $salesChart.data('data1');

    var salesChart = new Chart($salesChart, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    backgroundColor: '#007bff',
                    borderColor: '#007bff',
                    data: data1
                }
            ]
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                mode: mode,
                intersect: intersect
            },
            hover: {
                mode: mode,
                intersect: intersect
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    gridLines: {
                        display: true,
                        lineWidth: '4px',
                        color: 'rgba(0, 0, 0, .2)',
                        zeroLineColor: 'transparent'
                    },
                    ticks: $.extend({
                        beginAtZero: true,
                        callback: function (value) {
                            if (value >= 1000) {
                                value /= 1000;
                                value += 'k';
                            }
                            return value + ' VND';
                        }
                    }, ticksStyle)
                }],
                xAxes: [{
                    display: true,
                    gridLines: {
                        display: false
                    },
                    ticks: ticksStyle
                }]
            }
        }
    });
});
