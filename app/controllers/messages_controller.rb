class MessagesController < ApplicationController
  def new
  end
  def log 
    @user = User.new(user_params)   
    if User.find_by(name: @user.name)
      @user = User.find_by(name: @user.name)
      puts "ALREADY TAKEN #{@user.id}"
      session[:user_id] = @user.id
      redirect_to '/messages'
    elsif @user.save      
      puts "ITS WWWWWWWWORRRRRRRRRRRKKKKKKKKKING"
      session[:user_id] = @user.id
      redirect_to '/messages'  
    else
      puts "WWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPS"
      redirect_to '/users/new', alert: @user.errors.full_messages      
    end
  end

  def index
  	if session[:user_id]
  		@user = User.find_by(id: session[:user_id])      
  		puts "#{@user}"
  		puts "#{@user.name}"
  		@messages = Message.all
  	else
  		redirect_to '/users/new'  
  	end	
  end 
  def message    
  	@mess = Message.create(message_params)
  	if @mess.valid?
  		redirect_to '/messages'
  	else
  		redirect_to '/messages', alert: @mess.errors.full_messages
  	end
  end
  def comment
  	@comm = Comment.create(comment_params)
  	if @comm.valid?
  		redirect_to '/messages'
  	else
  		redirect_to '/messages', alert: @comm.errors.full_messages
  	end
  end
  def clear
    puts "WWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPSWWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPSWWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPS"  
    session.clear
    puts "WWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPSWWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPSWWWWWHHHHHHHHOOOOOOOOOOPPPPPPPPS"
    redirect_to new_user_path
  end
  private 
  def user_params
    params.require(:user).permit(:name)
  end
  def message_params
    params.require(:message).permit(:content, :user_id)
  end
  def comment_params
    params.require(:comment).permit(:content, :user_id, :message_id)
  end
end

