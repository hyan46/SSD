# Code for the paper "Anomaly Detection in Images With Smooth Background via Smooth-Sparse Decomposition".

Here is the [Link](<https://www.tandfonline.com/doi/abs/10.1080/00401706.2015.1102764>) to the paper.  This repository provides a MATLAB implementation of the paper. 

- `bsplineBasis.m`: Function to generate bsplineBasis with `k` Bspline Basis and `n` grids with degree `sd` and boundary degree `bd`
  - By default bd=sd-1
  - Cubic B-spline, we set sd=3 
- `bsplineSmoothDecompauto`: The major function:
  - Input variable
    - `y`      :    Signal/image to be decomposed  
    - `B`      :    Basis for mean  
    - `Ba`     :    Basis for anomalies
    - `lambda` :    Smoothing Parameter, the algorithm will decide if empty  
    - `gamma ` :    Sparsity Parameter, the algorithm will decide if empty  
  - Output variable:
    - `yhat`   :    mean  
    - `a`         :   Anomalies

- `main.m`:  Test function, use the information in `data.mat` to generate a simulation. The result of estimated and true  anomalies are quite similar.





Practical Advices: 

- Choosing the knot of basis is very important especially on the two parameters `skx` and `sky` and these should really come from the domain knowledge. 
- The current algorithm works better if you use smaller basis `Bs` to cover larger anomaly. Using too large of basis could lead to a bad estimation of the exact shape.
- Using small basis is typically not very robust to noise. If you have very noisy image, consider using larger basis (fewer knots B-spline basis. )

