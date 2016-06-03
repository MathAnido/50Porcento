htmlTemplate("Upload.html",
             check1 = checkboxInput('header', 'Header', TRUE),
             radio1 = radioButtons('sep', 'Separator',c(Comma=',',Semicolon=';',Tab='\t'),','),
             radio2 = radioButtons('quote', 'Quote',c(None='','Double Quote'='"','Single Quote'="'"),'"'),
             table = dataTableOutput('contents'),
             graph1 = plotOutput('plot1')
)