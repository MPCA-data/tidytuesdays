library(RODBC)
library(data.table)
library(tidyverse)
library(curl)
library(magrittr)
library(glue)
library(attempt)

#Need to use 32-bit version

#deltaw username and password
user      <- ""
password  <- ""


#Create folder for files and put path here
output_path <- "H:/Tidy Tuesday Tempo Demo"

#Create folders to store files in if they don't already exist
if(!dir.exists(glue("{output_path}/pdf_raw"))) dir.create(glue("{output_path}/pdf_raw"))
if(!dir.exists(glue("{output_path}/pdf_detached"))) dir.create(glue("{output_path}/pdf_detached"))
if(!dir.exists(glue("{output_path}/attached_files"))) dir.create(glue("{output_path}/attached_files"))

#Create separate folders for each type of file
map(c("txt", "csv", "pdf"), ~if(!dir.exists(glue("{output_path}/{.x}_files"))) dir.create(glue("{output_path}/{.x}_files")))

#Set up ntlm (Windows) authentication
tempo_handle <- new_handle()
handle_setopt(tempo_handle, httpauth = 8, userpwd = ":::")

#connect to deltaw using the super secret username and password
deltaw <- odbcConnect("deltaw", 
                      uid = user, 
                      pwd = password)

# sqlTables(deltaw, tableType = "TABLE", schema = "WH_TEMPO")


#Get document metadata from WH_TEMPO http://rainier.pca.state.mn.us/documentation/DataDictionary/DELTAW/WH_TEMPO/tables/MV_DOCUMENT_METADATA.html
docs <- sqlQuery(deltaw,
#SQL query for document metadata         
         "SELECT master_ai_id,
        master_ai_name,
        ai_type_code,
        int_doc_id,
        program_desc,
        program_code,
        title_desc,
        activity_id,
        doc_template_id,
        doc_template_desc,
        lb_template_desc,
        ecm_doc_type_desc,
        activity_num,
        activity_year,
        effective_start_date,
        effective_end_date,
        expiration_date,
        effective_flag,
        locked_flag,
        doc_type_general_code,
        doc_type_general_desc,
        doc_order_num,
        doc_type_specific_code,
        doc_type_specific_desc,
        activity_category_code,
        activity_category_desc,
        activity_class_code,
        activity_class_desc,
        activity_type_code,
        activity_type_desc,
        activity_type_label,
        user_created,
        tmsp_created,
        user_last_updt,
        tmsp_last_updt,
        tmsp_locked,
        user_locked,
        ext_eff_end_date_flag,
        alias_int_doc_id,
        onbase_doc_handle
    FROM wh_tempo.document_metadata
    WHERE (program_code = 'AQ')
    AND (activity_type_code = 'MON')
    AND (doc_template_id = 908)
    AND (activity_year = 2019)
        ", max = 100)

#Filter out monitoring plans
docs <- filter(docs, !str_detect(TITLE_DESC, "Plan"))

#Download PDF files
download_list <- docs %>%
    slice(1:10) %>%
    #download by doc title (unique for each row)
    group_by(TITLE_DESC) %>%
    #use summarize to download and check status
    summarize(
        #this will tell us if it downloaded each file successfully
        success = {
            #generate Tempo url
            url <- glue("http://tempo.pca.state.mn.us/Services/DownloadHandler?docId={INT_DOC_ID}&docTemplateId={DOC_TEMPLATE_ID}")
            #Use attempt in case of error
            attempt(
                #download using the url and Windows authentication
                curl_download(url, glue("{output_path}/pdf_raw/{TITLE_DESC}"), handle = tempo_handle)) %>%
                #determine if error was returned and negate so successful download is TRUE
                is_try_error() %>% `!`
        }
    )

#get names of raw pdf files

raw_files <- glue("{output_path}/pdf_raw/{download_list$TITLE_DESC}")

#Detach original document from TEMPO document

map(raw_files, ~shell(glue('pdfdetach -saveall -o "{output_path}/pdf_detached" "{.x}"')))

#List file paths for detached pdf files

detached_pdfs <- list.files(glue("{output_path}/pdf_detached"), full.names = T)

#Detach all attached files to pdf
map(detached_pdfs, ~shell(glue('pdfdetach -saveall -o "{output_path}/attached_files" "{.x}"')))

attached_files <- list.files(glue("{output_path}/attached_files"), full.names = T)

#Group by file extension and copy to separate folder
grouped_files = map(c("txt", "csv", "pdf"), ~attached_files[str_detect(attached_files, glue(".{.x}"))]) %>%
    set_names(c("txt", "csv", "pdf"))

grouped_files_new <- imap(grouped_files, ~ str_replace(.x, "attached_files", glue("{.y}_files", sep = "_")))

map(1:length(grouped_files), ~ file.copy(grouped_files[[.x]], grouped_files_new[[.x]]))
