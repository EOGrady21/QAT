#add header
#headers were implemented Dec2013
#not consistently used since implementation

#read all QATs
files <- list.files('~/BIOCHEM/DATA/QAT/', pattern = "*.csv")
files <- files[-54]

#create standard header name vector
head_names <- list('cruise_number', 'station_number', 'latitude', 'longitude', 'trip_number', 'sample_ID', 'date', 'time', 'primary_sigma_theta', 'primary_o2_mll', 'primary_theta_1968scale', 'primary_salinity', 'scan_number', 'primary_temp_1968scale', 'pressure', 'primary_cond_sm', 'rosette_position', 'secondary_sigma_theta', 'secondary_o2_mll', 'secondary_theta_1968scale', 'secondary_salinity', 'secondary_temp_1968scale', 'secondary_cond_sm', 'primary_florescence_chl_mgl', 'secondary_florescence_chl_mgl', 'ph')
for (i in 1:length(files)){
  a <- read.csv(paste0('~/BIOCHEM/DATA/QAT/', files[i]))
 sink(paste0('HDR_', files[i]))
 cat(names(a))
 sink()
  }




