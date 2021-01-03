class MatchController < ApplicationController
  def match
  	#step1：找出（同一研究所||同一地区所||同一家乡）&&(异性）&&（年龄不超过2岁)
  	myId= session[:user_id]
    myInfo = User.find(myId)
    userList =  User.where("(deptlocation=?)AND gender!=?",myInfo.deptlocation,myInfo.gender)


    #userList =  User.where("(dept = ? OR deptlocation=?)AND gender!=?",myInfo.dept,myInfo.deptlocation,myInfo.gender)
  	#以上语句找出了 （同一研究所||同一地区所||同一家乡）&&(异性）
  	# @users = User.where(:dept => @s)
  	#根据生日计算年龄差（数据库生日应该存为date类型而不是string）
  	#"19980905"-->"1998"-->1998--98 
    #"980905"-->98
    if myInfo.birthday.length>6
  	  myBirthday=(myInfo.birthday)[0,4].to_i
    else
      myBirthday=(myInfo.birthday)[0,2].to_i
    end
  	@users = Array.new
  	userList.each do |user|
      if user.birthday.length>6
        ub=(user.birthday)[0,4].to_i
      else
        ub=(user.birthday)[0,2].to_i
      end
  		  diff=myBirthday-ub
  		if diff.abs<=2
  			@users.push(user)
  		end
  	end
  end
end
	