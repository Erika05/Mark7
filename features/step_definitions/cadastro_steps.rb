

Dado("que eu estou no formulário de cadastro") do
    @cadastro_page.load
end

Dado("possuo os seguintes dados:") do |table|
   @usuario= table.rows_hash
   DAO.new.remover_usuario(@usuario[:email])
end


Dado("já exite um cadastro para o email informado") do
    #steps %(
     #  Quando faço o meu cadastro
    #)
    #sleep 2
    #visit '/logout'
    #sleep 2
    #steps %(
     #    Dado que eu estou no formulário de cadastro
      #   )
     @cadastro_page.cadastrar(@usuario)
     @navbar.wait_for_nav
     @navbar.desloga
     @cadastro_page.wait_for_formulario
     @cadastro_page.load
end
  

Quando("faço o meu cadastro") do
    
    @cadastro_page.cadastrar(@usuario)
           
end

Então("vejo a mensagem {string}") do |ola_usuario|
    expect(page).to have_content ola_usuario
end


Então("vejo a mensagem de alerta {string}") do |mensagem_alerta|
   
   expect(@cadastro_page.div_alerta.text).to eql mensagem_alerta
     
end