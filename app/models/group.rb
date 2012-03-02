#coding=utf-8
class Group
  include Mongoid::Document
  
  field :link, type: String
  field :name, type: String
  field :gid,  type: String
  field :domain, type: String
  field :title, type: String
  validates_presence_of :gid
  
  has_and_belongs_to_many :persons #, unique: true
  has_and_belongs_to_many :users   #, unique: true
  index :gid, background: true
  index :domain, background: true

  def self.report_persons gid
    #workbook = RubyXL::Workbook.new
    #serializer = ::SimpleXlsx::Serializer.new("/home/boris/me.xls") do |doc|
    #worbook = WriteExcel.new("/home/boris/me.xls")
    #sheet = worbook.add_worksheet("Живые")
    #sheet.write("Ссылка", "Имя", "Фамилия")

    doc = SimpleXlsx::Serializer.new("test.xlsx")
    sheet = doc.add_sheet("Живые")
    Group.where(gid: gid).first.persons.where(state: :human).each do |person|
      sheet.add_row(["http://vk.com/id#{person.uid}",person.first_name,person.last_name])
    end
    #workbook.close
   #(sheet,:human)
    #end

  end
end
