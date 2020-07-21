library(RODBC)
library(tidyverse)
library(stringdist)
library(data.table)

#Need to use 32-bit version to connect to deltaW and provide deltaW username and password below
#Change to "github" to read data from github
read_data_from <- "deltaW"

if(read_data_from == "github") {
    allnames <- fread("https://github.com/MPCA-data/tidytuesdays/raw/master/show-n-tell/strings/ai_names.csv", na.strings = "")
} else {

#deltaW username and password
user      <- ""
password  <- ""

#Connect to deltaW
deltaw <- odbcConnect("deltaw", 
                      uid = user, 
                      pwd = password,
                      believeNRows = FALSE)

#query to get alt names
query_altnames <- "SELECT
    tempo_mn_util.program_user_group_xref.program_code,
    tempo.agency_interest_alt.master_ai_id,
    tempo.agency_interest_alt.int_doc_id,
    tempo.agency_interest_alt.user_group_id,
    tempo.agency_interest_alt.alternate_ai_id,
    tempo.agency_interest_alt.alternate_ai_name,
    tempo.agency_interest_alt.alternate_ai_type_code,
    tempo.agency_interest_alt.start_date,
    tempo.agency_interest_alt.end_date,
    tempo.agency_interest_alt.comments
FROM
    tempo.agency_interest_alt
    INNER JOIN tempo_mn_util.program_user_group_xref ON tempo_mn_util.program_user_group_xref.user_group_id = tempo.agency_interest_alt
    .user_group_id
WHERE
    tempo.agency_interest_alt.int_doc_id = 0
    AND tempo.agency_interest_alt.end_date IS NULL"

#query to get AI names
query_AInames <- "SELECT
     tempo.agency_interest.master_ai_id,
    tempo.agency_interest.int_doc_id,
    tempo.agency_interest.master_ai_name,
    tempo.agency_interest.ai_type_code
FROM
    tempo.agency_interest
WHERE
    tempo.agency_interest.int_doc_id = 0"

#Run queries
altnames <- sqlQuery(deltaw, query_altnames)
ainames <- sqlQuery(deltaw, query_AInames)

#Join AI and alt names
allnames <- right_join(altnames, ainames,
                      by = c("INT_DOC_ID", "MASTER_AI_ID"))
}

#Remove all punctuation, capitalize all letters, and remove double spaces
allnames <- mutate(allnames,
                   ai_no_punc = str_replace_all(MASTER_AI_NAME, "[[:punct:]]", "") %>% str_replace_all("  ", " ") %>% toupper(),
                   alt_no_punc = str_replace_all(ALTERNATE_AI_NAME, "[[:punct:]]", "") %>% str_replace_all("  ", " ") %>% toupper())

#Calculate match scores (0 = no relation, 100 = exact match)
allnames <- mutate(allnames, match_score = 100 * (1 - stringdist(ai_no_punc, alt_no_punc) / pmax(str_length(ai_no_punc), str_length(alt_no_punc))))

#Count number of matching words in AI and alt names
allnames <- rowwise(allnames) %>%
    mutate(ai_words = str_split(ai_no_punc, pattern = " "),
           alt_words = str_split(alt_no_punc, pattern = " "),
           matching_words = sum(ai_words %in% alt_words, na.rm = T)) %>%
    ungroup()

#Categorize match scores
allnames <- mutate(allnames, match_desc = case_when(
    is.na(match_score) ~ "No alternate name",
    match_score == 100 ~ "Exact match",
    match_score > 50 | matching_words > 0 ~ "Close match",
    T ~ "Different names"
))


#Make plot of match scores vs descriptions
ggplot(allnames %>% filter(match_score <100),
       aes(x=match_score))+ geom_histogram(aes(fill = match_desc))

#Check AIs with no alt names
no_alt <- allnames %>% filter(is.na(alt_no_punc))

#Write results to file
#fwrite(select(allnames, -ai_words, -alt_words), "")
