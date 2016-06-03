  # By default, the file size limit is 5MB. It can be changed by
  # setting this option. Here we'll raise limit to 9MB.
  options(shiny.maxRequestSize = 9*1024^2)
  
  shinyServer(function(input, output) {
    output$contents <- renderDataTable({
      # input$file1 will be NULL initially. After the user selects
      # and uploads a file, it will be a data frame with 'name',
      # 'size', 'type', and 'datapath' columns. The 'datapath'
      # column will contain the local filenames where the data can
      # be found.
      
      inFile <- input$file
      
      if (is.null(inFile))
        return(NULL)
      
      x <- read.csv(inFile$datapath, header = input$header,
               sep = input$sep, quote = input$quote)
    })
    output$plot1 <- renderPlot({
      inFile <- input$file
      
      if (is.null(inFile))
        return(NULL)
      
      x <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
      plot(x$hp,x$cyl)
    })
  })