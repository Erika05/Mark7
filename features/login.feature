
#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tasks
    Sendo um usuário cadastrado
    Posso logar no sistema

    Contexto: Forulário 
        Dado que acessei a tela de login

    @login @logout @smoke
    Cenário: Login do usuário
        Quando faço login com "teste@teste2.com.br" e "123456"
        Então sou autenticado com sucesso
        
    
    
     Esquema do Cenário: Erro login    
     Quando faço login com "<email>" e "<senha>"
     Então é exibido mensagem de alerta "<saida>"

     Exemplos:
     | email               | senha  | saida                       |
     | teste@teste2.com.br | 123458 | Senha inválida.             |
     | teste@teste2.com.br |        | Senha ausente.              |
     | erika@qa.net        | 123456 | Usuário não cadastrado.     |
     | erika#qaninj.net    | 123456 | Email incorreto ou ausente. |
     |                     | 123456 | Email incorreto ou ausente. |
     