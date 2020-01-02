
#LoginPage e classe que representa a página Login
class  LoginPage < SitePrism::Page
    set_url '/login'    
    element :campo_email,'#login_email'
    element :campo_senha,'#login_password'
    element :botao_entrar,'button[id*=btnLogin]'
    element :alerta,'.alert-login'
        
    def logar(email,senha)
        campo_email.set email
        campo_senha.set senha
        botao_entrar.click
    end

end
