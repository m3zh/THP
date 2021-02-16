require 'csv'
#require 'pry'
class Gossip
  attr_accessor :author,:content

  def initialize(gossip_author,gossip_content)
    @author = gossip_author
    @content = gossip_content
  end

  def save
    CSV.open("./db/gossip.csv","ab") { |line|
      line << [@author,@content]
    }
  end

  #def comment

  #end

  def self.update(new_author,new_content,id)
    csv = []
    CSV.open("./db/gossip.csv","r").each_with_index { |line,idx|
      if idx == id.to_i - 1
        line[0] = new_author
        line[1] = new_content
      end
        csv << line
    }
      CSV.open("./db/gossip.csv","w+") { |file|
        csv.each { |line|
          file << [line[0],line[1]]
      }
    }
  end

  def self.all
    all = []
    CSV.read("./db/gossip.csv").each { |line|
      all << Gossip.new(line[0],line[1])
    }
    return all
  end

  def self.find(id)
    return gossip = self.all[id-1]
  end
  #run! if app_file == $0
end

#binding.pry
