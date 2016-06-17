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
  output$preVisu <- renderTable({
    if (is.null(csv()))
      return(NULL)
    else
      return(csv())
  })
  output$msg <- renderText({
    if (is.null(csv()))
      return("Você deve selecionar um arquivo")
  })
  output$msg2 <- renderText({
    if (is.null(csv()))
      return("Você deve selecionar um arquivo na Pagina de Upload")
  })
  observe({
    updateSelectInput(session, "selecao", choices = opt())
    updateSelectInput(session, "selecao2", choices = opt())
  })
})