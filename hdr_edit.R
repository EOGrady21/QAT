#insert headers into older files


files <- list.files('~/BIOCHEM/DATA/QAT/', pattern = "*.csv")
files <- files[-54]
sink(file = 'header_names_unkn.txt', append = T)

for (i in 1:length(files)){
  f <- read.csv(paste0('~/BIOCHEM/DATA/QAT/',files[i]))
  h <- names(f)
  for (l in 1:length(h)){
    b <- grep(HDR_NAMES, pattern = h[l])
    if (length(b) == 0){
      cat(unlist(h[l]), '\n')
    }
  }
}

sink()



#check for duplicates
sink(file = 'header_names.txt', append = T)

for (i in 1:length(files)){
  f <- read.csv(paste0('~/BIOCHEM/DATA/QAT/',files[i]))
  h <- names(f)
  for (l in 1:length(h)){
   
      cat(unlist(h[l]), '\n')
    
  }
}

sink()


###

hdr <- read.table('header_names.txt')
hdr_dups <- duplicated(hdr)
for(k in 1:length(hdr[,1])){
  if(hdr_dups[k] == T){
    hdr[k,] <- NA
  }
}

hdr_undup <- na.omit(hdr)

write.csv(hdr_undup, file = 'header_names_undup.csv')



n <- read.csv('header_names_undup.csv')

hdr <- as.character(unlist(n$HEADER_NAMES))



file_name <- list()
cruise_number <- list()
station_number <- list()
latitude<- list()
longitude<- list()
trip_number<- list()
event_number<- list()
sample_ID<- list()
date<- list()
time<- list()
sigma_theta<- list()
oxygen<- list()
theta<- list()
salinity<- list()
scan<- list()
temperature<- list()
pressure<- list()
conductivity<- list()
rosette_postion<- list()
fluorescence<- list()
ph<- list()
par<- list()
altimeter<- list()


for (i in 1:length(hdr)){
  a <- grep(hdr[[i]], pattern = 'file', ignore.case = T, value = T)
  if (length(a) != 0){
    file_name[i] <- a
  }
  b <- grep(hdr[[i]], pattern = 'cruise', ignore.case = T, value = T)
  if (length(b) != 0){
    cruise_number[i] <- b
  }
  c <- grep(hdr[[i]], pattern = 'station', ignore.case = T, value = T)
  if (length(c) != 0){
    station_number[i] <- c
  }
  
  d <- grep(hdr[[i]], pattern = 'lat', ignore.case = T, value = T)
  if (length(d) != 0){
    latitude[i] <- d
  }
  e <- grep(hdr[[i]], pattern = 'lon', ignore.case = T, value = T)
  if (length(e) != 0){
    longitude[i] <- e
  }
  
  f <- grep(hdr[[i]], pattern = 'trip', ignore.case = T, value = T)
  if (length(f) != 0){
    trip_number[i] <- f
  }
  
  g <- grep(hdr[[i]], pattern = 'event', ignore.case = T, value = T)
  if (length(g) != 0){
    event_number[i] <- g
  }
  
  h <- grep(hdr[[i]], pattern = 'sample', ignore.case = T, value = T)
  if (length(h) != 0){
    sample_ID[i] <- h
  }
  
  j <- grep(hdr[[i]], pattern = 'date', ignore.case = T, value = T)
  if (length(j) != 0){
    date[i] <- j
  }
  
  k <- grep(hdr[[i]], pattern = 'time', ignore.case = T, value = T)
  if (length(k) != 0){
    time[i] <- k
  }
  
  l <- grep(hdr[[i]], pattern = 'sigma', ignore.case = T, value = T)
  if (length(l) != 0){
    sigma_theta[i] <- l
  }
  
  m <- grep(hdr[[i]], pattern = 'oxygen', ignore.case = T, value = T)
  if (length(m) != 0){
    oxygen[i] <- m
  }
  
  n <- grep(hdr[[i]], pattern = 'theta', ignore.case = T, value = T)
  if (length(n) != 0){
    theta[i] <- n
  }
  
  o <- grep(hdr[[i]], pattern = 'sal', ignore.case = T, value = T)
  if (length(o) != 0){
    salinity[i] <- o
  }
  
  p <- grep(hdr[[i]], pattern = 'scan', ignore.case = T, value = T)
  if (length(p) != 0){
    scan[i] <- p
  }
  
  q <- grep(hdr[[i]], pattern = 'temp', ignore.case = T, value = T)
  if (length(q) != 0){
    temperature[i] <- q
  }
  
  r <- grep(hdr[[i]], pattern = 'pressure', ignore.case = T, value = T)
  if (length(r) != 0){
    pressure[i] <- r
  }
  
  s <- grep(hdr[[i]], pattern = 'cond', ignore.case = T, value = T)
  if (length(s) != 0){
    conductivity[i] <- s
  }
  
  t <- grep(hdr[[i]], pattern = 'ros', ignore.case = T, value = T)
  if (length(t) != 0){
    rosette_postion[i] <- t
  }
  
  u <- grep(hdr[[i]], pattern = 'flu', ignore.case = T, value = T)
  if (length(u) != 0){
    fluorescence[i] <- u
  }
  
  v <- grep(hdr[[i]], pattern = 'ph', ignore.case = T, value = T)
  if (length(v) != 0){
    ph[i] <- v
  }
  
  w <- grep(hdr[[i]], pattern = 'par', ignore.case = T, value = T)
  if (length(w) != 0){
    par[i] <- w
  }
  
  x <- grep(hdr[[i]], pattern = 'alt', ignore.case = T, value = T)
  if (length(x) != 0){
    altimeter[i] <- x
  }
  
  
  remove(a,b,c,d,e,f,g,h,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x)
}

remove(i)


save.image(file = 'HEADER_NAMES_2.RData')


#####
HDR_NAMES2 <- list()

HDR_NAMES2$sample_ID <- unique(sample_ID)
HDR_NAMES2$altimeter <- unique(altimeter)
HDR_NAMES2$conductivity <- unique(conductivity)
HDR_NAMES2$cruise_number <- unique(cruise_number)
HDR_NAMES2$date <- unique(date)
HDR_NAMES2$event_number <- unique(event_number)
HDR_NAMES2$file_name <- unique(file_name)
HDR_NAMES2$fluorescence <- unique(fluorescence)
HDR_NAMES2$latitude <- unique(latitude)
HDR_NAMES2$longitude <- unique(longitude)
HDR_NAMES2$oxygen <- unique(oxygen)
HDR_NAMES2$par <- unique(par)
HDR_NAMES2$ph <- unique(ph)
HDR_NAMES2$pressure <- unique(pressure)
HDR_NAMES2$rosette_position <- unique(rosette_postion)
HDR_NAMES2$salinity <- unique(salinity)
HDR_NAMES2$scan <- unique(scan)
HDR_NAMES2$sigma_theta <- unique(sigma_theta)
HDR_NAMES2$station_number <- unique(station_number)
HDR_NAMES2$temperature <- unique(temperature)
HDR_NAMES2$theta <- unique(theta)
HDR_NAMES2$time <- unique(time)
HDR_NAMES2$trip_number <- unique(trip_number)

library(data.table)

#rbindlist(HDR_NAMES2, fill = T)

#dfs <- lapply(HDR_NAMES2, data.frame, stringsAsFactors = FALSE)

#rbind.data.frame(HDR_NAMES2)


write.csv(HDR_NAMES2, file = 'HDR_LIST.csv')
