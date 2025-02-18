require 'terminal-table'

def retirada_estoque(produtos)
  mensagem('Digite o id do produto que deseja efetuar uma retirada de estoque', 0, false)
  table = Terminal::Table.new do |t|
    t.headings = ['ID', 'Nome', 'Quantidade']
    produtos.each do |row|
      t.add_row([row[:id], row[:nome], row[:qtd]])
    end
  end
  puts table
  produto_id = gets.to_i
  produto = produtos.find { |p| p[:id] == produto_id }
  if produto.nil?
    mensagem(set_color('Produto inválido, escolha novamente', 'fail'), 3, false)
    retirada_estoque(produtos)
  else
    mensagem("Estoque atual do produto #{produto[:nome]} é de #{produto[:qtd]}. Quanto deseja remover?", 0, false)
    quantidade = gets.to_i
    produto[:qtd] -= quantidade

    mensagem(set_color('Quantidade retirada com sucesso', 'ok_green'), 3)
  end
end