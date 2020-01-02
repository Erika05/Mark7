
Dado("que o nome da tarefa é {string}") do |nome_tarefa|
    @nome_tarefa=nome_tarefa
    DAO.new.remover_tarefas(@nome_tarefa) 
end

Dado("a data de conclusão é {string}") do |data_conclusao|
    @data_conclusao=data_conclusao
end

Dado("eu quero tagear com:") do |table_tags|
    @tags=table_tags.hashes
end

Dado("eu já cadastrei esta tarefa e não tinha percebido") do

    steps %(
        Quando faço o cadastro desta tarefa
    )
    
end

Quando("faço o cadastro desta tarefa") do
    @tarefas_page.botao_adicionar.click
    @tarefas_page.adicionar.nova(@nome_tarefa,@data_conclusao,@tags)
end

Então("devo ver esta tarefa na lista com o status {string}") do |status_tarefa|
    tarefa_cadastrada = find('table tbody tr',text: @nome_tarefa)
    expect(tarefa_cadastrada).to have_content status_tarefa
end

Então("devo ver a mensagem {string} ao tentar cadastrar") do |mensagem_alerta|
    res=@tarefas_page.adicionar.alerta.text
    expect(res).to eql mensagem_alerta
end

Então("devo ver também somente {int} tarefa o nome cadastrado") do |quantidade|
    @tarefas_page.load
    @tarefas_page.busca(@nome_tarefa)
    expect(@tarefas_page.lista.size).to eql quantidade
end

  

  # Apagar tarefa
Dado('que a tarefa indesejada é {string}') do |nome_tarefa|
    @tarefa = { nome: nome_tarefa, data: '10/07/2018', tags: [{"tag" => 'teste1'}, {"tag" => 'teste2'}]}
    DAO.new.remover_tarefas(@tarefa[:nome]) 
    @tarefas_page.botao_adicionar.click
    @tarefas_page.adicionar.nova(@tarefa[:nome],@tarefa[:data],@tarefa[:tags])    
end
  
Quando('eu solicito a exclusão desta tarefa') do
    para_remover = find('table tbody tr', text: @tarefa[:nome])
    para_remover.find('#delete-button').click
end
  
Quando('confirmo a solicitação de exclusão') do

    @tarefas_page.confirmarExclusao.click
end
  
Então('esta tarefa não deve ser exibida na lista') do
    @tarefas_page.busca(@tarefa[:nome])
    expect(@tarefas_page.lista.size).to eql 0
end
  
Quando('cancelo está solicitação de exclusão') do
    
    @tarefas_page.desistirExclusao.click
end
  
Então('continuo vendo está tarefa na lista') do
    @tarefas_page.busca(@tarefa[:nome])
    expect(@tarefas_page.lista.size).to eql 1
end
  
  