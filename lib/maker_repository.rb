require_relative 'maker'

class MakerRepository
  def all
    makers = []
    
    sql = 'SELECT id, name, email, password FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      maker = Maker.new
      maker.id = record['id'].to_i
      maker.name = record['name']
      maker.email = record['email']
      maker.password = record['password']
    
      makers << maker
    end
    
    return makers
  end
  
  def find(id)
    sql = 'SELECT id, name, email, password FROM makers WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    maker = Maker.new
    maker.id = result_set[0]['id'].to_i
    maker.name = result_set[0]['name']
    maker.email = result_set[0]['email']
    maker.password = result_set[0]['password']
    
    return maker
  end
  
  
end