require "rails_helper"

RSpec.describe DashboardsController, type: :controller do
  let(:base_route) { 'dashboards/' }

  describe "POST create" do
    let(:delivery) { build(:delivery) }
    let(:file) { fixture_file_upload('example_input.tab') }

    context "when is all right with file" do
      before do
        post :create, params: { use_route: base_route, parser: {"file_data"=>file} }
      end

      it "render show view" do
        expect(subject).to render_template(:show)
      end

      it "return 200" do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end