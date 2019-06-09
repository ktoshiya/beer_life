module PostsHelper
  def posts_title
    if params[:q]
      title = "#{params[:q][:beer_name_or_content_cont]} の検索結果"
    else
      title = "最近の投稿"
    end
  end
end
