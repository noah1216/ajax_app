class PostsController < ApplicationController

  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC") # すべてのレコードを@postsに代入
  end

  # def new
  # end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
    # Post.create(content: params[:content])
    # redirect_to action: :index
    # 変更点は2カ所で、既読や未読の情報を追加したため
    #「メモ作成時に未読の情報を保存するようにしたこと」と
    # Ajaxを実現するため「レスポンスをJSONに変更したこと」
  end


  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json:{ post: item }
  end
# 既読であれば「既読を解除するためにfalseへ変更」し
# 既読でなければ「既読にするためtrueへ変更」します


end

