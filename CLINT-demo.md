# CLINT - Demo


* https://climateintelligence.eu/
* https://clint.dkrz.de/
* https://climateintelligence.github.io/smartduck-docs/sections/intro.html

## Infilling missing data

Gridded observational climate datasets such as HadCRUT5 often contain many missing values. To tackle this problem, it is common to fill in the gaps by using the state-of-the-art kriging interpolation or the principal component analysis-based infilling. Unfortunately, these techniques are limited by the statistical information contained in the original dataset and might not be able to efficiently reconstruct large regions of missing values and complex climatic patterns. Artificial Intelligence and more specifically deep-learning based technologies give the possibility to go beyond these techniques by learning the underlying physical patterns in the data.

The method presented here is a deep-learning inpainting technique based on a U-Net architecture. It is making use of partial convolutional layers and a loss function designed to produce semantically meaningful predictions. Models are trained using climate data from reanalysis and/or historical simulations and can be used to reconstruct missing information in observational datasets with minimal computational resources.


## CLINT App

We have deployed the CLINT App demo on a virtual machine at [DKRZ](https://www.dkrz.de/en/).
In the following example we run the an infill process using the CLINT app.

## Demo: Infill with CLINT

Go to the CLINT app:
https://clint.dkrz.de

* Choose the *Duck* processing service
```{figure} /media/phoenix-duck-wps.png
:scale: 50%
```

* Use the *ClintAI* process
```{figure} /media/phoenix-duck-processes.png
:scale: 50%
```

* Select a HadCRUT5 dataset for the infill process
```{figure} /media/phoenix-duck-infill.png
:scale: 50%
```

* Wait for the process to finish ...
```{figure} /media/phoenix-duck-monitor.png
:scale: 50%
```

* When the process has finished go then the outputs are shown
```{figure} /media/phoenix-duck-outputs.png
:scale: 50%
```

* Outputs: a plot before the infill
```{figure} /media/duck-plot-before.png
:scale: 50%
```

* Outputs: a plot after the infill
```{figure} /media/duck-plot-after.png
:scale: 50%
```
