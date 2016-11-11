module Display
  def self.view_complaints(complaints)
    print "
    -----------------------------------------------
    Complaints by
    -----------------------------------------------
    "
    complaints.each do |complaint|
      print complaint.to_s
      puts "\n"
    end
    # return nil
  end

  def command_prompt
  end

  def introduction
  end
end
