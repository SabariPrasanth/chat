class FriendsController < ApplicationController
  def home
  	@users = User.all
  end
    @@k = 1

  def communication
	  	user_one = User.find_by_email($login_user)
	  	user_two = User.find(params[:user_id])
	  	@user_two = user_two.id
	      #@user = User.where(:email => params["email"], :password => params["password"])
	    @thread1 = MessageThread.where(:user_id_one => user_one.id, :user_id_two => params[:user_id])
	    @thread2 = MessageThread.where(:user_id_one => params[:user_id], :user_id_two => user_one.id)
	    if @thread1.present? 
	       
	       @chat = Chat.where(:message_thread_id => @thread1.first.id )

	     
           
	    elsif @thread2.present?
           @chat = Chat.where(:message_thread_id => @thread2.first.id )
           
           
	    else
	    	
		    @thread = MessageThread.new
		    @thread.user_id_two = params[:user_id]
		    @thread.user_name_two = user_two.name
		    @thread.user_id_one = user_one.id
		    @thread.user_name_one =user_one.name
		    @thread.save
		    @@super_thread = @thread

		    @chat = Chat.new
		    @chat.message_thread_id = @thread.id
		    @chat.body = user_one.name+": started the conversation"
		    @chat.save
		    @chat = Chat.where(:message_thread_id => @thread.id )
	   	end
	end

	def add_chat
		    user_one = User.find_by_email($login_user)
            chat = Chat.new
		    chat.message_thread_id = params[:m_t_id]
		    chat.body = user_one.name+": " + params[:chat]
		    chat.save
		    @chat=""
		    @chat1 =  Chat.where(:message_thread_id => params[:m_t_id])

		    return "/friends/communication?user_id=<%=params[:opp_user]%>" 
    end
end
