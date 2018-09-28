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
      { text: 'スポット一覧', path: spots_path },
      { text: 'スポット検索', path: search_path },
      { text: 'エリア一覧', path: prefs_path },
    ]
      
    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html += %Q(<li class="nav-item"><a href="#{path}" class="nav-link#{sidebar_activate(path)}"><i class="fa fa-chevron-right"></i> #{text}</a></li>)
    end
      
    raw(html)
  end
  
  def user_icon_thumb(user)
    if user.image.present?
      image_tag user.image.thumb.url, class: 'thumb'
    else
      image_tag 'user_default_300.png', class: 'thumb'
    end
  end
  
  def user_icon_thumb100(user)
    if user.image.present?
      image_tag user.image.thumb100.url, class: 'thumb'
    else
      image_tag 'user_default_100.png', class: 'thumb'
    end
  end
  
  def user_icon_thumb60(user, cls)
    if user.image.present?
      image_tag user.image.thumb60.url, class: 'thumb ' + cls
    else
      image_tag 'user_default_100.png', class: 'thumb ' + cls
    end
  end
  
  def review_thumb300(picture, cls)
    if picture.image.present?
      image_tag picture.image.thumb300.url, class: 'thumb ' + cls
    else
      image_tag 'review_no_image_300.png', class: 'thumb ' + cls
    end
  end
  
end
