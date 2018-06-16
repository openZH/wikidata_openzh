library(tidyverse)


#read in csv from webserver
gpop<-read.csv("http://www.web.statistik.zh.ch/ogd/data/KANTON_ZUERICH_133.csv",sep=";")

gfor<- read.csv("http://www.web.statistik.zh.ch/ogd/data/KANTON_ZUERICH_205.csv",sep=";")

gres<- read.csv("http://www.web.statistik.zh.ch/ogd/data/KANTON_ZUERICH_304.csv",sep=";")

wiki<-read.csv("query.csv",sep=",")



Q4115189|P1082|9999|P585|+2017-12-31T00:00:00Z|P854|“https://statistik.zh.ch/internet/justiz_inneres/statistik/de/daten/gemeindeportraet_kanton_zuerich.html?tab=indikatoren&jahr=2017&indikatoren=133&bfs=21”


gpop2 <-gpop %>%   
  filter(INDIKATOR_JAHR==2017) %>% 
  left_join(wiki, by=c("BFS_NR"="Gemeindenummer_in_der_Schweiz")) %>% 
  #population property
  mutate(item=str_extract(item,"Q[0-9]+"),
         isPopulation="P1082",
         pointintime="P585",
         # dynamisch zusammensetzen!
         time="+2017-12-31T00:00:00Z",
         source="S854",
         sourcelink=paste0("https://statistik.zh.ch/internet/justiz_inneres/statistik/de/daten/gemeindeportraet_kanton_zuerich.html?tab=indikatoren&jahr=2017&indikatoren=133&bfs=",BFS_NR)
         )

wikidatapush  <-gpop2 %>% 
  select(item,isPopulation,INDIKATOR_VALUE,pointintime,time,source,sourcelink)

write.table(wikidatapush,"wikidatapush.csv", sep="|",row.names = F,quote=7)


# ?write.table


