module ReposHelper
  def myTitle(vat)
    @r = Repository.find_by_vat(vat.to_s)
    if @r.nil?
      return vat.to_s
    else
      return cst(@r.name)
    end
  end

end
