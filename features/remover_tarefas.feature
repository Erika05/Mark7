#language: pt

Funcionalidade: Remover uma tarefa
    Para que eu possa deixar minhas tarefas organizadas
    Sendo um usuário que criou uma tarefa indesejada
    Posso excluir uma tarefa
    
    @autenticado @logout
    Cenario: Apagar uma tarefa indesejada

        Dado que a tarefa indesejada é "Tarefa muito boa para ser removida"
        Quando eu solicito a exclusão desta tarefa
        E confirmo a solicitação de exclusão
        Então esta tarefa não deve ser exibida na lista

    @autenticado @logout 
    Cenario: Desistir da remoção

        Dado que a tarefa indesejada é "Tarefa muito boa para desistir da remoção"
        Quando eu solicito a exclusão desta tarefa
        E cancelo está solicitação de exclusão
        Então continuo vendo está tarefa na lista