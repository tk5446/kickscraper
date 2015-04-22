module Kickscraper
    class Category < Api
        attr_accessor :projects

        def to_s
            name
        end

        def inspect
            "<Category: '#{to_s}'>"
        end

        def projects(page=nil)
            # return [] unless @projects || self.urls.web.discover
            api_url = self.urls.web.discover
            if page.present?
                api_url = "#{api_url}?state=live&page=#{page}"
            else
                api_url = "#{api_url}?state=live"
                # @projects ||= process_api_call(api_url, "", "state=live", page = page)
                # @projects ||= Kickscraper.client.process_api_url("Projects", api_url)
            end
            puts "api_url :: #{api_url}"
            @projects ||= Kickscraper.client.process_api_url("Projects", api_url)
        end
    end
end
