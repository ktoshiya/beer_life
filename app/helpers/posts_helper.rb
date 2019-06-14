# frozen_string_literal: true

module PostsHelper
  def posts_title
    title = if params[:q]
              "#{params[:q][:beer_name_or_content_cont]} の検索結果"
            else
              '最近の投稿'
            end
  end
end
