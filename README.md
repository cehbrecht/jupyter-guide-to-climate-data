# Jupyter Guide to Climate Data
Jupyter Books with notebook examples for using climate data


Documentation written with Jupyter Book:
https://jupyterbook.org/en/stable/intro.html 

Other book examples:
https://github.com/bvanderlei/jupyter-guide-to-linear-algebra

Chat:
https://gitter.im/ENES-CDI/enes-summer-school

Discussions:
https://github.com/IS-ENES-Data/summer-school-2022/discussions/

Material on GitHub:
https://github.com/IS-ENES-Data/summer-school-2022

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

... or use make:
```
make clean build
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

... or use make:
```
make publish
```


## Working on Levante at DKRZ

Login to levante ... or use terminal in jupyter.

Get source:
```
git clone https://github.com/cehbrecht/jupyter-guide-to-climate-data.git

cd jupyter-guide-to-climate-data
```

Init conda:
```
conda init bash
source ~/.bashrc
```

Create conda env:
```
mamba env create

conda activate summerschool_2022
```

Make kernel:
```
python -m ipykernel install --user --name "summerschool_2022" --display-name="summerschool_2022"
```

Open notebooks in Jupyter and choose kernel "summerschool_2022"