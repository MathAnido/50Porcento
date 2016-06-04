htmlTemplate("Upload.html",
             check1 = checkboxInput('header', 'Cabeçalho', TRUE),
             radio1 = radioButtons('sep', 'Separador',c(Virgula=',','Ponto e Virgula'=';',Tab='\t'),','),
             radio2 = radioButtons('quote', 'Quote',c(Nenhum='','Aspas Duplas'='"','Aspas Simples'="'"),'"'),
             table = dataTableOutput('contents'),
             mensagem = textOutput("caption"),
             select1 = selectInput("selecao","Jose",choices = NULL)
)