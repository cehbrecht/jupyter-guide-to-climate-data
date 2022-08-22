# CDS: Live Demo

You need to register and login to the Climate Data Store:
https://cds.climate.copernicus.eu/

## Coperniucs Climate Data Store Application

https://cds.climate.copernicus.eu/cdsapp#!/software/app-tourism-fire-danger-indicators-projections?tab=app

## Download CMIP6 Datasets

Search Datasets for **CMIP6**:
https://cds.climate.copernicus.eu/cdsapp#!/search?type=dataset

The will let you to this download formular:
https://cds.climate.copernicus.eu/cdsapp#!/dataset/projections-cmip6?tab=form

Search:
* Variable: Near-surface air temperature (tas)
* Model: MPI-ESM1-2-HR (Germany)
* Time: 2000-01-01/2000-01-31
* Area (Africa): -40W, 70E, 70N, -40S

Submit Formular.

This will open a page with your running requests:
https://cds.climate.copernicus.eu/cdsapp#!/yourrequests

## Use Climate Data Store Toolbox Editor

The Toolbox Editor provides a simliar environment like [Jupyter Notebooks](https://jupyter.org/).
But the toolbox is only available in the Climate Data Store.
There are plans to provide a toolbox API to be used in your own Jupyter Notebooks.

Use the same dataset search as above.

Use the button *Show Toolbox request* and copy the data request:
```
data = ct.catalogue.retrieve(
        'projections-cmip6',
        {
            'temporal_resolution': 'monthly',
            'experiment': 'historical',
            'level': 'single_levels',
            'variable': 'near_surface_air_temperature',
            'model': 'mpi_esm1_2_hr',
            'date': '2000-01-01/2000-01-31',
            'area': [
                70, -40, -40,
                70,
            ],
        }
    )
```

Open the toolbox editor:
https://cds.climate.copernicus.eu/cdsapp#!/toolbox

Load or create the application to plot the CMIP6 data with the above data request:
```
import cdstoolbox as ct

@ct.application(title='Plot CMIP6')
@ct.output.figure()
def plot_cmip6():
    data = ct.catalogue.retrieve(
        'projections-cmip6',
        {
            'temporal_resolution': 'monthly',
            'experiment': 'historical',
            'level': 'single_levels',
            'variable': 'near_surface_air_temperature',
            'model': 'mpi_esm1_2_hr',
            'date': '2000-01-01/2000-01-31',
            'area': [
                70, -40, -40,
                70,
            ],
        }
    )
    fig = ct.map.plot(data, title="CMIP6 Plot")
    return fig
```

Run the application to generate the plot.


## Use Climate Data Store API

The [Climate Data Store API](https://pypi.org/project/cdsapi/) is a Python library to download data from the Climate Data Store.

You need an access key. Read the [Climate Data Store API](https://pypi.org/project/cdsapi/) documentation how to get the access key and configure it.

Use the same dataset search as above.

Use the button *Show API request* and copy the data request
```
c.retrieve(
    'projections-cmip6',
    {
        'temporal_resolution': 'monthly',
        'experiment': 'historical',
        'level': 'single_levels',
        'variable': 'near_surface_air_temperature',
        'model': 'mpi_esm1_2_hr',
        'date': '2000-01-01/2000-01-31',
        'area': [
            70, -40, -40,
            70,
        ],
        'format': 'zip',
    },
    'download.zip')
```

Open the notebook [notebooks/cdsapi.ipynb](https://nbviewer.org/github/atmodatcode/tgif_copernicus/blob/main/notebooks/cdsapi.ipynb) and replace the data request.

Run the notebook.

## Use Rooki to access CMIP6 data

[Rooki](https://github.com/roocs/rooki) is a Python client to interact with [Rook](https://github.com/roocs/rook) data subsetting service for climate model data. This service is used in the backend by the Climate Data Store to access the CMIP6 data pool. The Rook service is deployed for load-balancing at CEDA (UK), IPSL (FR) and DKRZ (DE).

ROOK: **R**emote **O**perations **O**n **K**limadaten

Open the notebook [notebooks/rooki.ipynb](https://nbviewer.org/github/atmodatcode/tgif_copernicus/blob/main/notebooks/rooki.ipynb).

Run the notebook.
