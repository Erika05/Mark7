

Before do
    @cadastro_page=CadastroPage.new
    @login_page=LoginPage.new
    @navbar=Navbar.new
    @tarefas_page=TarefasPage.new
    page.current_window.resize_to(1440,900)
end

#Before('@limpa_usuario')do
 #   visit '/api/reset/erika@qaninja.net?clean=full'
#end

Before('@autenticado')do
    @login_page.load
    @login_page.logar('teste@teste2.com.br','123456')
    @navbar.wait_for_nav
end

After('@logout') do
    #visit '/logout'
    #sleep 2
    @navbar.desloga
    @login_page.wait_for_campo_email
end

After do |scenarios|
    nome = scenarios.name.tr(' ','_').downcase!
    nome = nome.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'')
    xote = "log/shots/#{nome}.png"
    page.save_screenshot(xote)
    embed(xote, 'image/png', 'Clique aqui para ver o ScreenXOTE dos Milagres!')
end


