# NPD FactPages as Semantic Web Data

Contains data, database, mappings, ontologies and queries developed in the work described in the publication

Martin G. Skjæveland, Espen H. Lian, and Ian Horrocks. Publishing the Norwegian Petroleum Directorate's FactPages as Semantic Web Data. In Harith Alani, Lalana Kagal, Achille Fokoue, Paul Groth, Chris Biemann, JosianeXavier Parreira, Lora Aroyo, Natasha Noy, Chris Welty, and Krzysztof Janowicz, editors, *The Semantic Web – ISWC 2013*, volume 8219 of LNCS, pages 162–177. Springer Berlin Heidelberg, 2013.


## Contents

* Data
** "Raw" CSV files, as downloaded from the official NPD FactPages website: http://factpages.npd.no
** Cleaned CSV files which may be loaded into a relational database
** RDF dump as according to the R2RML mapping specification

* Database
** Schema
** Dump (including data and schema)
** Script for creating schema and loading cleansed CSV files into database

* Mappings
** R2RML mapping specification translating between the database schema and the ontology

* Ontology
** Imports: contains "external" ontologies. Put here for safekeeping.
** Modules: contains manually built ontologies that fit a specific sub topic of the NPD FactPages information domain
** npd-db.ttl.owl contains the ontology developed from the ontology engineering process describied in the ISWC 2013 paper. 
** npd-main-index.rdf.owl contains import statements for all ontologies
** npd-main-complete.rdf.owl contains all the ontology axioms (without import statements)

* Query
** SPARQL: contains SPARQL queries over the ontology. *-user.rq files represent queries that originate from end-user information needs. *-test.rq are queries to test query answering support.
** SQL: contains SQL over the database. 