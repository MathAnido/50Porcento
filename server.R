  # By default, the file size limit is 5MB. It can be changed by
  # setting this option. Here we'll raise limit to 9MB.
  options(shiny.maxRequestSize = 9*1024^2)
  
  shinyServer(function(input, output, session) {
    csv <- reactive({
      inFile<-input$file1
      if(is.null(inFile))
        return(NULL)
      read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
    })
    opt <- reactive({
      inFile <- input$file1
      if(is.null(inFile))
        return(NULL)
      read.csv(inFile$datapath, sep=input$sep,nrows = 1,header = TRUE)
    })
    output$preVisu <- renderDataTable({
      if (is.null(csv()))
        return(NULL)
      else return(csv())
    })
    output$msg <- renderText({
      if(is.null(csv()))
        return("Você deve selecionar um arquivo")
      else return(NULL)
    })
    output$graph1 <- renderPlot({
      
    })
    observe({
      updateSelectInput(session,"selecao", choices = opt())
      updateSelectInput(session,"selecao2", choices = opt())
    })
  })