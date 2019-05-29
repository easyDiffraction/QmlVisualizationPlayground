# Performance test



## 1D QtCharts LineSeries plot

- 1.20 s - add 5000 points via **append** method of LineSeries in Component.onCompleted block.  **useOpenGL: true** for LineSeries

  - 1D_line-plot_5000-points-with-append-useOpenGl.qml

- 5.70 s - add 5000 points via **append** method of LineSeries in Component.onCompleted block.  **useOpenGL: false** for LineSeries

  - 1D_line-plot_5000-points-with-append.qml

    

- 1.18 s - add 5000 points via **XYPoint** in the body of LineSeries. File is created by Python script.  **useOpenGL: true** for LineSeries

  - 1D_line-plot_5000-points-with-XYPoints.qml
  - 1D_line-plot_5000-points-with-XYPoint.py

- 1.18 s - add 5000 points via **XYPoint** in the body of LineSeries. File is created by Python script.  **useOpenGL: false** for LineSeries

  - 1D_line-plot_5000-points-with-XYPoints-useOpenGl.qml

  

- 1.18 s - add 5000 **integer** points via **XYPoint** in the body of LineSeries. File is created by Python script.  **useOpenGL: false** for LineSeries

  - 1D_line-plot_5000-points-with-XYPoints_int-data.qml
  - 1D_line-plot_5000-points-with-XYPoint_int-data.py



## Conclusion: 

* **useOpenGL: true** significantly speeds up LineSeries with data added via **append** method. Performance  becomes comparable to the **XYPoint** method of adding data!
* **useOpenGL: true** doesn't influences performance, when data are added via **XYPoint** method
* performance is not influenced by the coordinates precision

