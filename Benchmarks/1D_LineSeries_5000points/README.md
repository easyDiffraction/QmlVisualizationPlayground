# Performance test

## 1D QtCharts LineSeries plot

### 5000 data points

#### QtCharts: add points via *append* method of LineSeries in Component.onCompleted block.

- 1.20 s - **useOpenGL: true** for LineSeries
- 5.70 s - **useOpenGL: false** for LineSeries

#### QtCharts: add points via *XYPoint* in the body of LineSeries. File is created by Python script.

- 1.18 s -  **useOpenGL: true** for LineSeries
- 1.18 s -  **useOpenGL: false** for LineSeries
- 1.18 s - add **integer** points.  **useOpenGL: false** for LineSeries

#### QtCharts + Python: set model via *Python* setContextProperty.
- 1.44 s - **useOpenGL: true** for LineSeries
- 5.65 s - **useOpenGL: false** for LineSeries

#### QtCharts + C++: set model via *C++* setContextProperty.
- 1.21 s - **useOpenGL: true** for LineSeries
- 1.21 s - **useOpenGL: false** for LineSeries

## Conclusion: 

* **useOpenGL: true** significantly speeds up LineSeries with data added via **append** method. Performance  becomes comparable to the **XYPoint** method of adding data!
* **useOpenGL: true** doesn't influences performance, when data are added via **XYPoint** method
* performance is not influenced by the precision in coordinates
* using Python model in QML is ~ the same speed as pure QML with **useOpenGL: true**
* using C++ model in QML is ~ the same speed as pure QML or Python model with **useOpenGL: true**. C++ doesn't depend on **useOpenGL: true**?

