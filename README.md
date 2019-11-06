# TimeSeriesAnalysis
An application created to help businesse forecast product demand. This product offers a trial version which allows statistical models elucidated by Rob J Hyndman in his book Forecasting: Principles and Practice.

The first draft of the trial version workflow is as follows - 
1) The trial version allows loading of the data (as a Data stream that allows more incoming data) and checks for inconsistencies
2) If the data is consistent, it builds individual time series objects (ts objects in R)
3) It then shows the user (forecefully) the EDA and gathers inputs (for a set of ts objects) needed to select the appropriate type of model (ARIMA for short term, ETS for long term)
4) It then saves the data and the forecasts and provides the user an interface to download the forecasts

The full version is intended to provide support in the data preparation and machine learning models like the LSTM, Random Forest and other regression techniques for forecasting
# File Structure
	
      rsconnect/shinyapps.io/mohitsahasrabudhe      Used to connect to shinyapps.io

      savefiles/datasource	                        This is a temporary persistent data storage of the data streams

      serverfiles	                                  The serverfiles contain the backend of our system

      uifiles	                                      The uifiles contain the frontend of our system

      www	                                          Contains the Javascript and Jquery

      global.R	                                    Responsible for the library installations and other global actions
    
      server.R	                                    Main page of the server which connects to other pages in serverfiles
    
      ui.R	                                        Main page of the ui which connects to other pages in uifiles


# Workflow
The workflow for a client can be found in the attached pdf: 

Load Data

New Project Workflow

# Technical Specifications
A dynamic dashboard that build ARIMA, ETS and Decomposition Time Series forecasting models.
This dashboard is build using RShiny, JavaScript and Jquery
