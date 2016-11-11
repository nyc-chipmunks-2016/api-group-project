class Complaint
  attr_reader :created_date, :closed_date, :agency, :complaint_type, :descriptor, :location_type,
              :incident_zip, :incident_address, :address_type, :city, :facility_type, :status, :borough

  def initialize(args={})
    @unique_key = args.fetch(:unique_key,0)
    @created_date = args.fetch(:created_date,"")
    @closed_date = args.fetch(:closed_date,"")
    @agency = args.fetch(:agency,"")
    @complaint_type = args.fetch(:complaint_type,"")
    @descriptor = args.fetch(:descriptor,"")
    @location_type = args.fetch(:location_type,"")
    @incident_zip = args.fetch(:incident_zip, 00000)
    @incident_address = args.fetch(:incident_address,"")
    @address_type = args.fetch(:address_type,"")
    @city = args.fetch(:city,"")
    @facility_type = args.fetch(:facility_type,"")
    @status = args.fetch(:status,"")
    @due_date = args.fetch(:due_date,"")
    @resolution_description = args.fetch(:resolution_description,"")
    @resolution_action_updated_date = args.fetch(:resolution_action_updated_date,"")
    @borough = args.fetch(:borough,"")
  end

  def to_s
    <<-STRING
      Created: #{created_date}
      Status: #{status}#{"\n      Closed: #{closed_date}\n" if !["",nil].include? closed_date}
      Type: #{location_type + " > " if !["",nil].include? location_type}#{complaint_type}
      Description: #{descriptor}
      Location: #{incident_address}, #{city} #{incident_zip}
      Borough: #{borough}
    STRING
  end

  def read(attribute)
    case attribute
    when "agency"
      self.agency

    when "zip code"
      self.incident_zip

    when "complaint type"
      self.complaint_type

    end
  end
end
