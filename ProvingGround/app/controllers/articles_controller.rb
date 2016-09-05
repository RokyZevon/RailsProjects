class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "Roky", password: "131410", except: [ :index, :show ]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		# render -> ( 目前姑且理解为"呈送", 作用是跳转 ); plain -> "to complain", "抱怨"; inspect -> "检查";
		# render 方法接受一个简单的 Hash 为参数，这个 Hash 的键是 plain，对应的值为 params[:article].inspect。params 方法表示通过表单提交的参数，返回 ActiveSupport::HashWithIndifferentAccess 对象，可以使用字符串或者 Symbol 获取键对应的值。
		# render && redirect_to => redirect_to 实现的是 action 方法的跳转, 向浏览器发起一个新的请求; render 仅仅渲染出一个新的模板, 没有执行相应的 action;
		# render plain: params[ :article ].inspect

		@article = Article.new( article_params )

		if @article.save
			redirect_to @article
		else
			render 'new' # render()才能在保存失败后把 @article 传给 new 动作的视图; 渲染操作和表单提交在同义词请求中完成, 而 redirect_to 会让浏览器发起一次新请求;
		end

	end

	def update

		@article = Article.find( params[ :id ] )

		if @article.update( article_params )
			redirect_to @article
		else
			render 'edit'
		end

	end

	def show

		@article = Article.find( params[ :id ] )

	end

	def edit
		@article = Article.find( params[ :id ] )
	end

	def destroy
		@article = Article.find( params[ :id ] )
		@article.destroy

		redirect_to articles_path
	end

	private
	def article_params
		# permit -> "允许"; permit() -> 这个方法允许在动作中使用 title 和 text 属性
		params.require( :article ).permit( :title, :text )
	end

end
