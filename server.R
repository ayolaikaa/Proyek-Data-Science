library(stringr)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud)
library(syuzhet)
library(tidytext)
library(tidyr)
library(igraph)
library(ggraph)
library(readr)
library(circlize)
library(reshape2)
library(textdata)

shinyServer(function(input, output) {
    texts <- read.csv(file.choose())
    texts$length <- str_count(texts$text)
    test <- reactive({
        if(input$Pilihan == "1"){
            test <- "Positive Negative Word";
        }
        return (test);
    })
    test1 <- reactive({
        if(input$Pilihan == "1"){
            texts$text <- as.character(texts$text)
            
            tidy_texts <- texts %>%
                unnest_tokens(word,text)
            bng <- get_sentiments("bing")
            
            set.seed(1234)
            
            test1 <- tidy_texts %>%
                inner_join(get_sentiments('bing')) %>%
                count(word, sentiment, sort = TRUE) %>%
                acast(word ~ sentiment, value.var = 'n', fill = 0) %>%
                comparison.cloud(colors = c('#F8766D', '#00BFC4'),
                                 max.words = 250)
        }
        return (test1);
    })
    
    # Return the formula text for printing as a caption
    output$caption <- renderText({
        test()
    })
    
    output$plot <- renderPlot({
        test1()
    })
})