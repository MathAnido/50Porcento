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
  select1 <- reactive({
    input$selecao
  })
  select2 <- reactive({
    input$selecao2
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
  output$graph1 <- renderPlot({
    if(is.null(csv()))
      return(NULL)
    else plot(csv()[[as.numeric(select1())]],csv()[[as.numeric(select2())]],xlab = opt()[[as.numeric(select1())]],ylab =  opt()[[as.numeric(select2())]])
  })
  observe({
    updateSelectInput(session, "selecao", choices = c(1,2,3,4,5,6,7,8))
    updateSelectInput(session, "selecao2", choices = c(1,2,3,4,5,6,7,8))
  })
})