class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.room_id = auth['info']['room_id'] || ""
      end
    end
  end

  def update_credentials(oauth_data)
    self.update_column(:token, oauth_data.credentials.token)
  end

  def last_commented_at
    participation = Remotty::User.me(self.token).participation
    comments_res = Remotty.access_token(token).get("/api/v1/rooms/participations/#{participation.id}/comments.json").parsed
    Time.new(comments_res.last['created_at'])
  end

  def timeline(from = nil)
    begin
      from = Time.parse(from)
    rescue
      from = nil
    end
    participation = Remotty::User.me(self.token).participation
    timeline = Remotty.access_token(token).get(URI.encode("/api/v1/rooms/logs.json?from='#{from || last_commented_at}'")).parsed
    filtered_timeline = Array.new
    timeline.each do |comment|
      if comment['type'] == 'comment'
        filtered_timeline.push(comment)
      end
    end
    filtered_timeline
  end

end
