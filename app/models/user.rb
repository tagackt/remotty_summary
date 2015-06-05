class User < ActiveRecord::Base

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
    Time.new(comments_res.last['created_at']).to_i
  end

  def timeline(from = nil)
    participation = Remotty::User.me(self.token).participation
    last_commented_at = nil
    timeline = Remotty.access_token(token).get(URI.encode("/api/v1/rooms/logs.json?from='#{from || last_commented_at}'")).parsed
    filtered_timeline = Array.new
    timeline.each do |comment|
      if comment['type'] == 'comment'
        filtered_timeline.push(comment)
      end
      last_commented_at = Time.parse(comment['created_at']).to_i
    end
    last_commented_at = nil if timeline.count < 20
    [filtered_timeline, last_commented_at]
  end

end
