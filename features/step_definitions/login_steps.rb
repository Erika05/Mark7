
  Dado("que acessei a tela de login") do
   # @login_page=LoginPage.new
    #@navbar=Navbar.new
    @login_page.load
  end

  Quando("faço login com {string} e {string}") do |email, senha|
   
    @login_page.logar(email,senha)

    @email=email
  end
 
  Então ("sou autenticado com sucesso") do
     expect(@navbar.nav).to have_content @email
     @tarefas_page.wait_for_lista
  end

  Então("é exibido mensagem de alerta {string}") do |mensagem|
    expect(@login_page.alerta.text).to have_content mensagem
  end


