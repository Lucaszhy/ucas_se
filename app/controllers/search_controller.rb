class SearchController < ApplicationController
	def searchUser
		@stmt = "name LIKE '%"+params[:users]+"%\'"
  		@users =  User.where(@stmt)
	end
	def searchPost
		@stmt = "content LIKE '%"+params[:posts]+"%\'"
  		@microposts=  Micropost.where(@stmt)
	end
end
