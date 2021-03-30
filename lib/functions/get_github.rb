require 'rest_client'
require 'json'

# Find out the jerks that are not following you! :o =======================
module Functions
  
  module GetGithub
    def self.get_not_following_list(user)

      followers = []
      following = []

      may_have_next_page = true
      page_number = 1

      # Get Followers List ====================================================

      while may_have_next_page
        followers_url = "https://api.github.com/users/#{user}/followers?per_page=100&page=#{page_number}"
        followers_res = RestClient.get followers_url
        followers_json_res = JSON.parse(followers_res.body)

        (0..followers_json_res.length - 1).each { |i| followers.push(followers_json_res[i]) }
        
        if followers_json_res.length < 100
          may_have_next_page = false 
        else
          page_number += 1
        end
      end


      # Get Following List ====================================================

      may_have_next_page = true
      page_number = 1

      while may_have_next_page
        following_url = "https://api.github.com/users/#{user}/following?per_page=100&page=#{page_number}"
        following_res = RestClient.get following_url
        following_json_res = JSON.parse(following_res.body)

        (0..following_json_res.length - 1).each { |i| following.push(following_json_res[i]) }
        
        if following_json_res.length < 100
          may_have_next_page = false 
        else
          page_number += 1
        end
      end

      not_following = following - followers

      return not_following


    end
  end

end