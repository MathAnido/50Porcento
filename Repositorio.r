
#Botão Upload .csv
csv <- reactive({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath,header = input$header,sep = input$sep,quote = input$quote)
  }) 
  
 #Imprime a Pré-Vizualização da Tabela upada
 output$preVisu <- renderTable({
    if (is.null(csv()))
      return(NULL)
    else
      return(csv())
  })
  
#pega os nomes das variáveis presentes em uma tabela
names(tabela)
#retorna a quantidade (inteiro) de variáveis na tabela
dim(names(tabela))

#Laço pra concatenar os valores da tabela
for(i in 1:dim(names(tabela))){
    x = c(i);
}


       