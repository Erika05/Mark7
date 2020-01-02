
class CadastroPage < SitePrism::Page
    set_url '/register'   

    element :formulario,'#register_form'
    element :campo_nome,'#register_name'
    element :campo_email,'input[name=register_email]'
    element :campo_senha,'input[type=password]'
    element :botao_cadastrar,'button[type=submit]'
    element :div_alerta,'.alert-message'  
    
         
    def cadastrar(usuario)
        campo_nome.set usuario[:nome]
        campo_email.set usuario[:email]
        campo_senha.set usuario[:senha]
        botao_cadastrar.click
    end   
    
    
end
