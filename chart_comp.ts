import { Component, Input, OnInit, OnDestroy, ElementRef, ViewChild } from '@angular/core';
import * as echarts from 'echarts';

@Component({
  selector: 'app-chart',
  template: `<div #chartContainer style="width: 100%; height: 400px;"></div>`
})
export class ChartComponent implements OnInit, OnDestroy {
  @ViewChild('chartContainer', { static: true }) chartContainer: ElementRef;
  
  @Input() chartTitle: string = 'Chart';
  @Input() xData: any[] = [];
  @Input() yData: any[] = [];
  @Input() chartType: string = 'scatter';
  @Input() chartColor: string = '#007bff';
  @Input() height: string = '400px';
  @Input() enableDataZoom: boolean = true;
  @Input() rotateXLabels: boolean = true;
  
  private chartInstance: any;

  ngOnInit() {
    this.initChart();
  }

  ngOnDestroy() {
    if (this.chartInstance) {
      this.chartInstance.dispose();
    }
  }

  private initChart() {
    // Initialize the echarts instance
    this.chartInstance = echarts.init(this.chartContainer.nativeElement);
    
    // Set chart height
    this.chartContainer.nativeElement.style.height = this.height;
    
    this.updateChart();
  }

  private updateChart() {
    const options = {
      title: { 
        text: this.chartTitle, 
        left: 'center' 
      },
      tooltip: { 
        trigger: 'axis',
        formatter: (params: any) => {
          const param = params[0];
          return `${param.name}<br/>${param.seriesName}: ${param.value}`;
        }
      },
      dataZoom: this.enableDataZoom ? [
        { type: 'inside' },
        { type: 'slider' }
      ] : [],
      xAxis: {
        type: 'category',
        data: this.xData,
        axisLabel: { 
          rotate: this.rotateXLabels ? 45 : 0,
          interval: 0
        }
      },
      yAxis: { 
        type: 'value',
        name: 'Values'
      },
      series: [{
        name: 'Data Points',
        type: this.chartType,
        data: this.yData,
        smooth: true,
        lineStyle: { color: this.chartColor },
        itemStyle: { color: this.chartColor },
        symbolSize: this.chartType === 'scatter' ? 8 : 4
      }]
    };

    this.chartInstance.setOption(options, true);
    
    // Resize chart when window is resized
    setTimeout(() => {
      this.chartInstance.resize();
    }, 100);
  }

  // Method to update chart data dynamically
  updateData(xData: any[], yData: any[]) {
    this.xData = xData;
    this.yData = yData;
    this.updateChart();
  }

  // Method to refresh chart
  refresh() {
    if (this.chartInstance) {
      this.chartInstance.resize();
    }
  }
}




<app-chart
  [chartTitle]="'My Chart'"
  [xData]="['A', 'B', 'C']"
  [yData]="[10, 20, 30]"
  [chartType]="'scatter'">
</app-chart>


  <app-data-chart
  [apiUrl]="'https://your-api.com/data'"
  [dateParam]="'2023-12-01'"
  [chartTitle]="'TPS Distribution'"
  [autoRefresh]="true"
  [refreshInterval]="30000">
</app-data-chart>
