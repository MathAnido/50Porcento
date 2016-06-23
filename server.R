options(shiny.maxRequestSize = 9 * 1024 ^ 2)#Tamanho máximo do Arquivo

shinyServer(function(input, output, session) {
  csv <- reactive({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath,header = input$header,sep = input$sep,quote = input$quote)
  })
  
  opt <- reactive({
    if (is.null(csv()))
      return(NULL)
    names(csv())
  })
  select1 <- reactive({#grafico
    input$selecao
  })
  select2 <- reactive({#grafico
    input$selecao2
  })
  select3 <- reactive({#medias resumo
    input$sltResumo
  })
  select4 <- reactive({#histograma
    input$selecao4
  })
  output$preVisu <- renderDataTable({
    if (is.null(csv()))
      return(NULL)
    else
      return(csv())
  })
  output$msg <- renderText({
    if (is.null(csv()))
      "Você deve selecionar um arquivo"
  })
  
  output$msg2 <- renderText({
    if (is.null(csv()))
      "Você deve selecionar um arquivo na Pagina de Upload"
  })
  output$resumo1 <- renderPrint({
    if (is.null(csv()))
      "Você deve selecionar um arquivo"
    else summary(csv()[[as.numeric(select3())]])
  })
  output$name1 <- renderText({
    if(is.null(csv()))
      return(NULL)
    else as.character(opt()[[as.numeric(select3())]])
  })
  output$hist1 <- renderPlot({
    if(is.null(csv()))
      return(NULL)
    else hist(csv()[[as.numeric(select4())]],xlab = opt()[[as.numeric(select4())]],ylab="Frequência",main = " ")
  })
  output$graph1 <- renderPlot({
    if(is.null(csv()))
      return(NULL)
    else plot(csv()[[as.numeric(select1())]],csv()[[as.numeric(select2())]],xlab = opt()[[as.numeric(select1())]],ylab =  opt()[[as.numeric(select2())]])
  })
  observe({
    updateSelectInput(session, "selecao", choices = c(1,2,3,4,5,6,7,8,9,10))
    updateSelectInput(session, "selecao2", choices = c(1,2,3,4,5,6,7,8,9,10))
    updateSelectInput(session, "sltResumo",choices = c(1,2,3,4,5,6,7,8,9,10))
    updateSelectInput(session, "selecao4",choices = c(1,2,3,4,5,6,7,8,9,10))
  })
})