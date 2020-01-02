#language: pt

Funcionalidade: Cadastar tarefas
    Para que eu possa organizar minhas atividades
    Sendo o usuário cadastrado 
    Posso cadastrar novas tarefas

    @autenticado @logout 
    Cenario: Nova tarefa

        Dado que o nome da tarefa é "Ler um livro de mongodbErika"
        E a data de conclusão é "10/06/2018"
        E eu quero tagear com:
            | tag      |
            | mongodbE |
            | estudarE |
            | livroE   |
            | leituraE |
        Quando faço o cadastro desta tarefa
        Então devo ver esta tarefa na lista com o status "Em andamento"
        E devo ver também somente 1 tarefa o nome cadastrado
    

    @autenticado @logout 
    Cenario: Tarefa não pode ser duplicadas

        Dado que o nome da tarefa é "Ler um livro de go lang"
        E a data de conclusão é "10/06/2018"
        E eu quero tagear com:
            | tag      |
            | go       |
            | estudar  |
            | livro    |
            | leitura  |
            | hardcore |
        Mas eu já cadastrei esta tarefa e não tinha percebido
        Quando faço o cadastro desta tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar cadastrar
        E devo ver também somente 1 tarefa o nome cadastrado
        

        @autenticado @logout 
        Cenario: nome da tarefa deve possui no minimo 10 caracter

        Dado que o nome da tarefa é "erika"
        E a data de conclusão é "10/06/2018"
        E eu quero tagear com:
            | tag      |
            | mongodbE |
            | estudarE |
            | livroE   |
            | leituraE |
        Quando faço o cadastro desta tarefa        
        Então devo ver a mensagem "10 caracteres é o mínimo permitido." ao tentar cadastrar
        