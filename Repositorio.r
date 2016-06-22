
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

# LEMBRAR DE VERIFICAR SE A VARIÁVEL É QUALITATIVA OU QUANTITATIVA 
# se qualitatitativa:

#pegar os valores da tabela e calcular estatistica descritiva ----- onde K é um valor selecionado a partir de uma "caixinha de escolha"
mean(csv()[K]) # média
var(csv()[K])    # variância
sd(csv()[K])     # desvio-padrão
summary(csv()[K])   #descreve os valores mínimo e máximo, média e mediana, primeiro e terceiro quartil
#mostra as relações entre duas variáveis:
correlação linear

# se quantitativa:
# quantidade de pessoas que tem a característica (a,b,c,d...)
# mostra as relações entre duas variáveis:
teste chi-quadrado



# se quantitativa:

