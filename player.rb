class Player

  attr_reader :proficiency, :min_desired_partner_proficiency, :name

  def initialize(name, proficiency, min_desired_partner_proficiency)
    @name, @proficiency, @min_desired_partner_proficiency = name, proficiency, min_desired_partner_proficiency
  end

  def satisfaction(partner_proficiency)
    if partner_proficiency >= @min_desired_partner_proficiency
      0
    else
      (partner_proficiency - @min_desired_partner_proficiency).to_f
    end
  end

end