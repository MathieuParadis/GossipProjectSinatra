require 'pry'
require 'csv'

class Gossip
  attr_accessor :author
  attr_accessor :content


  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end 
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    return self.all[id-1]
  end
   

  def self.update(id, updated_author, updated_content)
    all_gossips = Gossip.all

    all_gossips[id-1].author = updated_author
    all_gossips[id-1].content = updated_content

    CSV.open("./db/gossip.csv", "w") do |csv|
      for i in 0..all_gossips.length-1
        csv << [all_gossips[i].author,all_gossips[i].content]
      end
    end 
  end

end
