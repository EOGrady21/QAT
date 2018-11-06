##create standard qat

#load in all possible names and files
 load("~/BIOCHEM/DATA/QAT/HDR_NAMES.RData")
 files <- list.files('~/BIOCHEM/DATA/QAT/', pattern = '*.csv')
files <- files[-54] #blank QAT file


##### read in old file
for (i in 1:length(files)){
  old <- read.csv(files[i])
  #need to be able to skip columns if variable does not exist for file, 
  #creates NA placeholder columns
  x <- matrix(data = NA, nrow = length(old[,1]), ncol = length(HDR_NAMES))
  data <- as.data.frame(x)
  ###find known headers
  for (l in 1:length(HDR_NAMES)){
    t <- names(old) %in% HDR_NAMES[[l]]
    for (k in 1:length(names(old))){
      if (t[k] == T){
       
        #write.csv(x = old[k], file = paste0("updated_", files[i]), append = T, col.names = names(HDR_NAMES))
        data[l] <- old[k]
         
        
      } 
      #this section should work if QATs without headers are renamed
      # b <- grep(HDR_NAMES, pattern = names(old[k]))
      # if (length(b) == 0){
      #   HDR_NAMES <- append(x = HDR_NAMES, values = names(old[k]))
      #   data <- append(data, old[k])
      # }
     }
  }
 
  #correct column names to standard
  names(data) <- names(HDR_NAMES)
  write.csv(data, file = paste0("updated_", files[i]))
  
  #check to make sure there were no columns excluded
  if (length(old[1,]) != length(HDR_NAMES)){
    print(paste('Warning, column excluded from', files[i]))
  }
  }
#this works for variables listed in HDR_NAMES, need to expand dictionary in
#order to avoid excluded columns

#unnamed columns create file with header names but no data in cols
 
 

 
 #make it easy to batch edit files
 #data <- append(x = data, values = old[k])