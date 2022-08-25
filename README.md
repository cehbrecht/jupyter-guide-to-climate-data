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

To use the jupyter kernel we provide, create a link as follows:
`ln -s /work/bm0021/conda-envs-public/kernels/share/jupyter/kernels/summerschool_2022 ${HOME}/.local/share/jupyter/kernels/summerschool_2022`
Then, open notebooks in Jupyter and choose kernel "summerschool_2022"


Alternatively, to create your own conda environment and jupyter kernel, follow the steps below:

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
python -m ipykernel install --user --name="summerschool_2022" --display-name="summerschool_2022"
```

Set environment variables using one of the following options:
-  Option 1) Always add and execute a cell at the top of the current jupyter notebook containing the following code:
   ```python
   # Set necessary environment variables:
   import conda, os
   conda_file_dir = conda.__file__
   conda_dir = conda_file_dir.split('lib')[0]
   proj_lib = os.path.join(os.path.join(conda_dir, 'share'), 'proj')
   os.environ["PROJ_LIB"] = proj_lib
   os.environ['PATH'] += os.pathsep + os.path.join(conda_dir, 'bin')
   ```
-  Option 2) Preferably, add the environment variable definition to the kernel.json of your just created jupyter kernel:
   kernel.json per default located at `$HOME/.local/share/jupyter/kernels/summerschool_2022/kernel.json`
   Add the `"env"` section below:
   ```
   {
    "argv": [
     ...
    ],
    "env":
    {
     "PATH":"${PATH}:${HOME}/.conda/envs/summerschool_2022/bin",
     "PROJ_LIB":"${HOME}/.conda/envs/summerschool_2022/share/proj"
    },
    "display_name": "summerschool_2022",
    ...
   }
   ```

Open notebooks in Jupyter and choose kernel "summerschool_2022"
