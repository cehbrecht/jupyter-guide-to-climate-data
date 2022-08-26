# CDS: Live Demo

Please register and login to the Climate Data Store (CDS):
https://cds.climate.copernicus.eu/

## Coperniucs Climate Data Store Application

https://cds.climate.copernicus.eu/cdsapp#!/software/app-tourism-fire-danger-indicators-projections?tab=app

## Download CMIP6 Dataset by submitting the CDS web form

Use the search option, select search for Dataset and enter **CMIP6** as search term:
https://cds.climate.copernicus.eu/cdsapp#!/search?type=dataset

```{figure} /media/CDS_searchbar.png
:scale: 50%
```

The will let you to this download form:
https://cds.climate.copernicus.eu/cdsapp#!/dataset/projections-cmip6?tab=form

Select:
* Temporal resolution: Monthly
* Experiment: Historical
* Level:      1000 hPa
* Variable:   Air temperature
* Model:      MPI-ESM1-2-HR (Germany)
* Temporal range:    2000-01-01/2000-12-31
* Area (Africa): -40W, 70E, 70N, -40S

Click on "Submit Form".

This will open a page with your CDS requests:
https://cds.climate.copernicus.eu/cdsapp#!/yourrequests

Now you option to download the requested data as zip file. The zip file contains a netCDF file and two so-called "provenance files" which documents the history of the file (we come to this later). 

## Use Climate Data Store (CDS) Toolbox Editor

The CDS Toolbox Editor provides an environment similar to [Jupyter Notebooks](https://jupyter.org/).
The toolbox, however, is only available in the Climate Data Store.
There are plans to provide a toolbox API to be used in your own Jupyter Notebooks.

### Download CMIP6 Dataset
Use the CDS Toolbox Editor to search the same CMIP6 dataset as above.
Follow the same steps, but click on *Show Toolbox request* instead of *Submit Form*. 
Copy the entire data request code. 
```python
import cdstoolbox as ct

@ct.application(title='Download data')
@ct.output.download()
def download_application():
    data = ct.catalogue.retrieve(
        'projections-cmip6',
        {
            'temporal_resolution': 'monthly',
            'experiment': 'historical',
            'level': '1000',
            'variable': 'air_temperature',
            'model': 'mpi_esm1_2_hr',
            'date': '2000-01-01/2000-12-31',
            'area': [
                70, -40, -40,
                70,
            ],
        }
    )
    return data
```
Open the toolbox editor:
https://cds.climate.copernicus.eu/user/login?destination=/toolbox-user

Paste the code in the Application Window and click on *Run*. 
On the right side, you will see an option to download the requested CMIP6 data.


### Download and plot CMIP6 Dataset

Combine the download request with plotting the data.
You can extend the cdstoolbox request code and with code to plot the data.
Paste the following code in the Application Window and click on *Run*. 
```python
import cdstoolbox as ct

@ct.application(title='Plot CMIP6')
@ct.output.figure()
@ct.output.download()
def download_application():
    data = ct.catalogue.retrieve(
        'projections-cmip6',
        {
            'temporal_resolution': 'monthly',
            'experiment': 'historical',
            'level': '1000',
            'variable': 'air_temperature',
            'model': 'mpi_esm1_2_hr',
            'date': '2000-01-01/2000-12-31',
            'area': [
                70, -40, -40,
                70,
            ],
        }
    )

    fig = ct.map.plot(data, title="CMIP6 Plot")
    return fig
```

## Use the Climate Data Store API

The [Climate Data Store API](https://pypi.org/project/cdsapi/) is a Python library to download data from the Climate Data Store.

You need an access key. Read the [Climate Data Store API](https://pypi.org/project/cdsapi/) documentation how configurethe access key.

Use the CMIP6 dataset (see above). Follow the same steps, but click on *Show API request* instead of *Submit Form*.

Copy the API data request code:
```python
import cdsapi

c = cdsapi.Client()

c.retrieve(
    'projections-cmip6',
    {
        'temporal_resolution': 'monthly',
        'experiment': 'historical',
        'level': '1000',
        'variable': 'air_temperature',
        'model': 'mpi_esm1_2_hr',
        'date': '2000-01-01/2000-12-31',
        'area': [
            70, -40, -40,
            70,
        ],
        'format': 'zip',
    },
    'download.zip')
```

We now demonstrate the usage of this API data request code in a Jupyter notebook. Please open the notebook [cdsapi.ipynb](https://cehbrecht.github.io/jupyter-guide-to-climate-data/cdsapi.html). 

Run the notebook.

## For experts: Use Rooki to access CMIP6 data

[Rooki](https://github.com/roocs/rooki) is a Python client to interact with the [Rook](https://github.com/roocs/rook) data subsetting service for climate model data. This service is used in the backend by the Climate Data Store to access the CMIP6 data pool. The Rook service is deployed for load-balancing at CEDA (UK), IPSL (FR) and DKRZ (DE).

ROOK: **R**emote **O**perations **O**n **K**limadaten

To try out: Run the notebook [rooki.ipynb](https://cehbrecht.github.io/jupyter-guide-to-climate-data/rooki.html).

