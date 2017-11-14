class Player

  attr_reader :proficiency, :min_desired_partner_proficiency, :name

  def initialize(name, proficiency, min_desired_partner_proficiency)
    @name, @proficiency, @min_desired_partner_proficiency = name, proficiency, min_desired_partner_proficiency
  end

  def satisfaction(partner_proficiency)
    if  partner_proficiency > @min_desired_partner_proficiency
      return 0
    else
      return partner_proficiency - @min_desired_partner_proficiency
    end
  end

end