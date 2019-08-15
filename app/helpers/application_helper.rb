module ApplicationHelper

  # ページタイトルが定義されている時はタイトルにbase_titleを付加して返し、
  # タイトルがない場合はbase_titleのみ返す
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
