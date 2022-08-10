# Jupyter Guide to Climate Data
Jupyter Books with notebook examples for using climate data


Documentation written with Jupyter Book:
https://jupyterbook.org/en/stable/intro.html 

Other book examples:
https://github.com/bvanderlei/jupyter-guide-to-linear-algebra

Chat:
https://gitter.im/ENES-CDI/enes-summer-school


## Build from Source

Get Source:
```
git clone https://github.com/cehbrecht/jupyter-guide-to-climate-data.git

cd jupyter-guide-to-climate-data
```

Make conda env:
```
mamba env create
conda activate climate-guide
```

Build book:
```
jupyter-book build --all .
```

Show build pages:
```
firefox _build/html/index.html
```

## Publish book to gh-pages

https://jupyterbook.org/en/stable/publish/gh-pages.html

```
ghp-import -n -p -f _build/html
```


