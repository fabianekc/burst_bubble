module ApplicationHelper
  def cst(tstr, lang: 'auto')
    if tstr =~ /<\w\w>/
      if lang == 'auto'
        mylocal = I18n.locale.to_s
      else
        mylocal = lang
      end
      if tstr =~ /<#{mylocal}/
        return tstr[(tstr =~/<#{mylocal}>/)+4..(tstr =~/<\/#{mylocal}>/)-1]
      else
        return tstr[(tstr =~/<\w\w>/)+4..(tstr =~/<\/??>/)-1]
      end
    else
      return tstr
    end
  end

end
