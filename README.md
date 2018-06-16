# Wikidata Datathon 16.6.2018

At the Wikidata-Datathon OpenZH has aimed at injecting population figures of the municipalities of the canton of Zurich in Wikidata.

This repository contains:

- the [wikidata-sparql-query](https://query.wikidata.org/#SELECT%20%3FitemDescription%20%3Fitem%20%3FGemeindenummer_in_der_Schweiz%20%3FitemLabel%20WHERE%20%7B%0A%3Fitem%20wdt%3AP771%20%3Fcoord.%0ASERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22%5BAUTO_LANGUAGE%5D%2Cen%22.%20%7D%0A%3Fitem%20wdt%3AP31%20wd%3AQ70208.%0AOPTIONAL%20%7B%20%3Fitem%20wdt%3AP771%20%3FGemeindenummer_in_der_Schweiz.%20%7D%0A%3Fitem%20wdt%3AP131%20wd%3AQ11943.%20%7D%20limit%20300) which delivers all the existing wikidata entities for the municipalities and their respective bfs-identifier.

- the R-script to load the population-data from opendata.swiss and to bring the data in the wikidata-compatible form.

- the data-files used as imports into wikidata via [Quickstatements](https://tools.wmflabs.org/quickstatements/).


