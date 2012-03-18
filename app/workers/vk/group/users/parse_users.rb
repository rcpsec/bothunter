class ParseUsers
  @queue = "bothunter"
  def self.perform
    persons = Person.where(state: :pending).to_a

    persons.each do |person|
      Vk::ProfileParse.perform person
    end
  end
end
