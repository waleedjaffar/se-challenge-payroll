require 'rails_helper'

RSpec.describe "JobGroups", type: :request do
  describe "GET /job_groups" do
    it "works! (now write some real specs)" do
      get job_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
