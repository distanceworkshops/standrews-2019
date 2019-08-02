# convert HTML presentations to PDF
# info from https://github.com/yihui/xaringan/wiki/Export-Slides-to-PDF#convert-to-pdf

library(webshot)

files <- dir(".",".html")

file_fun <- function(a_file){

  file_name <- paste0("file://", normalizePath(a_file))

  pdf_name <- sub("html", "pdf", a_file)
  webshot(file_name, pdf_name, delay=3)
}

lapply(files, file_fun)

