# jupyter-guide-to-climate-data
Jupyter Books with notebook examples for using climate data


Documentation written with Jupyter Book:
https://jupyterbook.org/en/stable/intro.html 

Other book examples:
https://github.com/bvanderlei/jupyter-guide-to-linear-algebra


## Build from Source

Get Source:
```
git clone https://github.com/cehbrecht/jupyter-guide-to-climate-data.git
```

Make conda env:
```
mamba env create
conda activate climate-guide
```

Build book:
```
jupyter-book build .
```

Show build pages:
```
firefox _build/html/index.html
```