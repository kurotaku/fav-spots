module ApplicationHelper
  def sidebar_activate(link)
    current_url = request.headers['PATH_INFO']
    if current_url.match(link)
      ' active"'
    else
      ''
    end
  end
  
  def sidebar_list_items
    items = [
      { text: 'スポット登録', path: new_spot_path },
    ]
      
    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html += %Q(<li class="nav-item"><a href="#{path}" class="nav-link#{sidebar_activate(path)}"><i class="fa fa-chevron-right"></i> #{text}</a></li>)
    end
      
    raw(html)
  end
end
