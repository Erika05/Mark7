#language: pt

Funcionalidade:Cadastro de usuários
    Sendo um visitante 
    Posso fazer meu cadastro
    Para poder gerenciar minhas tarefas

    Contexto:  Formulario
    Dado que eu estou no formulário de cadastro
    
    @cadastro @logout 
    Cenário: Cadastro simples
     E possuo os seguintes dados:
        |nome|Erika|
        |email|erika@qaninja.net|
        |senha|123456|
     Quando faço o meu cadastro
     Então vejo a mensagem "Olá, Erika"

    @cadastro
    Cenário: Senha com minimo de caracteres     
     E possuo os seguintes dados:
        |nome|Erika|
        |email|e@qaninja.net|
        |senha|12345|
     Quando faço o meu cadastro
     Então vejo a mensagem de alerta "Sua senha deve ter pelo menos 6 caracteres."

    @cadastro
    Cenário: Email inválido    
     E possuo os seguintes dados:
        |nome|Erika|
        |email|e@qaninja|
        |senha|123456|
     Quando faço o meu cadastro
     Então vejo a mensagem de alerta "Informe um email válido."


    @cadastro 
    Cenário: Cadastro duplicado     
     E possuo os seguintes dados:
        |nome|Erika|
        |email|erika@qaninja.net|
        |senha|123456|
     Mas já exite um cadastro para o email informado   
     Quando faço o meu cadastro
     Então vejo a mensagem de alerta "Email já existe."

     @cadastro
     Esquema do Cenário: Campos obrigatórios     
     E possuo os seguintes dados:
        |nome|<nome>|
        |email|<email>|
        |senha|<senha>|
     Quando faço o meu cadastro
     Então vejo a mensagem "<saida>"

     Exemplos:
     | nome  | email             | senha  | saida                |
     |       | erika@qaninja.net | 123456 | Nome é obrigatório.  |
     | Erika |                   | 123456 | Email é obrigatório. |
     | Erika | erika@qaninja.net |        | Informe uma senha.   |

    

